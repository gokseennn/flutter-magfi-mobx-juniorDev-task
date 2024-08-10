// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UsersViewModel on _UsersViewModel, Store {
  late final _$userListAtom =
      Atom(name: '_UsersViewModel.userList', context: context);

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

  late final _$onInitAsyncAction =
      AsyncAction('_UsersViewModel.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$getAllUsersAsyncAction =
      AsyncAction('_UsersViewModel.getAllUsers', context: context);

  @override
  Future<void> getAllUsers() {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers());
  }

  @override
  String toString() {
    return '''
userList: ${userList}
    ''';
  }
}
