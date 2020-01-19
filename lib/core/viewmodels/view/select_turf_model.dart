import 'package:turf_management/core/services/match_services.dart';
import 'package:turf_management/core/viewmodels/widget/base_model.dart';

class SelectTurfModel extends BaseModel {
  MatchService _matchService;

  SelectTurfModel({MatchService matchService}) : _matchService = matchService;

  setTurf(String team) {
    _matchService.team = team;
  }

  Map<dynamic, dynamic> slots;

  Future getSlots() async {
    setBusy(true);
    slots = await _matchService.slots();
    setBusy(false);
    return slots;
  }
}
