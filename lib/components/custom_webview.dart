import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:ta/components/alert_modal.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWebview extends StatefulWidget {
  final String? redirectUrl;
  final Widget? title;
  final bool isNotPayment;

  const CustomWebview(
      {super.key, this.redirectUrl, this.title, this.isNotPayment = false});

  @override
  _CustomWebviewState createState() => _CustomWebviewState();
}

class _CustomWebviewState extends State<CustomWebview> {
  final GlobalKey webViewKey = GlobalKey();
  bool canGoback = false;

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
      allowFileAccessFromFileURLs: true,
      allowUniversalAccessFromFileURLs: true,
      javaScriptEnabled: true,
      javaScriptCanOpenWindowsAutomatically: true,
      useOnDownloadStart: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      domStorageEnabled: true,
      databaseEnabled: true,
      clearSessionCache: true,
      thirdPartyCookiesEnabled: true,
      allowFileAccess: true,
      allowContentAccess: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
      applePayAPIEnabled: true,
    ),
  );
  PullToRefreshController? pullToRefreshController;
  List<String> siteTempUrl = [];

  bool isSuccessCheckout() {
    bool isSuccess = false;
    for (int i = 0; i < siteTempUrl.length; i++) {
      final url = siteTempUrl[i];
      if (url.contains("https://checkout.xendit.co/web/")) {
        isSuccess = true;
        return true;
      }
      if (url.contains("/thank_you")) {
        isSuccess = true;
        return true;
      }
      // if (url.contains("https://$_baseUrl/pages/payment-confirmation")) {
      //   isSuccess = true;
      //   return true;
      // }
      if (url.contains("whatsapp.com")) {
        isSuccess = true;
        return true;
      }
    }
    return isSuccess;
  }

  String? url = "";
  double progress = 0;
  final urlController = TextEditingController();

  void init() async {
    url = widget.redirectUrl;

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
        size: AndroidPullToRefreshSize.LARGE,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<bool> _onWillPop() async {
    if (widget.isNotPayment) {
      return true;
    } else {
      await AlertModalButton.show(
        context,
        title: "Keluar dari checkout",
        body: const Text(
          "Apakah Anda yakin ingin meninggalkan halaman checkout?",
          style: TextStyle(fontSize: 18),
        ),
        titlePositifBtn: "Keluar",
        colorPositiveBtn: Colors.red,
        onClickPositif: () {
          if (isSuccessCheckout()) {
            Navigator.pop(context, true);
          } else {
            Navigator.pop(context);
          }
        },
      );
    }
    return true;
  }

  bool isPaymentSelected = false;

  ContextMenu? contextMenu;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: !widget.isNotPayment ? true : false,
        backgroundColor: Colors.white,
        title: widget.title ?? Text('Checkout'),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight:
              !widget.isNotPayment ? FontWeight.w600 : FontWeight.normal,
        ),
        leading: IconButton(
          icon: Icon(Icons.clear, size: 16, color: Colors.black),
          onPressed: () {
            _onWillPop();
          },
        ),
        elevation: 1,
        actions: [
          Visibility(
            visible: canGoback,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 16, color: Colors.black),
              onPressed: () {
                webViewController?.goBack();
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.refresh, size: 16, color: Colors.black),
            onPressed: () {
              webViewController?.reload();
            },
          ),
        ],
      ),
      body: WillPopScope(
        onWillPop: _onWillPop,
        child: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                key: webViewKey,
                initialUrlRequest: URLRequest(
                  url: Uri.parse("${widget.redirectUrl}"),
                ),
                initialOptions: options,
                pullToRefreshController: pullToRefreshController,
                onWebViewCreated: (controller) {
                  webViewController = controller;
                },
                onDownloadStartRequest: (controller, downloadStartRequest) {
                  log("onDownloadStartRequest ${downloadStartRequest.url.toString()}");
                },
                onCreateWindow: (controller, createWindowAction) async {
                  log("onCreateWindow ${createWindowAction.request.url.toString()}");
                },
                onAjaxReadyStateChange: (controller, ajaxRequest) async {
                  log("onAjaxReadyStateChange ${ajaxRequest.url.toString()}");
                },
                onLoadResource: (controller, resource) {
                  log("onLoadResource ${resource.url.toString()}");
                },
                onLoadResourceCustomScheme: (controller, url) async {
                  log("onLoadResourceCustomScheme ${url.toString()}");
                },
                onLoadHttpError: (controller, url, statusCode, description) {
                  log("onLoadHttpError[$statusCode] ${url.toString()}");
                },
                onLoadStart: (controller, url) {
                  log("onLoadStart => ${url.toString()}");

                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url!;
                  });
                },
                androidOnPermissionRequest:
                    (controller, origin, resources) async {
                  return PermissionRequestResponse(
                      resources: resources,
                      action: PermissionRequestResponseAction.GRANT);
                },
                shouldOverrideUrlLoading: (controller, navigationAction) async {
                  var action = navigationAction.request;
                  siteTempUrl.add(action.url.toString());
                  log("On Action => ${action.url.toString()}");

                  var url = navigationAction.request.url;

                  if (url != null &&
                      ![
                        "http",
                        "https",
                        "file",
                        "chrome",
                        "data",
                        "javascript",
                        "about"
                      ].contains(url.scheme)) {
                    // Launch the App
                    await launchUrl(url);
                    // and cancel the request
                    return NavigationActionPolicy.CANCEL;
                  }

                  return NavigationActionPolicy.ALLOW;
                },
                onLoadStop: (controller, url) async {
                  log("onLoadStop => ${url.toString()}");
                  pullToRefreshController!.endRefreshing();
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url!;
                  });
                },
                onLoadError: (controller, url, code, message) {
                  log("onLoadError => ${url.toString()}");
                  pullToRefreshController!.endRefreshing();
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100) {
                    pullToRefreshController!.endRefreshing();
                  }
                  setState(() {
                    this.progress = progress / 100;
                    urlController.text = this.url!;
                  });
                },
                onUpdateVisitedHistory:
                    (controller, url, androidIsReload) async {
                  canGoback = await webViewController?.canGoBack() ?? false;
                  log("Can $canGoback");
                  setState(() {});
                  log("onUpdateVisitedHistory => ${url.toString()}");
                  setState(() {
                    this.url = url.toString();
                    urlController.text = this.url!;
                  });
                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                },
              ),
              progress < 1.0
                  ? LinearProgressIndicator(value: progress)
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
