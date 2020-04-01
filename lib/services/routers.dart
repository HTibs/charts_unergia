import 'package:flutter/material.dart';

import '../activities/SalesHomeActivity.dart';
import '../activities/homeActivity.dart';
import '../activities/sampl.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomeActivity());
    case '/salesHome':
      return MaterialPageRoute(builder: (context) => SalesHomeActivity());
    case '/sample':
      return MaterialPageRoute(builder: (context) => PieChartSample2());
    default:
      return MaterialPageRoute(builder: (context) => HomeActivity());
  }
}
