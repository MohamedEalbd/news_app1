import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/screens/home_screen.dart';
import 'package:newsapp/utilites/app_them.dart';
import 'screens/splach_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
//  WidgetsFlutterBinding.ensureInitialized();
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  bool seen = prefs.getBool('seen');
//  Widget _screen ;
//  if(seen == null || seen == false){
//  _screen = SplachScreen();
//  }else{
//    //Go To Home
//    _screen = Home();
//  }
//  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
//      .then((_) {
//    runApp(NewsApp(screen: _screen,));
// });
runApp(NewsApp());
}



class NewsApp extends StatelessWidget {
 final Widget screen;
  NewsApp({this.screen});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThem.appThem,
      home: SplachScreen(),
    );
  }
}
