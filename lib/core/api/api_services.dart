import 'dart:io';

import 'package:dio/dio.dart';

class ApiServices {
  static ApiServices? _instance;

  static ApiServices get instance {
    if (_instance != null) return _instance!;

    _instance = ApiServices._init();
    return _instance!;
  }

  final String _baseUrl = 'https://jsonplaceholder.typicode.com/users';
  final Dio dio = Dio();

  ApiServices._init() {
    dio.options.baseUrl = _baseUrl;
    dio.options.connectTimeout = const Duration(seconds: 5); // 5 saniye
    dio.options.receiveTimeout = const Duration(seconds: 3); // 3 saniye

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Auth Token ekleme
          // _addAuthToken(options);
          handler.next(options); // İsteği devam ettirir
        },
      ),
    );
  }

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters}) async {
    final response = await dio.get(path, queryParameters: queryParameters);
    return response;
  }

  Future<Response> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) async {
    final response =
        await dio.post(path, data: data, queryParameters: queryParameters);
    return response;
  }

  // Diğer HTTP metodları (PUT, DELETE vb.) eklenebilir
}
