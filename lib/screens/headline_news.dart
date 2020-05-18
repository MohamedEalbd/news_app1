import 'package:flutter/material.dart';
import 'package:newsapp/screens/whats_new.dart';
import 'package:newsapp/widget/drawer_app.dart';

import 'favoutites.dart';
import 'popular.dart';

class HeadLine extends StatefulWidget {
  @override
  _HeadLineState createState() => _HeadLineState();
}

class _HeadLineState extends State<HeadLine> with SingleTickerProviderStateMixin{
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController  = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HeadLine News",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: (){}),
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
              Favourites(),
              Popular(),
              Favourites()
            ]),
      ),
    );
  }
}
