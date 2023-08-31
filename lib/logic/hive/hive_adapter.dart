import 'package:hive/hive.dart';

import 'hive_db.dart';

class MyHiveBoxAdapter extends TypeAdapter<MyHiveBox> {
  @override
  final int typeId = 0; // unique ID for this type

  @override
  MyHiveBox read(BinaryReader reader) {
    return MyHiveBox();
  }

  @override
  void write(BinaryWriter writer, MyHiveBox obj) {
    // no need to write anything since the MyHiveBox class is static
  }
}
