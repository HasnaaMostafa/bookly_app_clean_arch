import 'package:bookly_app_clean_arch/features/Home/data/data_sources/HomeLocalDataSource/home_local_data_source.dart';
import 'package:bookly_app_clean_arch/features/Home/data/data_sources/HomeRemoteDataSource/home_remote_data_source.dart';
import 'package:bookly_app_clean_arch/features/search/data/data_sources/SearchRemoteDataSource/search_remote_data_source.dart';
import 'package:bookly_app_clean_arch/features/search/data/repo/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/Home/data/repo/home_repo_impl.dart';
import 'api_services.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeLocalDataSource: HomeLocalDataSourceImpl(),
      homeRemoteDataSource: HomeRemoteDataSourceImpl(getIt.get<ApiService>())));

  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(
      searchRemoteDataSource:
          SearchRemoteDataSourceImpl(getIt.get<ApiService>())));
}
