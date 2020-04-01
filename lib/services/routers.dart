import 'package:flutter/material.dart';

import '../activities/SalesHomeActivity.dart';
import '../activities/homeActivity.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => HomeActivity());
    case '/salesHome':
      return MaterialPageRoute(builder: (context) => SalesHomeActivity());
    default:
      return MaterialPageRoute(builder: (context) => HomeActivity());
  }
}
