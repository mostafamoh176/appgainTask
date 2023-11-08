import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';

// ignore: must_be_immutable
class QuestationsModel extends QuestationsEntities {
  QuestationsModel({required super.items});
  factory QuestationsModel.fromJson(Map<String, dynamic> json) {
    final items = <QuestationsDetailsModel>[];
    json['items'].forEach((v) {
      items.add(QuestationsDetailsModel.fromJson(v));
    });
    return QuestationsModel(items: items);
  }
}

class QuestationsDetailsModel extends QuestationsDetailsEntities {
  const QuestationsDetailsModel(
      {required super.answerCount,
      required super.contentLicense,
      required super.creationDate,
      required super.isAnswered,
      required super.lastActivityDate,
      required super.owner,
      required super.questionId,
      required super.score,
      required super.tags,
      required super.viewCount,
      required super.link,
      required super.title});
  factory QuestationsDetailsModel.fromJson(Map<String, dynamic> json) {
    OwnerEntities handleOwnerObject(json) {
      return json['owner'] != null
          ? OwnerModel.from(json['owner'])
          : const OwnerModel(
              accountId: 0,
              displyName: "",
              name: "",
              profileImage: "",
              reputation: 0,
              userId: 0,
              userType: "");
    }

    return QuestationsDetailsModel(
        answerCount: json["answer_count"] ?? 0,
        contentLicense: json["content_license"] ?? "",
        creationDate: json["creation_date"],
        isAnswered: json["is_answered"],
        lastActivityDate: json["last_activity_date"] ?? 0,
        owner: json['owner'] != null
            ? OwnerModel.from(json['owner'])
            : const OwnerModel(
                accountId: 0,
                displyName: "",
                name: "",
                profileImage: "",
                reputation: 0,
                userId: 0,
                userType: ""),
        questionId: json["question_id"] ?? 0,
        score: json["score"] ?? 0,
        tags: json['tags'].cast<String>(),
        viewCount: json["view_count"] ?? 0,
        link: json["link"] ?? "",
        title: json["title"] ?? "");
  }
}

class OwnerModel extends OwnerEntities {
  const OwnerModel(
      {required super.accountId,
      required super.displyName,
      required super.name,
      required super.profileImage,
      required super.reputation,
      required super.userId,
      required super.userType});
  factory OwnerModel.from(Map<String, dynamic> json) {
    return OwnerModel(
        accountId: json["account_id"] ?? 0,
        displyName: json["display_name"],
        name: json["name"] ?? "",
        profileImage: json["profile_image"] ?? "",
        reputation: json["reputation"] ?? 0,
        userId: json["user_id"] ?? 0,
        userType: json["registered"] ?? "");
  }
}
