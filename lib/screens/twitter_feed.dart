import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/widget/drawer_app.dart';

class TwitterFeed extends StatefulWidget {
  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twitter Feeds"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: DrawerApp(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top:8.0,left: 8.0,right: 8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    _cardHeader(),
                    _cardBody(),
                    Divider(
                      thickness: .4,
                      color: Colors.grey,
                    ),
                    _cardFooter(),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _cardHeader() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: ExactAssetImage('assets/images/images.png'),
        radius: 24,
      ),
      title: Row(
        children: <Widget>[
          Text(
            'Mohamed Bahaa',
            style: TextStyle(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Text(
            '@Gmail.com',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      subtitle: Text(
        'Fri , May 2017+14.30',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _cardBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 8),
      child: Text(
          'Making emergency supplemental appropriations for the fiscal year ending September 30, 2020, and for other purposes',
        style: TextStyle(fontSize: 16,height: 1.5,color: Colors.grey.shade900),
    ),
    );
  }

  Widget _cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.repeat,
                  color: Colors.orange,
                  size: 28,
                ),
                onPressed: () {}),
            Text('25',style: TextStyle(color: Colors.grey,fontSize: 16),),
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: TextStyle(color: Colors.orange),
                )),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(color: Colors.orange),
                ))
          ],
        ),
      ],
    );
  }
}
