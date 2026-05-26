import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_space/core/services/api_service.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
}
