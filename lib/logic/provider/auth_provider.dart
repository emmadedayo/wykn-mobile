import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:wykn/logic/hive/hive_db.dart';
import 'package:wykn/logic/http_service/result_item.dart';
import 'package:wykn/logic/repositories/auth_repository.dart';
import 'package:wykn/models/electricity_model.dart';
import 'package:wykn/models/user.dart';

class AuthProvider {
  AuthRepository repository = AuthRepository();

  Future<ResultItem?> signUp(maps) async {
    print("==============================> $maps");
    Map map = await repository.signUp(maps);
    try {
      int? statusCode = map['statuscode'];
      dynamic message = map['message'] ?? '';
      return ResultItem(result: null, errorCode: statusCode, message: message);
    } on TimeoutException catch (e) {
      return ResultItem(result: null, errorCode: 404, message: e.toString());
    } catch (err) {
      return ResultItem(result: null, errorCode: 404, message: err.toString());
    }
  }

  Future<ResultItem<UserModel?>> auth(maps) async {
    debugPrint('============================> $maps');
    UserModel? user;
    Map map = await repository.login(maps);
    int? statusCode = map['statuscode'];
    String message = map['message'] ?? '';
    if (map.isNotEmpty && map['data'] != null) {
      try {
        user = UserModel.fromJson(map['data']['user_details']);
        await MyHiveBox.saveString('USER_TOKEN', map['data']['token']);
        await MyHiveBox.saveObject('USER_OBJECT', user);
      } catch (err) {
        return ResultItem<UserModel?>(result: null, errorCode: statusCode, message: 'Error: $err');
      }
    }
    return ResultItem<UserModel?>(result: user, errorCode: statusCode, message: message);
  }

  Future<ResultItem<ElectricityModel?>> validateMeter(maps) async {
    debugPrint('=========Map : $maps');
    ElectricityModel? electricityModel;
    String? getToken = await MyHiveBox.getString('USER_TOKEN');
    Map map = await repository.validateMeter(maps, getToken!);
    int? statusCode = map['statuscode'];
    String message = map['message'] ?? '';
    if (map.isNotEmpty) {
      try {
        electricityModel = ElectricityModel.fromJson(map['data']);
      } catch (err) {
        return ResultItem<ElectricityModel?>(result: null, errorCode: 404, message: 'Error: $err');
      }
    }
    return ResultItem<ElectricityModel?>(result: electricityModel, errorCode: statusCode, message: message);
  }

  // Future<UserModel?> getCurrentUser() async {
  //   UserModel? user;
  //
  //   Map<String, dynamic> map = await provider.getCurrentUser();
  //   if (map.isNotEmpty) {
  //     try {
  //       user = UserModel.fromMap(map);
  //     } catch (err) {
  //       if (kDebugMode) {
  //         print(err);
  //       }
  //     }
  //   }
  //   return user;
  // }
}
