import 'package:flutter/material.dart';
import 'package:newsapp/model/nav_menu.dart';
import 'package:newsapp/screens/facebook_feed.dart';
import 'package:newsapp/screens/headline_news.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/screens/instagram_feed.dart';
import 'package:newsapp/screens/twitter_feed.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  List<NavMenuItem> navMenuItem = [
    NavMenuItem(title:'Explore',  destanition:()=> Home() ),
    NavMenuItem(title: 'Headline News',destanition:()=> HeadLine()),
    NavMenuItem(title:  'Twitter Feeds', destanition: () => TwitterFeed() ),
    NavMenuItem(title:  'Instagram Feeds', destanition: () => InstagramFeeds() ),
    NavMenuItem(title:  'Facebook Feeds', destanition: () => FacebookFeeds() ),
    NavMenuItem(title:  'Settings', ),
    NavMenuItem(title:  'Logout', ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top:70,left:24.0),
        child: ListView.builder(
            itemCount: navMenuItem.length,
            itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: (){
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => navMenuItem[index].destanition()));
              },
              title: Text('${navMenuItem[index].title}'),
              trailing: Icon(Icons.arrow_forward_ios),

            ),
          );
        }),
      )
    );
  }
}
