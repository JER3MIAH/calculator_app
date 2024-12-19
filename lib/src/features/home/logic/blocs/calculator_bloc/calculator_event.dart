import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class GetExpressionResult extends CalculatorEvent {
  final String expression;
  const GetExpressionResult({
    required this.expression,
  });

  @override
  List<Object> get props => [expression];
}

class ResetStateEvent extends CalculatorEvent {
  const ResetStateEvent();
}
