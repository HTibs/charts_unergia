import 'package:flutter/material.dart';

import '../activities/SalesHomeActivity.dart';
import '../activities/homeActivity.dart';
import '../activities/sampl.dart';
import '../activities/pieChartActivity.dart';
import '../activities/newHome.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => NewHome());
    case '/salesHome':
      return MaterialPageRoute(builder: (context) => SalesHomeActivity());
    case '/sample':
      return MaterialPageRoute(builder: (context) => PieChartSample2());
    case '/manhours':
      return MaterialPageRoute(builder: (context) => PieChartActivity());
    case '/transit':
      return PageRouteBuilder(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) =>
              PieChartActivity(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            animation =
                CurvedAnimation(parent: animation, curve: Curves.linear);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          });
    default:
      return MaterialPageRoute(builder: (context) => HomeActivity());
  }
}
