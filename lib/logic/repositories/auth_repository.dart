import 'package:http/http.dart';
import 'package:wykn/logic/http_service/AppUrl.dart';
import 'package:wykn/logic/http_service/http.dart';
import 'package:wykn/utils/enum.dart';

class AuthRepository {
  Future<Map> signUp(Map<String, dynamic> map) async {
    Response? response = await RestApi.getDataFromServer(ApiUrl.signUp, map, method: HttpMethod.POST);
    return RestApi.getMapFromResponse(response);
  }

  Future<Map> login(Map<String, dynamic> map) async {
    Response? response = await RestApi.getDataFromServer(ApiUrl.login, map, method: HttpMethod.POST);

    return RestApi.getMapFromResponse(response);
  }

  Future<Map> validateMeter(Map<String, dynamic> map, String token) async {
    Response? response = await RestApi.getDataFromServer(ApiUrl.validateMeter, map, method: HttpMethod.POST_WITH_AUTH, token: token);
    return RestApi.getMapFromResponse(response);
  }
}
