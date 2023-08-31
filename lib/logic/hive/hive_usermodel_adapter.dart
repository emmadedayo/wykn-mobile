import 'package:hive/hive.dart';
import 'package:wykn/models/user.dart';

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    return UserModel(
      name: reader.readString(),
      email: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.name ?? '');
    writer.writeString(obj.email ?? '');
  }
}
