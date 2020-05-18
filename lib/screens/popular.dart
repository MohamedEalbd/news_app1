import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (context,index){
           return _drawSingleRow();
      }),
    );
  }
  Widget _drawSingleRow() {
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
}
