import 'package:calculator_app/src/features/theme/data/enums.dart';
import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class GetSavedTheme extends ThemeEvent {
  const GetSavedTheme();
}

class ChangeThemeEvent extends ThemeEvent {
  final AppTheme theme;
  const ChangeThemeEvent({
    required this.theme,
  });

  @override
  List<Object> get props => [theme];
}
