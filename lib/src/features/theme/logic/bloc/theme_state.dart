import 'package:calculator_app/src/features/theme/data/enums.dart';
import 'package:equatable/equatable.dart';
export 'theme_bloc.dart';
export 'theme_event.dart';

class ThemeState extends Equatable {
  final AppTheme currentTheme;
  const ThemeState({
    this.currentTheme = AppTheme.theme1,
  });

  @override
  List<Object> get props => [currentTheme];

  ThemeState copyWith({
    AppTheme? currentTheme,
  }) {
    return ThemeState(
      currentTheme: currentTheme ?? this.currentTheme,
    );
  }
}
