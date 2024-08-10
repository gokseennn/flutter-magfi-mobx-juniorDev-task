import 'dart:io';

import 'package:dio/dio.dart';
import 'package:magfi_dev_task/core/api/api_services.dart';
import 'package:magfi_dev_task/feature/users/model/user.dart';
import 'package:magfi_dev_task/feature/users/services/IUserService.dart';

class UserService extends IUserService {
  UserService() : super();
  final Dio dio = Dio();
  final ApiServices apiServices = ApiServices.instance;

  @override
  Future<List<User>> fetchAllUser() async {
    try {
      final response = await apiServices.get("/users");
      if (response.statusCode == HttpStatus.ok) {
        final data = response.data;
        if (data is List) return data.map((e) => User.fromJson(e)).toList();
      }
      throw Exception('Veri alınamadı: ${response.statusCode}');
    } catch (e) {
      // Exception mesajını logla ve ekranda göstermeden yeniden fırlat
      print('Beklenmeyen bir hata oluştu: $e');
      throw Exception('Beklenmeyen bir hata oluştu');
    }
  }
}
