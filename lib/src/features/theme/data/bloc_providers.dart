import 'package:calculator_app/src/features/theme/logic/bloc/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> themeBlocProviders = [
  BlocProvider<ThemeBloc>(create: (_) => ThemeBloc()),
];
