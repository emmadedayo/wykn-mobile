import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class MyHiveBox {
  static const String _myBoxName = 'Wykn';

  // Method to save a string to Hive
  static Future<void> saveString(String key, String value) async {
    final box = await Hive.openBox<String>(_myBoxName);
    await box.put(key, value);
    print('Value saved: $value');
    await box.close();
  }

  // Method to retrieve a string from Hive
  static Future<String?> getString(String key) async {
    final box = await Hive.openBox<String>(_myBoxName);
    final value = box.get(key);
    await box.close();
    return value;
  }

  // Method to save a bool to Hive
  static Future<void> saveBool(String key, bool value) async {
    final box = await Hive.openBox<bool>(_myBoxName);
    await box.put(key, value);
    await box.close();
  }

  // Method to retrieve a bool from Hive
  static Future<bool?> getBool(String key) async {
    final box = await Hive.openBox<bool>(_myBoxName);
    final value = box.get(key);
    await box.close();
    return value;
  }

  // Method to save an object to Hive
  static Future<void> saveObject<T>(String key, T value) async {
    final box = await Hive.openBox<T>(_myBoxName);
    await box.put(key, value);
    print('Value saved: $value');
    await box.close();
  }

  // Method to retrieve an object from Hive
  static Future<T?> getObject<T>(String key) async {
    final box = await Hive.openBox<T>(_myBoxName);
    final value = box.get(key);
    await box.close();
    return value;
  }

  // Method to delete a key from Hive
  static Future<void> deleteKey(String key) async {
    final box = await Hive.openBox(_myBoxName);
    await box.delete(key);
    await box.close();
  }

  //count items store on CART key
  static Future<int> countItems() async {
    final box = await Hive.openBox(_myBoxName);
    final List<dynamic>? result = box.get('CART');
    await box.close();
    if (kDebugMode) {
      print('result: $result');
    }
    if (result == null || result.isEmpty) {
      return 0;
    } else {
      return result.length;
    }
  }
}
