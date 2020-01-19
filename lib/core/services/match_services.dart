import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_management/core/services/api.dart';

class MatchService {
  final Api _api;

  MatchService({Api api}) : _api = api;

  SharedPreferences sp;
  String token;
  String date;
  String time;
  String team;
  String name;
  String phone;
  String createdBy;

  Future<Map<dynamic, dynamic>> slots() async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('jwt');
    final response = await _api.slots(token, date, time);
    return response;
  }

  Future<void> bookMatch() async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('jwt');
    var book =
        await _api.bookMatch(token, date, time, team, name, phone, createdBy);
  }
}
