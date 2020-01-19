import 'package:flutter/material.dart';
import 'package:turf_management/core/services/dash_board_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class AmountViewModel extends BaseModel {
  DashBoardService _dashBoardService;
  AmountViewModel({DashBoardService dashBoardService})
      : _dashBoardService = dashBoardService;

  setId(String id) {
    _dashBoardService.id = id;
  }

  String date;
  setDate(String date) {
    date = date;
    print(date);
  }

  Future<void> addAmount(String amount, BuildContext context) async {
    setBusy(true);
    print(date);
    var res = await _dashBoardService.addAmount(amount);

    Navigator.pop(context, amount);

    setBusy(false);
  }

  Future<void> cancelMatch(BuildContext context) async {
    setBusy(true);
    var res = await _dashBoardService.cancelMatch();
    Navigator.pop(
      context,
    );

    setBusy(false);
  }
}
