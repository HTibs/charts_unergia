import 'package:flutter/material.dart';

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
                  Navigator.pushNamed(context, '/salesHome');
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
                        child: Image.network(
                            'https://cdn4.iconfinder.com/data/icons/flat-business-icon-set/450/bar_chart-512.png'),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/transit');
                },
                child: Container(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Pie Chart',
                            style: TextStyle(
                                color: Colors.orange,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            '\tManHours',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          SizedBox(
                            height: 40.0,
                          ),
                          Center(
                              child: Text(
                            'Tap to see Chart',
                            style: TextStyle(color: Colors.white),
                          )),
                          SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                      Container(
                        width: 200,
                        height: 200.0,
                        child: Image.network(
                            'https://cdn1.iconfinder.com/data/icons/charts-and-diagrams-1-1/512/piechart-512.png'),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                topRight: Radius.circular(20.0))),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
