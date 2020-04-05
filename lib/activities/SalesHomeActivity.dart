import 'dart:core';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/sale.dart';

class SalesHomeActivity extends StatefulWidget {
  @override
  _SalesHomeActivityState createState() => _SalesHomeActivityState();
}

class _SalesHomeActivityState extends State<SalesHomeActivity> {
  List<charts.Series<Sales, String>> _seriesBarData = [];
  List<Sales> myData;

  _generateData(myData) {
    _seriesBarData.add(charts.Series(
        domainFn: (Sales sales, _) => sales.saleYear.toString(),
        measureFn: (Sales sales, _) => sales.saleVal,
        colorFn: (Sales sales, _) =>
            charts.ColorUtil.fromDartColor(Color(int.parse(sales.colorVal))),
        id: 'Sales',
        data: myData,
        labelAccessorFn: (Sales row, _) => "${row.saleYear}"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF1F1F2),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xffEB4559),
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Color(0xffF1F1F2),
          elevation: 0.0,
        ),
        body: _bodyBuild(context),
      ),
    );
  }

  Widget _bodyBuild(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('sales').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Sales> sales = snapshot.data.documents
              .map((documentSnapshot) => Sales.fromMap(documentSnapshot.data))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Sales> sales) {
    myData = sales;
    _generateData(myData);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                'Sales by year',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: charts.BarChart(
                  _seriesBarData,
                  animate: true,
                  animationDuration: Duration(seconds: 2),
                  behaviors: [
                    new charts.DatumLegend(
                        entryTextStyle: charts.TextStyleSpec(
                      color: charts.MaterialPalette.purple.shadeDefault,
                      fontFamily: 'Georgia',
                      fontSize: 18,
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
