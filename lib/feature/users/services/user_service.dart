import 'dart:io';
import 'package:dio/dio.dart';
import 'package:magfi_dev_task/core/api/api_services.dart';
import 'package:magfi_dev_task/feature/users/model/user.dart';
import 'package:magfi_dev_task/feature/users/services/IUserService.dart';

class UserService extends IUserService {
  UserService() : super();
  final ApiServices apiServices = ApiServices.instance;

  @override
  Future<List<User>> fetchAllUser() async {
    try {
      final response = await apiServices.get("/users");
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) return data.map((e) => User.fromJson(e)).toList();
      }
      throw DioException(
        requestOptions: RequestOptions(path: '/users'),
        response: response,
        error: 'Invalid response format',
      );
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    }
  }
}
