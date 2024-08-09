import 'dart:io';

import 'package:dio/dio.dart';
import 'package:magfi_dev_task/feature/users/model/user.dart';
import 'package:magfi_dev_task/feature/users/services/IUserService.dart';

class UserService extends IUserService {
  UserService() : super();
  final Dio dio = Dio();
  @override
  Future<List<User>> fetchAllUser() async {
    final response =
        await dio.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;
      if (data is List) return data.map((e) => User.fromJson(e)).toList();
    }
    return [];
  }
}
