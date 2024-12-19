import 'package:equatable/equatable.dart';
import 'package:calculator_app/src/features/home/data/data.dart';

class CalculatorState extends Equatable {
  final String result;
  final CalcStatus status;
  const CalculatorState({
    this.result = '',
    this.status = CalcStatus.normal,
  });

  @override
  List<Object> get props => [result, status];

  CalculatorState copyWith({
    String? result,
    CalcStatus? status,
  }) {
    return CalculatorState(
      result: result ?? this.result,
      status: status ?? this.status,
    );
  }
}
