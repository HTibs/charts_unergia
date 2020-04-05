import 'package:flutter/material.dart';

import 'package:slide_to_confirm/slide_to_confirm.dart';

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationController.repeat(reverse: true);
    _animation = Tween(begin: 2.0, end: 15.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

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
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0))),
                width: MediaQuery.of(context).size.width,
                height: (MediaQuery.of(context).size.height / 2) - 50,
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 50.0,
                      height: 50.0,
                      child: IconButton(
                        icon: Icon(Icons.insert_chart),
                        color: Colors.red,
                        onPressed: () {
                          Navigator.pushNamed(context, '/salesHome');
                        },
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blueGrey,
                              blurRadius: _animationController.value,
                              spreadRadius: _animation.value)
                        ],
                      ),
                    ),
                    Image.asset('assets/images/bar.png')
                  ],
                ),
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
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 2.0,
                      )
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0)),
                    color: Color(0xff141d26)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: Text(
                        'Donut Chart',
                        style: TextStyle(fontSize: 60.0, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    ConfirmationSlider(
                        height: 50.0,
                        width: 350.0,
                        backgroundColor: Colors.white,
                        iconColor: Colors.red,
                        text: 'Slide to the chart',
                        shadow: BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1.0,
                            blurRadius: 1.0),
                        onConfirmation: () {
                          Navigator.pushNamed(context, '/transit');
                        }),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
