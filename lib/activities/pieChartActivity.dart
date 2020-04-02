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

  _generatePieChartSectionData(recievedData) {
    print(recievedData);
    int len = recievedData.length();
    for (int i = 0; i < len; i++) {
      _pieChartdata.add(charts.PieChartSectionData(
        //value: recievedData[i].value,
        // color: Color(0xffccddd),

        title: recievedData[i].name,
        value: double.parse(recievedData[i].value),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _bodyBuild(context),
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
    recievedData = man;
    print('ghfghfghfhgfghfhgfhfghfghfgfhfh');
    print(recievedData.toString());
    _generatePieChartSectionData(recievedData);
    print('kk');
    return Center(
      child: charts.PieChart(charts.PieChartData(
        sections: _pieChartdata,
        sectionsSpace: 5.0,
        centerSpaceRadius: 40.0,
      )),
    );
  }
}
