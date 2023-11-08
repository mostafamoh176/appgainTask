import 'dart:convert';

import 'package:appgain_task/core/error/exception.dart';
import 'package:appgain_task/feature/questionnaire_feature/data/models/questations_model.dart';
import 'package:http/http.dart' as http;

abstract class QuestationsRemoteDataSource {
  Future<QuestationsModel> getAllQuestations();
}

const String baseUrl =
    "https://api.stackexchange.com/2.2/questions?site=stackoverflow&key=u5iadw6QkaseAHLc6H25IA((";

//We can implement different third-party library to get remote data
class QuestationRemoteDataSourceImpl implements QuestationsRemoteDataSource {
  final http.Client client;
  QuestationRemoteDataSourceImpl({required this.client});
  int currentPage = 1;
  int pageSize = 10;
  @override
  Future<QuestationsModel> getAllQuestations() async {
    final Uri uri = Uri.https('api.stackexchange.com', '/2.2/questions', {
      'site': 'stackoverflow',
      'key': 'u5iadw6QkaseAHLc6H25IA((',
      'page': "$currentPage",
      'pagesize': "$pageSize"
    });
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      currentPage++;
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      return QuestationsModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }
}
