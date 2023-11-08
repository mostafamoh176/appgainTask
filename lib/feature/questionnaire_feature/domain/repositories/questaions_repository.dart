import 'package:appgain_task/core/error/failure.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';
import 'package:dartz/dartz.dart';

abstract class QuestationsRepository {
  Future<Either<Failure, QuestationsEntities>> getQuestations();
}
