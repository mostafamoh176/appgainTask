import 'package:appgain_task/core/util/network.dart';
import 'package:appgain_task/feature/questionnaire_feature/data/data_source/remote_data_source.dart';
import 'package:appgain_task/feature/questionnaire_feature/data/repositories_impl/questation_repository_impl.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/repositories/questaions_repository.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/use_cases/get_all_questations.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/businessl_logic/bloc/questations_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
// Bloc

  sl.registerFactory(() => QuestationsBloc(getAllQuestationUseCase: sl()));

// Usecases

  sl.registerLazySingleton(
      () => GetAllQuestationUseCase(questationsRepository: sl()));

// Repository

  sl.registerLazySingleton<QuestationsRepository>(
      () => QuestationRepositoryImpl(
          questationsRemoteDataSource: sl(),
          //  questationsLocalDataSource: sl(),
          networkInfo: sl()));

// Datasources

  sl.registerLazySingleton<QuestationsRemoteDataSource>(
      () => QuestationRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<PostLocalDataSource>(
  //     () => PostLocalDataSourceImpl(sharedPreferences: sl()));

// Core

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

// External

  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
