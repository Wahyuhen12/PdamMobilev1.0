import 'package:flutter/material.dart';
import 'package:mobile_pdam/common/ui/app_navigatorBar.dart';
import 'package:mobile_pdam/views/RBM/rbm_detail.dart';
import 'package:mobile_pdam/views/RBM/rbm_view.dart';
import 'package:mobile_pdam/views/dashboard/dashboard_view.dart';
import 'package:mobile_pdam/views/login/login_view.dart';
import 'package:mobile_pdam/views/unit/unit_view.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/loginView':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/dashboardView':
        return MaterialPageRoute(builder: (_) => DashBoardView());
      case '/rbmView':
        return MaterialPageRoute(builder: (_) => RBMView());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
