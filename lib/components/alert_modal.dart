import 'package:flutter/material.dart';

class AlertModalButton {
  static Future show(
    BuildContext context, {
    String? title,
    Widget? body,
    required Function() onClickPositif,
    double? aspectRatio,
    String? titlePositifBtn,
    String? titleNegativeBtn,
    Color? colorPositiveBtn,
    Color? colorNegativeBtn,
    bool visiblePositiveBtn = true,
    bool visibleNegativeBtn = true,
  }) async {
    return await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      enableDrag: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            title ?? "Hapus pesanan",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(Icons.clear, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(thickness: 1),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
                  child: body ??
                      Text(
                        "Apakah Anda yakin ingin menghapus\npesanan ini? ",
                        style: TextStyle(fontSize: 18),
                      ),
                ),
                SafeArea(
                  child: Container(
                    margin: EdgeInsets.all(24),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              child: Text(
                                titleNegativeBtn ?? "Batal",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: SizedBox(
                            height: 48,
                            child: ElevatedButton(
                              child: Text(
                                "Ya",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                onClickPositif();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
