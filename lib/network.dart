import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) {
  final baseUrl = dotenv.env['API'];
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl??'http://10.0.2.2:3000/',
      connectTimeout: const Duration(seconds: 100000),
      receiveTimeout: const Duration(seconds: 2),
    ),
  );

  // Cấu hình Dio nếu cần, như thêm Interceptors
  dio.interceptors.add(LogInterceptor(responseBody: true));

  return dio;
});

