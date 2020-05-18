import 'package:flutter/material.dart';
import 'package:newsapp/widget/drawer_app.dart';

class FacebookFeeds extends StatefulWidget {
  @override
  _FacebookFeedsState createState() => _FacebookFeedsState();
}

class _FacebookFeedsState extends State<FacebookFeeds> {
  TextStyle _textStyle = TextStyle(color: Colors.orange);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Feeds"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      drawer: DrawerApp(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _drawHeader(),
                    _drawTitle(),
                    _drawHashTags(),
                    _drawbody(),
                    _drawFooter(),
                  ],
                ),
              ),
            );
          }),
    );
  }
  Widget _drawHeader() {
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
        ],
      ),
      subtitle: Text(
        'Fri , May 2017+14.30',
        style: TextStyle(color: Colors.grey),
      ),
      trailing: Container(
        width: MediaQuery.of(context).size.width * .161,
        child: Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey.shade400,
                ),
                onPressed: () {}),
            Transform.translate(
                offset: Offset(-10, 0),
                child: Text(
                  '25',
                  style: TextStyle(color: Colors.grey.shade400),
                ))
          ],
        ),
      ),
    );
  }
  Widget _drawTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 16, right: 16),
      child: Text(
        'We also talk about the future of work as the robots',
        style: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }

  Widget _drawHashTags() {
    return Wrap(
      //crossAxisAlignment: WrapCrossAlignment.start,
      children: <Widget>[
        FlatButton(
            onPressed: () {},
            child: Text(
              '#advance',
              style: _textStyle,
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              '#reto',
              style: _textStyle,
            )),
        FlatButton(
            onPressed: () {},
            child: Text(
              '#instagram',
              style: _textStyle,
            )),
      ],
    );
  }

  Widget _drawbody() {
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .3,
        child: Image(
          image: ExactAssetImage('assets/images/images.png'),
          fit: BoxFit.cover,
        ));
  }

  Widget _drawFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(onPressed: (){}, child: Text('10 COMMENTS',style: _textStyle,)),
        Row(
          children: <Widget>[
            FlatButton(onPressed: (){}, child: Text('SHARE',style: _textStyle,)),
            FlatButton(onPressed: (){}, child: Text('OPEN',style: _textStyle,))
          ],
        )
      ],
    );
  }
}
