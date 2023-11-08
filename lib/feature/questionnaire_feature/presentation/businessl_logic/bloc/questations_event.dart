part of 'questations_bloc.dart';

sealed class QuestationsEvent extends Equatable {
  const QuestationsEvent();

  @override
  List<Object> get props => [];
}

class GetEventQuestation extends QuestationsEvent {}

class RefreshEventQuestations extends QuestationsEvent {}
