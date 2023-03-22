import 'package:get_storage/get_storage.dart';
import 'package:localdatabase_hive/model/user_model.dart';

class GetStorageService {
  static var box = GetStorage();

  static void storeUser(User user) async{
    box.write("user", user.toJson());
  }

  static Future<User?> loadUser() async{
    var user=User.fromJson(box.read("user"));
    return user;
  }

  static void removeUser() async{
    box.remove("user");
  }
}
