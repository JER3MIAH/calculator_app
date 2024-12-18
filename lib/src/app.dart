import 'package:calculator_app/src/features/home/data/bloc_providers.dart';
import 'package:calculator_app/src/features/theme/data/enums.dart';
import 'package:flutter/material.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/navigation/nav.dart';
import 'features/theme/data/bloc_providers.dart';
import 'features/theme/data/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/theme/logic/bloc/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...themeBlocProviders,
        ...homeBlocProviders,
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Calculator',
            theme: switch (state.currentTheme) {
              AppTheme.theme1 => theme1,
              AppTheme.theme2 => theme2,
              AppTheme.theme3 => theme3,
            },
            routes: {
              AppRoutes.home: (context) => HomeScreen(),
            },
            initialRoute: AppRoutes.home,
          );
        },
      ),
    );
  }
}
