import 'package:appgain_task/core/error/failure.dart';
import 'package:appgain_task/core/util/strings.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';
import 'package:appgain_task/feature/questionnaire_feature/domain/use_cases/get_all_questations.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'questations_event.dart';
part 'questations_state.dart';

class QuestationsBloc extends Bloc<QuestationsEvent, QuestationsState> {
  final GetAllQuestationUseCase getAllQuestationUseCase;
  QuestationsBloc({required this.getAllQuestationUseCase})
      : super(QuestationsInitial()) {
    on<QuestationsEvent>((event, emit) async {
      if (event is GetEventQuestation) {
        emit(QuestationsLoadingState());
        final questationsData = await getAllQuestationUseCase();
        questationsData.fold((failure) {
          emit(QuestationsErrorState(errorMsg: _mapFailureToMessage(failure)));
        }, (success) {
          emit(QuestationsLoadedState(questationsEntities: success));
        });
      }
      if (event is RefreshEventQuestations) {
        emit(QuestationsLoadingState());
        final questationsData = await getAllQuestationUseCase();
        questationsData.fold((failure) {
          emit(QuestationsErrorState(errorMsg: _mapFailureToMessage(failure)));
        }, (success) {
          emit(QuestationsLoadedState(questationsEntities: success));
        });
      }
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case EmptyCacheFailure:
        return EMPTY_CACHE_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later .";
    }
  }
}
