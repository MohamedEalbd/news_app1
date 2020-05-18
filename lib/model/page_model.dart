import 'package:flutter/material.dart';

class PageModel {
  final Color colors;
  final IconData icons;
  final  String titles;
  final String desprection;

  PageModel(this.colors, this.icons, this.titles, this.desprection);

}
List<PageModel> lists = [
  PageModel( Color(0xff36454F), Icons.ac_unit, 'Welcome!', "Making friends is easy as waving your hand back and forth in easy step",),
  PageModel( Color(0xff36423f), Icons.today, 'Today', "Making friends is easy as waving your hand back and forth in easy step",),
  PageModel( Color(0xff36454F), Icons.print, 'Print', "Making friends is easy as waving your hand back and forth in easy step",),
  PageModel( Color(0xff36423f), Icons.map, 'Map', "Making friends is easy as waving your hand back and forth in easy step",)
];