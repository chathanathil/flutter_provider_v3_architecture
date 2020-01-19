import 'package:turf_management/core/services/match_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class SelectTimeModel extends BaseModel {
  MatchService _matchService;

  SelectTimeModel({MatchService matchService}) : _matchService = matchService;

  setTime(String time) {
    _matchService.time = time;
  }
}
