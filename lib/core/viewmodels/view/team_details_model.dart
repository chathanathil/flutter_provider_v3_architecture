import 'package:flutter/material.dart';
import 'package:turf_management/core/constants/app_constants.dart';
import 'package:turf_management/core/services/match_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class TeamDetailsModel extends BaseModel {
  MatchService _matchService;

  TeamDetailsModel({MatchService matchService}) : _matchService = matchService;

  setTeamDetails(String name, String phone, String createdBy) {
    _matchService.name = name;
    _matchService.phone = phone;
    _matchService.createdBy = createdBy;
  }

  Map<String, dynamic> data = Map<String, dynamic>();

  Future<bool> bookMatch(BuildContext context) async {
    setBusy(true);
    var success = await _matchService.bookMatch();
    setBusy(false);

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Congratulation"),
            content: new Text("Your Booking is confirmed..!!"),
            actions: <Widget>[
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RoutePaths.DashBoard);
                },
              ),
            ],
          );
        });
  }
}
