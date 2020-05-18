import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/api/author_api.dart';
import 'package:newsapp/api/post_api.dart';
import 'dart:async';

import 'package:newsapp/model/post.dart';

AuthorApi authorApi = AuthorApi();
class WhatsNew extends StatefulWidget {
  @override
  _WhatsNewState createState() => _WhatsNewState();
}

class _WhatsNewState extends State<WhatsNew> {
  PostAPI postAPI = PostAPI();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
            children: <Widget>[
              _header(),
              _body('Top Stories'),
             _futureDrawSingleRow(),
              _body('Recent Update'),
              _drawRecentUpdate(title: 'SPORT',subTile: 'Vettal is Ferrari Number one - Hamilton'),
              _drawRecentUpdate(title: 'LIFESTYLE',subTile: 'The City in Pakistan that Loves a British Hairstyles'),
              SizedBox(height: 48,),
            ],
      ),
    );
  }
Widget _futureDrawSingleRow(){
    return  FutureBuilder(
      future: postAPI.fetchWhatsNew(),
      builder: (BuildContext context,AsyncSnapshot snapShot){
//        Post post = snapShot.data[1];
//          Post post2 = snapShot.data[1];
//          Post post3 = snapShot.data[2];
      if(!snapShot.hasData){
        return Container(
          child: Center(
            child: Text("Loading1..."),
          ),
        );
      } else {
        return Column(
          children: <Widget>[
            _drawSingleRow(),
            Divider(
              color: Colors.grey,
            ),
            _drawSingleRow(),
            Divider(
              color: Colors.grey,
            ),
            _drawSingleRow(),
          ],
        );
      }

      },
    );
}
  Widget _header() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .3,
      decoration: BoxDecoration(color: Colors.black),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'How Mohamed Will be in Relationship',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade800,
                    letterSpacing: .5,
                    fontWeight: FontWeight.w500),
              ),
            ],
          )),
    );
  }

  Widget _drawSingleRow({Post post}) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 8.0),
      child: Card(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    height: MediaQuery.of(context).size.height * .19,
                    child: Image(
                      image: ExactAssetImage('assets/images/images.png'),
                      fit: BoxFit.cover,
                    )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, right: 15, left: 15, bottom: 8),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "The Covid 19 is very dangerous",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Mohamed Bahaa'),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.timer),
                                  Text('15m'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _drawRecentUpdate({String title,String subTile}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: ExactAssetImage(
                      'assets/images/images.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16),
              child: Container(
                width: MediaQuery.of(context).size.width * .24,
                decoration: BoxDecoration(
                  color: title == 'SPORT' ? Colors.deepOrange : Colors.teal,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, top: 16, bottom: 8, right: 16),
              child: Text(
                subTile,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 16,right: 16,bottom: 16),
                child: Row(
                children: <Widget>[
                  Icon(Icons.timer,color: Colors.grey,size: 18,),
                  SizedBox(width: 4,),
                  Text('15 min',style: TextStyle(color: Colors.grey,fontSize: 16),)
                ],
            ),
              ),
          ],
        ),
      ),
    );
  }
}
