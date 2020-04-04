import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

//class _HomeActivityState extends State<HomeActivity> {
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Color(0xffF1F1F2),
//        body: Container(
//          child: Column(
//            children: <Widget>[
//              RaisedButton(
//                child: Text('Sales Bar Chart'),
//                onPressed: () {
//                  Navigator.pushNamed(context, '/salesHome');
//                },
//              ),
//              RaisedButton(
//                child: (Text('my chart')),
//                onPressed: () {
//                  Navigator.pushNamed(context, '/sample');
//                },
//              ),
//              RaisedButton(
//                child: Text('Man Hours'),
//                onPressed: () {
//                  Navigator.pushNamed(context, '/transit');
//                },
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1F1F2),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) - 50,
                //color: Colors.red,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) - 50,
                //color: Colors.green,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff141d26),
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: Color(0xff141d26)),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                //color: Colors.yellow,
                width: MediaQuery.of(context).size.width - 100,
                height: 100.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
