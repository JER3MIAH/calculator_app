import 'package:calculator_app/src/features/home/data/data.dart';
import 'package:calculator_app/src/features/home/logic/blocs/calculator_bloc/calculator_event.dart';
import 'package:calculator_app/src/features/home/logic/blocs/calculator_bloc/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<GetExpressionResult>((event, emit) {
      try {
        Expression exp = Parser().parse(event.expression);
        ContextModel contextModel = ContextModel();
        String result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';
        emit(state.copyWith(
          result: result,
          status: CalcStatus.normal,
        ));
      } catch (e) {
        emit(state.copyWith(
          result: 'Format error',
          status: CalcStatus.error,
        ));
      }
    });

    on<ResetStateEvent>((event, emit) {
      emit(
        state.copyWith(
          result: '',
          status: CalcStatus.normal,
        ),
      );
    });
  }
}
