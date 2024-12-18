import 'package:equatable/equatable.dart';

abstract class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class RegisterTap extends CalculatorEvent {
  final String buttontext;
  const RegisterTap({
    required this.buttontext,
  });

  @override
  List<Object> get props => [buttontext];
}
