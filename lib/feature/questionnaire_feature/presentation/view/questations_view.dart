import 'package:appgain_task/feature/questionnaire_feature/presentation/businessl_logic/bloc/questations_bloc.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/widgets/loading_widget.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/widgets/message_display_widget.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/widgets/show_loaded_questations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestationView extends StatelessWidget {
  const QuestationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() => AppBar(title: Text("questations"));
  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BlocBuilder<QuestationsBloc, QuestationsState>(
          builder: (context, state) {
        if (state is QuestationsLoadingState) {
          return LoadingWidget();
        } else if (state is QuestationsLoadedState) {
          return RefreshIndicator(
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () => _onRefresh(context: context),
            child: ShowLoadedQuestations(
              questations: state.questationsEntities.items,
            ),
          );
        } else if (state is QuestationsErrorState) {
          return MessageDisplayWidget(message: state.errorMsg);
        }
        return LoadingWidget();
      }),
    );
  }

  Future<void> _onRefresh({required BuildContext context}) async {
    BlocProvider.of<QuestationsBloc>(context).add(RefreshEventQuestations());
  }
}
