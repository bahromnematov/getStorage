import 'package:hive_flutter/adapters.dart';

import '../model/user_model.dart';

class HiveServise{

  static var box=Hive.box('pdp_online');

  static void stareUser(User user) async{
    box.put("user", user.toJson());
  }

  static User loadUser() {
    var user =User.fromJson(box.get('user'));
    return user;
  }

  static void removeUser() async{
    box.delete('user');
  }
}