// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$userListAtom =
      Atom(name: '_UserStore.userList', context: context);

  @override
  List<User> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<User> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  late final _$addUserAsyncAction =
      AsyncAction('_UserStore.addUser', context: context);

  @override
  Future<void> addUser(User user) {
    return _$addUserAsyncAction.run(() => super.addUser(user));
  }

  late final _$getUsersAsyncAction =
      AsyncAction('_UserStore.getUsers', context: context);

  @override
  Future<void> getUsers(User user) {
    return _$getUsersAsyncAction.run(() => super.getUsers(user));
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
