import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/ui/views/amount_view.dart';
import 'package:turf_management/ui/views/dash_board_view.dart';
import 'package:turf_management/ui/views/login_view.dart';
import 'package:turf_management/ui/views/select_date_view.dart';
import 'package:turf_management/ui/views/select_time_view.dart';
import 'package:turf_management/ui/views/select_turf_view.dart';
import 'package:turf_management/ui/views/team_details.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      case RoutePaths.DashBoard:
        return MaterialPageRoute(builder: (_) => DashBoardView());
      case RoutePaths.SelectDate:
        return MaterialPageRoute(builder: (_) => SelectDateView());
      case RoutePaths.SelectTime:
        return MaterialPageRoute(builder: (_) => SelectTimeView());
      case RoutePaths.SelectTurf:
        return MaterialPageRoute(builder: (_) => SelectTurfView());
      case RoutePaths.TeamDetails:
        return MaterialPageRoute(builder: (_) => TeamDetailsView());
      case RoutePaths.AddAmount:
        return MaterialPageRoute(builder: (_) => AmountView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("No route defined for ${settings.name}"),
                  ),
                ));
    }
  }
}
