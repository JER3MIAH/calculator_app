import 'package:calculator_app/src/features/home/logic/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<BlocProvider> homeBlocProviders = [
  BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc()),
];
