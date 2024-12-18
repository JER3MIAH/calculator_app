import 'package:equatable/equatable.dart';

class CalculatorState extends Equatable {
  final String equation;
  final String result;
  final String expression;
  const CalculatorState({
    this.equation = '0',
    this.result = '0',
    this.expression = '',
  });

  @override
  List<Object> get props => [equation, result, expression];

  CalculatorState copyWith({
    String? equation,
    String? result,
    String? expression,
  }) {
    return CalculatorState(
      equation: equation ?? this.equation,
      result: result ?? this.result,
      expression: expression ?? this.expression,
    );
  }
}
