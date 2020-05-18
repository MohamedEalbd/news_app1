import 'dart:math';

import 'package:flutter/material.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Color> colors = [
    Colors.red,
    Colors.teal,
    Colors.deepOrange,
    Colors.indigo,
    Colors.brown,
    Colors.purple,
  ];
  Random random = Random();

  Color _getRandomColor() {
    return colors[random.nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  _authorRow(),
                  SizedBox(height: 16,),
                  _newItemsRow(),
                ],
              ),
            ),
          );
        });
  }

  Widget _authorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/images.png'),
                  fit: BoxFit.cover,
                ),
              ),
              width: 50,
              height: 50,
              margin: EdgeInsets.only(right: 13),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Mohamed Bahaa',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '15 Min  .',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      ' Life Style',
                      style: TextStyle(color: _getRandomColor()),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
        IconButton(icon: Icon(Icons.bookmark), onPressed: () {}),
      ],
    );
  }

  Widget _newItemsRow() {
    return Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width *.32,
          height: MediaQuery.of(context).size.height * .2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: ExactAssetImage('assets/images/images.png'),fit: BoxFit.cover),
          ),
          margin: EdgeInsets.only(right: 16),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text( 'Tech Teen : Old Phones and safe social',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
              Text('Accidentally deleting old text messages is a very common mistake among mobile users.'
                  ' Text message conversations often hold important information and losing that information can be problematic',
              style: TextStyle(color: Colors.grey,
              fontSize: 16,
              height: 1.25),),
            ],
          ),
        )
      ],
    );
  }
}
