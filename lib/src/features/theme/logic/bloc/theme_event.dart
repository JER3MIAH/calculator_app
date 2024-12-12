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
  const ChangeThemeEvent();
}
