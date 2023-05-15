import 'package:mobx/mobx.dart';
import 'package:mobx_flutter/service/preference_service.dart';
import 'package:mobx_flutter/service/user_service.dart';

import '../model/user/user.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {

  _UserStore(){
    initStore();
  }

  @observable
  List<User> userList = [];


  @action
  initStore()async {
    userList = await PreferencesService().getAllUser() as List<User>;
    print(userList);
  }

  @action
  Future<void> addUser(User user) async {
    PreferencesService().addUser(user);
    userList = [...userList, user];
  }

  @action
  Future<void> getUsers(User user) async {
    List<User>? userList = await UserService().getUsers();
    userList = userList ?? [];
  }
}