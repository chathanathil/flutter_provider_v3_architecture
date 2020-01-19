import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

// The service responsible for networking requests
class Api {
  Future<Map<String, dynamic>> login(String username, String password) async {
    const url = 'http://sleepy-falls-05306.herokuapp.com/api/users/login';
    try {
      final response = await http
          .post(url, body: {"username": username, "password": password});

      return json.decode(response.body);
    } catch (err) {
      throw err;
    }
  }

  Future<List> getTurf(String date, String token) async {
    final url = 'http://sleepy-falls-05306.herokuapp.com/api/matchs/turf/$date';
    final cancelUrl =
        'http://sleepy-falls-05306.herokuapp.com/api/cancel/turf/$date';

    final response =
        await http.get(url, headers: {HttpHeaders.authorizationHeader: token});
    final extractData = json.decode(response.body);

    final cancelResponse = await http
        .get(cancelUrl, headers: {HttpHeaders.authorizationHeader: token});
    final cancelExtractData = json.decode(cancelResponse.body);
    if (extractData.runtimeType.toString().trim() ==
        "_InternalLinkedHashMap<String, dynamic>") {
      return [Map<String, dynamic>.from(extractData)];
    } else if (cancelExtractData == null)
      return extractData;
    else
      return [...extractData, ...cancelExtractData];
  }

  Future<List> getPool(String date, String token) async {
    final url = 'http://sleepy-falls-05306.herokuapp.com/api/matchs/pool/$date';
    final cancelUrl =
        'http://sleepy-falls-05306.herokuapp.com/api/cancel/pool/$date';

    final response =
        await http.get(url, headers: {HttpHeaders.authorizationHeader: token});
    final extractData = json.decode(response.body);

    final cancelResponse = await http
        .get(cancelUrl, headers: {HttpHeaders.authorizationHeader: token});
    final cancelExtractData = json.decode(cancelResponse.body);
    // return extractData;

    if (extractData.runtimeType.toString().trim() ==
        "_InternalLinkedHashMap<String, dynamic>") {
      return [Map<String, dynamic>.from(extractData)];
    } else if (cancelExtractData == null)
      return extractData;
    else
      return [...extractData, ...cancelExtractData];
  }

  Future<Map<dynamic, dynamic>> slots(
      String token, String date, String time) async {
    final url =
        "http://sleepy-falls-05306.herokuapp.com/api/matchs/$date/$time";

    try {
      final response = await http
          .get(url, headers: {HttpHeaders.authorizationHeader: token});
      final extractData = json.decode(response.body);

      return extractData;
    } catch (err) {
      throw err;
    }
  }

  Future<void> bookMatch(String token, String date, String time, String team,
      String name, String phone, String createdBy) async {
    final url = "http://sleepy-falls-05306.herokuapp.com/api/matchs/add";

    try {
      final response = await http.post(url, headers: {
        HttpHeaders.authorizationHeader: token
      }, body: {
        "date": date,
        "time": time,
        "team": team,
        "name": name,
        "phone": phone,
        "createdBy": createdBy
      });
    } catch (err) {
      throw err;
    }
  }

  Future<void> addAmount(String token, String id, String amount) async {
    final url =
        'http://sleepy-falls-05306.herokuapp.com/api/matchs/addAmount/$id';
    try {
      final response = await http.post(url,
          headers: {HttpHeaders.authorizationHeader: token},
          body: {"amount": amount});
    } catch (err) {
      throw err;
    }
  }

  Future<void> cancelMatch(String token, String id) async {
    final url = 'http://sleepy-falls-05306.herokuapp.com/api/cancel/add/$id';
    try {
      final response = await http
          .post(url, headers: {HttpHeaders.authorizationHeader: token});
    } catch (err) {
      throw err;
    }
  }
}
