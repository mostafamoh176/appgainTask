import 'package:appgain_task/core/depency_injection/dI.dart' as di;
import 'package:appgain_task/core/util/theme.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/businessl_logic/bloc/questations_bloc.dart';
import 'package:appgain_task/feature/questionnaire_feature/presentation/view/questations_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => di.sl<QuestationsBloc>()..add(GetEventQuestation()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme,
        home: const QuestationView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
