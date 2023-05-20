import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/ItemsWidgets.dart';

class AsliPage extends StatefulWidget {
  final int token;
  const AsliPage({Key? key, required this.token}) : super(key: key);
  @override
  _AsliPageState createState() => _AsliPageState();
}

class _AsliPageState extends State<AsliPage> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDECF2),
      appBar: AppBar(
        backgroundColor: Color(0xFFEDECF2),
        title: Text('Bunga Asli', style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black.withOpacity(0.7),
          tabs: [
            Tab(text: 'Terlaris'),
            Tab(text: 'Terbaru'),
            Tab(text: 'Harga'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              showSearch(context: context, delegate: CustomSearchDelegate());
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: ItemsWidget(token: widget.token),),
    SingleChildScrollView(
    child: ItemsWidget(token: widget.token),),
    SingleChildScrollView(
    child: ItemsWidget(token: widget.token),),
        ],
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Color(0xFFEDECF2),
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.black),
      primaryColorBrightness: Brightness.light,
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(
          color: Colors.black,
          fontSize: 18.0,
        ),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(color: Color(0xFFEDECF2)); // Change background color here
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(color: Color(0xFFEDECF2)); // Change background color here
  }
}

