import 'package:turf_management/core/services/match_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class SelectDateModel extends BaseModel {
  MatchService _matchService;

  SelectDateModel({MatchService matchService}) : _matchService = matchService;

  setDate(String date) {
    _matchService.date = date;
  }
}
