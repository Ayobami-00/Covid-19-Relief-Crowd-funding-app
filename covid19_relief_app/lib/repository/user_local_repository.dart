import 'dart:async';

import 'package:covid19_relief_app/dao/user_local_dao.dart';
import 'package:covid19_relief_app/models/user_local_database_model.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final userDao = UserDao();

  // Future<User> authenticate ({
  //   @required String username,
  //   @required String password,
  // }) async {
  //   // UserLogin userLogin = UserLogin(
  //   //   username: username,
  //   //   password: password
  //   // );
  //   // Token token = await getToken(userLogin);
  //   // User user = User(
  //   //   id: 0,
  //   //   username: username,
  //   //   token: token.token,
  //   // );
  //   // return user;
  // }

  Future<void> persistToken ({
    @required User user
    }) async {
    // write token with the user to the database
      await userDao.createUser(user);
  }

  Future <void> delteToken({
    @required int id
  }) async {
    await userDao.deleteUser(id);
  }

  Future <bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
  }

  Future<List<Map>> getUser() async {
    List<Map> result = await userDao.getUser(0);
    return result;
  }
}