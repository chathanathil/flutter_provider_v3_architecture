import 'package:shared_preferences/shared_preferences.dart';
import 'package:turf_management/core/services/api.dart';

class DashBoardService {
  final Api _api;
  DashBoardService({Api api}) : _api = api;
  SharedPreferences sp;
  String token;
  String id;

  List<dynamic> turfBookings = List<dynamic>();
  List<dynamic> poolBookings = List<dynamic>();

  Future<List<dynamic>> getTurf(String date) async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('jwt');
    turfBookings = await _api.getTurf(date, token);
    return turfBookings;
  }

  Future<List<dynamic>> getPool(String date) async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('jwt');
    poolBookings = await _api.getPool(date, token);

    return poolBookings;
  }

  Future<void> addAmount(String amount) async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('jwt');
    var response = await _api.addAmount(token, id, amount);
  }

  Future<void> cancelMatch() async {
    sp = await SharedPreferences.getInstance();
    token = sp.getString('jwt');
    var response = await _api.cancelMatch(token, id);
  }
}
