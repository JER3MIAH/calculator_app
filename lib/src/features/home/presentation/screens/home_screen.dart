import 'package:calculator_app/src/features/theme/data/enums.dart';
import 'package:calculator_app/src/features/theme/logic/bloc/theme_state.dart';
import 'package:calculator_app/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (_, themeState) {
        return Scaffold(
          body: AppColumn(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    'Calc',
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        'THEME',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                      XBox(5),
                      GestureDetector(
                        onTap: () =>
                            context.read<ThemeBloc>().add(ChangeThemeEvent()),
                        child: SvgAsset(
                          switch (themeState.currentTheme) {
                            AppTheme.theme1 => theme1Icon,
                            AppTheme.theme2 => theme2Icon,
                            AppTheme.theme3 => theme3Icon,
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              YBox(10),
              Container(
                height: 128,
                decoration: BoxDecoration(
                  color: theme.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              YBox(30),
              Container(
                height: 480,
                decoration: BoxDecoration(
                  color: theme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
