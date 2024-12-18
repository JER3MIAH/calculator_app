import 'package:calculator_app/src/features/home/logic/blocs/calculator_bloc/calculator_event.dart';
import 'package:calculator_app/src/features/home/logic/blocs/calculator_bloc/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<RegisterTap>((event, emit) {
      
    });
  }
}
