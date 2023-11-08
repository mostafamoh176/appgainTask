import 'package:appgain_task/core/error/exception.dart';
import 'package:appgain_task/core/error/failure.dart';
import 'package:appgain_task/core/util/network.dart';
import 'package:appgain_task/feature/questionnaire_feature/data/data_source/local_data_source.dart';
import 'package:appgain_task/feature/questionnaire_feature/data/data_source/remote_data_source.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/repositories/questaions_repository.dart';
import 'package:dartz/dartz.dart';

class QuestationRepositoryImpl implements QuestationsRepository {
  final QuestationsRemoteDataSource questationsRemoteDataSource;
  //final QuestationsLocalDataSource questationsLocalDataSource;
  final NetworkInfo networkInfo;
  QuestationRepositoryImpl(
      {
      //required this.questationsLocalDataSource,
      required this.questationsRemoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, QuestationsEntities>> getQuestations() async {
    if (await networkInfo.isDeviceConnected) {
      try {
        final remoteQuestationsData =
            await questationsRemoteDataSource.getAllQuestations();
        // questationsLocalDataSource.cashedQueststions(remoteQuestationsData);
        return Right(remoteQuestationsData);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(EmptyCacheFailure());
      // try {
      //   // final cashedQuestationsData =
      //   //     await questationsLocalDataSource.getCashedQuestasions();
      //   // return Right(cashedQuestationsData);
      // } on EmptyCacheException {
      //   return Left(EmptyCacheFailure());
      // }
    }
  }
}
