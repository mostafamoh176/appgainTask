import 'dart:core';
import 'dart:core';

import 'package:equatable/equatable.dart';

class QuestationsEntities extends Equatable {
  List<QuestationsDetailsEntities> items;
  QuestationsEntities({required this.items});
  @override
  // TODO: implement props
  List<Object?> get props => [items];
}

class QuestationsDetailsEntities extends Equatable {
  final List<String> tags;
  final OwnerEntities owner;
  final bool isAnswered;
  final int viewCount;
  final int answerCount;
  final int score;
  final int lastActivityDate;
  final int creationDate;
  final int questionId;
  final String contentLicense;
  final String link;
  final String title;

  const QuestationsDetailsEntities(
      {required this.answerCount,
      required this.contentLicense,
      required this.creationDate,
      required this.isAnswered,
      required this.lastActivityDate,
      required this.owner,
      required this.questionId,
      required this.score,
      required this.tags,
      required this.viewCount,
      required this.link,
      required this.title});
  @override
  // TODO: implement props
  List<Object?> get props => [
        answerCount,
        contentLicense,
        creationDate,
        isAnswered,
        lastActivityDate,
        owner,
        questionId,
        score,
        tags,
        viewCount,
        link,
        title
      ];
}

class OwnerEntities extends Equatable {
  final int accountId;
  final int reputation;
  final int userId;
  final String userType;
  final String profileImage;
  final String displyName;
  final String name;

  const OwnerEntities(
      {required this.accountId,
      required this.displyName,
      required this.name,
      required this.profileImage,
      required this.reputation,
      required this.userId,
      required this.userType});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [accountId, displyName, name, profileImage, reputation, userId, userType];
}
