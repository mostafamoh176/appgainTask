part of 'questations_bloc.dart';

sealed class QuestationsState extends Equatable {
  const QuestationsState();

  @override
  List<Object> get props => [];
}

final class QuestationsInitial extends QuestationsState {}

final class QuestationsLoadingState extends QuestationsState {}

final class QuestationsLoadedState extends QuestationsState {
  final QuestationsEntities questationsEntities;

  QuestationsLoadedState({required this.questationsEntities});

  @override
  List<Object> get props => [questationsEntities];
}

final class QuestationsErrorState extends QuestationsState {
  final String errorMsg;
  QuestationsErrorState({required this.errorMsg});

  @override
  List<Object> get props => [errorMsg];
}
