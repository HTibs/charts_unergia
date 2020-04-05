import 'package:flutter/material.dart';

import 'package:shadow/shadow.dart';

import '../services/routers.dart';

class NewHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Charts"),
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Container(
          height: double.infinity,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/saleshome');
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  height: 200.0,
                  decoration: BoxDecoration(
                      color: Color(0xffF1F1F2),
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1.0,
                            blurRadius: 1.0)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Bar Graph',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '\tSales',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Center(
                              child: Text(
                            'Tap to see Graph',
                            style: TextStyle(color: Colors.grey),
                          )),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                      Container(
                        width: 200,
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0),
                height: 200.0,
                decoration: BoxDecoration(
                    color: Color(0xff141d26),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1.0,
                          blurRadius: 1.0)
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
