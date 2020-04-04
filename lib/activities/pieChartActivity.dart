import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart' as charts;
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pieChart.dart';

class PieChartActivity extends StatefulWidget {
  @override
  _PieChartActivityState createState() => _PieChartActivityState();
}

class _PieChartActivityState extends State<PieChartActivity> {
  List<charts.PieChartSectionData> _pieChartdata = [];
  List<ManHours> recievedData = [];
  int touchedIndex;

  _generatePieChartSectionData(recievedData) {
    print(recievedData);
    int len = recievedData.length;
    _pieChartdata.clear();
    for (int i = 0; i < len; i++) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 90 : 60;
      _pieChartdata.add(charts.PieChartSectionData(
          color: Color(int.parse(recievedData[i].color)),
          title: recievedData[i].value + '%',
          value: double.parse(recievedData[i].value),
          radius: radius,
          titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff141d26),
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Color(0xff141d26),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Center(
                  child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style:
                        TextStyle(fontStyle: FontStyle.normal, fontSize: 20.0),
                    children: <TextSpan>[
                      TextSpan(text: 'This is a '),
                      TextSpan(
                          text: 'Donut Chart',
                          style: TextStyle(
                              color: Color(0xfff30a49),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold)),
                      TextSpan(text: ' representing the '),
                      TextSpan(
                          text: 'Manhours',
                          style: TextStyle(
                              color: Color(0xfff30a49),
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              ' spent during a project in an organization.\n\n'),
                      TextSpan(
                          text:
                              'For instance, 10% of design means that 10% of all the time spent by everyone involved in the project was spent in the design process.',
                          style: TextStyle(fontSize: 14.0))
                    ]),
              )),
            ),
            _bodyBuild(context),
            Container(
              child: _buildIndex(context),
            )
          ],
        ),
      ),
    );
  }

  Widget _bodyBuild(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('pieChart').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<ManHours> man = snapshot.data.documents
              .map((documentSnapshot) => ManHours.from(documentSnapshot.data))
              .toList();
          return _buildPie(context, man);
        }
      },
    );
  }

  Widget _buildPie(BuildContext context, List<ManHours> man) {
    recievedData.clear();
    recievedData = man;
    print('ghfghfghfhgfghfhgfhfghfghfgfhfh');
    print(recievedData.toString());
    _generatePieChartSectionData(recievedData);
    print('kk');
    return Center(
      child: charts.PieChart(charts.PieChartData(
        sections: _pieChartdata,
        sectionsSpace: 5.0,
        centerSpaceRadius: 50.0,
        borderData: charts.FlBorderData(show: false),
        pieTouchData: charts.PieTouchData(touchCallback: (pieTouchResponse) {
          setState(() {
            if (pieTouchResponse.touchInput is charts.FlLongPressEnd ||
                pieTouchResponse.touchInput is charts.FlPanEnd) {
              touchedIndex = -1;
            } else {
              touchedIndex = pieTouchResponse.touchedSectionIndex;
            }
          });
        }),
      )),
    );
  }

  Widget _buildIndex(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 12.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('Marketing', style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 12.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text('Marketing', style: TextStyle(color: Colors.white))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 12.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Marketing',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 12.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Marketing',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 12.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.red,
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              'Marketing',
              style: TextStyle(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
