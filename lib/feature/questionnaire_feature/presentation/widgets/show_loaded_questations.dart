import 'package:appgain_task/feature/questionnaire_feature/domain/entites/questations_entities.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/businessl_logic/bloc/questations_bloc.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/view/questation_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appgain_task/core/depency_injection/dI.dart' as di;

class ShowLoadedQuestations extends StatelessWidget {
  final List<QuestationsDetailsEntities> questations;
  ShowLoadedQuestations({
    Key? key,
    required this.questations,
  }) : super(key: key);
  ScrollController _scrollController = ScrollController();
  loadMore() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // The user has reached the end of the list, load more data for the next page.
        BlocProvider(
            create: (_) => di.sl<QuestationsBloc>()..add(GetEventQuestation()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: questations.length,
      controller: _scrollController,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(questations[index].answerCount.toString()),
          title: Text(
            questations[index].title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            questations[index].link,
            style: TextStyle(fontSize: 16),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => QuestationsDetailsScreen(
                  questationsDetailsEntities: questations[index],
                ),
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => Divider(thickness: 1),
    );
  }
}
