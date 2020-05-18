import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/page_model.dart';
import 'home_screen.dart';

class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  final pageIndexNotifier = ValueNotifier<int>(0);
  int curentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            itemCount: lists.length,
            onPageChanged: (index) => pageIndexNotifier.value = index,
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: ExactAssetImage('assets/images/pg.png'),
//                          fit: BoxFit.cover,
//                        ),
                      color: lists[index].colors,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        offset: Offset(0, -120),
                        child: Icon(
                          lists[index].icons,
                          size: 150.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        lists[index].titles,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 48.0, right: 48, top: 10),
                        child: Text(
                          lists[index].desprection,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white30,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          Transform.translate(
            offset: Offset(0, 140),
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  child: PageViewIndicator(
                    pageIndexNotifier: pageIndexNotifier,
                    length: lists.length,
                    normalBuilder: (animationController, index) => Circle(
                      size: 8.0,
                      color: Colors.grey,
                    ),
                    highlightedBuilder: (animationController, index) =>
                        ScaleTransition(
                      scale: CurvedAnimation(
                        parent: animationController,
                        curve: Curves.ease,
                      ),
                      child: Circle(
                        size: 8.0,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: 40,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red[800])),
                  color: Colors.red[800],
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        updateSeen();
                        return Home();
                      },
                    ),
                  ),
                  child: Text(
                    'Get STARTED',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void updateSeen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}

class PageModel {
  final Color colors;
  final IconData icons;
  final String titles;
  final String desprection;

  PageModel(this.colors, this.icons, this.titles, this.desprection);
}
