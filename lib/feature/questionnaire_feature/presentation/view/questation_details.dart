import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestationsDetailsScreen extends StatefulWidget {
  final QuestationsDetailsEntities questationsDetailsEntities;
  QuestationsDetailsScreen(
      {super.key, required this.questationsDetailsEntities});

  @override
  State<QuestationsDetailsScreen> createState() =>
      _QuestationsDetailsScreenState();
}

class _QuestationsDetailsScreenState extends State<QuestationsDetailsScreen> {
  var channel = MethodChannel("Toasty_show");

  showToast() {
    channel.invokeMethod("showToast");
  }

  @override
  void initState() {
    showToast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarShow(),
      body: _detailsQuestations(),
    );
  }

  AppBar _appBarShow() => AppBar(
        title: const Text("Questations Details"),
      );

  Widget _detailsQuestations() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: FadeInImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                widget.questationsDetailsEntities.owner.profileImage,
              ),
              placeholder: const AssetImage("assets/placehplder.webp"),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ListTile(
            title: Text(widget.questationsDetailsEntities.title),
            subtitle: Text('Score: ${widget.questationsDetailsEntities.score}'),
          )
        ],
      ),
    );
  }
}
