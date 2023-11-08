import 'dart:convert';

import 'package:appgain_task/core/util/local_db.dart';
import 'package:appgain_task/feature/questionnaire_feature/data/models/questations_model.dart';
import 'package:dartz/dartz.dart';

abstract class QuestationsLocalDataSource {
  Future<Unit> cashedQueststions(QuestationsModel questationsModel);
}

class QuestationsLocalDataSourceImpl implements QuestationsLocalDataSource {
  final MyDatabase myDatabase;
  QuestationsLocalDataSourceImpl({required this.myDatabase});

  @override
  Future<Unit> cashedQueststions(questationsModel) {
    final Map<String, dynamic> data = json.decode(questationsModel as String);
    myDatabase.insertItem(data);
    return Future.value(unit);
  }
}
