import 'package:calculator_app/src/features/theme/data/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState()) {
    on<GetSavedTheme>(_getSavedTheme);
    on<ChangeThemeEvent>(_changeTheme);
  }

  void _getSavedTheme(GetSavedTheme event, Emitter<ThemeState> emit) {}

  void _changeTheme(ChangeThemeEvent event, Emitter<ThemeState> emit) {
    emit(
      state.copyWith(
        currentTheme: switch (state.currentTheme) {
          AppTheme.theme1 => AppTheme.theme2,
          AppTheme.theme2 => AppTheme.theme3,
          AppTheme.theme3 => AppTheme.theme1,
        },
      ),
    );
  }
}
