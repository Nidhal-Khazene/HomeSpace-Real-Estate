import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:home_space/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:home_space/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:home_space/core/services/api_service.dart';
import 'package:home_space/features/home/data/repos/home_repo_impl.dart';
import 'package:home_space/features/home/domain/repos/home_repo.dart';

final GetIt getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepo>(
    HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(
        apiService: getIt.get<ApiService>(),
      ),
    ),
  );
}
