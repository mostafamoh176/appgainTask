import 'package:appgain_task/core/error/failure.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/repositories/questaions_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllQuestationUseCase {
  final QuestationsRepository questationsRepository;
  GetAllQuestationUseCase({required this.questationsRepository});
  Future<Either<Failure, QuestationsEntities>> call() {
    return questationsRepository.getQuestations();
  }
}
