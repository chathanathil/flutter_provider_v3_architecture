import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_management/core/services/api.dart';
import 'package:turf_management/core/services/dash_board_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class DashBoardViewModel extends BaseModel {
  DashBoardService _dashBoardService;

  DashBoardViewModel({@required DashBoardService dashBoardService})
      : _dashBoardService = dashBoardService;

  List<dynamic> poolBookings = List<dynamic>();
  List<dynamic> turfBookings = List<dynamic>();

  Future<List<dynamic>> turfBooking(String date) async {
    setBusy(true);
    turfBookings = await _dashBoardService.getTurf(date);
    setBusy(false);
    return turfBookings;
  }

  Future<List<dynamic>> poolBooking(String date) async {
    setBusy(true);
    poolBookings = await _dashBoardService.getPool(date);

    setBusy(false);
    return poolBookings;
  }
}
