import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:wykn/utils/enum.dart';

class RestApi {
  static Future<http.Response?> getDataFromServer(String url, Map<String, dynamic> mapParams,
      {HttpMethod method = HttpMethod.POST, List<Map<String, dynamic>>? listParams, String token = ""}) async {
    http.Response? response;

    var params = listParams ?? mapParams;

    try {
      //debugPrint('=======$url====$method===${jsonEncode(params)}');

      if (method == HttpMethod.POST) {
        response = await http.post(Uri.parse(url), headers: {"Content-Type": "application/json"}, body: jsonEncode(params));
      } else if (method == HttpMethod.PUT) {
        response = await http.put(Uri.parse(url), headers: {"Content-Type": "application/json"}, body: jsonEncode(params));
      } else if (method == HttpMethod.DELETE) {
        response = await http.delete(Uri.parse(url), headers: {"Content-Type": "application/json"}, body: jsonEncode(params));
      } else if (method == HttpMethod.POST_WITH_AUTH) {
        if (kDebugMode) {
          print("objectobject $url");
        }
        response = await http.post(Uri.parse(url),
            headers: {"Accept": "application/json", "Content-type": "application/json", "Authorization": "Bearer $token"}, body: jsonEncode(params));
      } else if (method == HttpMethod.GET_WITH_AUTH) {
        if (kDebugMode) {
          print("objectobject $url");
        }
        response = await http.get(
          Uri.parse(url),
          headers: {"Accept": "application/json", "Content-type": "application/json", "Authorization": "Bearer $token"},
        );
      } else if (method == HttpMethod.DELETE_WITH_AUTH) {
        response = await http.delete(Uri.parse(url),
            headers: {"Accept": "application/json", "Content-type": "application/json", "Authorization": "Bearer $token"}, body: jsonEncode(params));
      } else if (method == HttpMethod.POST_WITH_AUTH) {
        response = await http.put(Uri.parse(url),
            headers: {"Accept": "application/json", "Content-type": "application/json", "Authorization": "Bearer $token"}, body: jsonEncode(params));
      } else {
        response = await http.get(
          Uri.parse(url),
          headers: {"Content-Type": "application/json"},
        );
      }

      //debugPrint('=========Response: ${response.body}');
    } catch (e) {
      debugPrint('=========Error http: $e');
    }

    return response;
  }

  static Map getMapFromResponse(http.Response? response) {
    Map map = {};

    if (response != null) {
      try {
        map = jsonDecode(response.body);
        map['statuscode'] = response.statusCode;
        debugPrint('=========Response: ${response.body}');
      } catch (err) {
        debugPrint('=======Err $err');
      }
    }

    return map;
  }

  static List getListFromResponse(http.Response? response) {
    List list = [];

    if (response != null) {
      try {
        list = jsonDecode(response.body)['message'];
      } catch (err) {
        debugPrint('=======Err $err');
      }
    }

    return list;
  }
}
