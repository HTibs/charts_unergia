import 'package:flutter/material.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charts'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Sales Bar Chart'),
              onPressed: () {
                Navigator.pushNamed(context, '/salesHome');
              },
            ),
            RaisedButton(
              child: (Text('my chart')),
            ),
          ],
        ),
      ),
    );
  }
}
