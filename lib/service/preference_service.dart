import 'package:isar/isar.dart';
import 'package:mobx_flutter/model/user/user.dart';
import 'package:path_provider/path_provider.dart';


class PreferencesService {
  PreferencesService._internal();

  factory PreferencesService() => _instance;

  late Isar _isar;

  static final PreferencesService _instance = PreferencesService._internal();

  String getToken() {
    return 'test_token';
  }

  Future<void> initializeIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [UserSchema],
      directory: dir.path
    );
  }

  //Add User to DB
  Future<void> addUser(User user) async {
    await _isar.writeTxn(() async {
      _isar.users.put(user); // insert & update
    });
  }

  //Get User from DB
  Future<User?> getUser(int id) async {
    return await _isar.users.get(id);
  }

  //Get User from DB
  Future<List<User?>> getAllUser() async {
    return await _isar.users.where().findAll();
  }

  //Delete User from DB
  Future<bool> deleteUser(int id) async {
    return await _isar.users.delete(id);
  }

}