import 'package:flutter/material.dart';
import 'package:newsapp/api/author_api.dart';
import 'package:newsapp/api/categories_api.dart';

import 'package:newsapp/screens/whats_new.dart';
import 'package:newsapp/widget/drawer_app.dart';
import 'favoutites.dart';
import 'popular.dart';

enum popOutMenu {
  HELP,
  ABOUT,
  CONTACT,
  SETTING
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
 CategoriesAPI categoriesAPI = CategoriesAPI();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
           _popOutMenu(),
        ],
        bottom: TabBar(
          tabs: [
            Tab(text: 'WHATS NEW',),
            Tab(text: 'POPULAR',),
            Tab(text: 'FAVOURITES',),
          ],
          controller: _tabController,
          indicatorColor: Colors.white,
        ),
      ),
      drawer: DrawerApp(),
      body: Center(
        child: TabBarView(
            controller: _tabController,
            children: [
              WhatsNew(),
              Popular(),
              Favourites()
            ]),
      ),
    );
  }

  Widget _popOutMenu() {
    return PopupMenuButton<popOutMenu>(itemBuilder: (context) {
      return [
        PopupMenuItem<popOutMenu>(
            value: popOutMenu.ABOUT,
            child: Text('ABOUT')),
        PopupMenuItem<popOutMenu>(
            value: popOutMenu.CONTACT,
            child: Text('CONYACT')),
        PopupMenuItem<popOutMenu>(
            value: popOutMenu.HELP,
            child: Text('HELP')),
        PopupMenuItem<popOutMenu>(
            value: popOutMenu.SETTING,
            child: Text('SETTING')),
      ];
    }, onSelected: (popOutMenu menu) {

    },);
  }


}
