import 'package:flutter/material.dart';

import '../activities/SalesHomeActivity.dart';
import '../activities/homeActivity.dart';
import '../activities/sampl.dart';
import '../activities/pieChartActivity.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomeActivity());
    case '/salesHome':
      return MaterialPageRoute(builder: (context) => SalesHomeActivity());
    case '/sample':
      return MaterialPageRoute(builder: (context) => PieChartSample2());
    case '/manHours':
      return MaterialPageRoute(builder: (context) => PieChartActivity());
    default:
      return MaterialPageRoute(builder: (context) => HomeActivity());
  }
}
