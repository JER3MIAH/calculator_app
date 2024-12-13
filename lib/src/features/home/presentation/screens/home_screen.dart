import 'package:calculator_app/src/features/theme/data/colors.dart';
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
    final fontSize = (KDeviceType(context).isMobile ? 20 : 28).toDouble();
    const items = [
      '7',
      '8',
      '9',
      'DEL',
      '4',
      '5',
      '6',
      '+',
      '1',
      '2',
      '3',
      '-',
      '.',
      '0',
      '/',
      'x'
    ];

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
                    color: themeState.currentTheme == AppTheme.theme1
                        ? theme.onSurface
                        : theme.onPrimary,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: AppText(
                          'THEME',
                          color: themeState.currentTheme == AppTheme.theme1
                              ? theme.onSurface
                              : theme.onPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      XBox(15),
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
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.surfaceContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              YBox(30),
              Container(
                height: 420,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                        itemCount: items.length,
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisExtent: 64,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                        ),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return AppButton(
                            title: item,
                            fontSize: item == 'DEL' ? fontSize : null,
                            color: item == 'DEL' ? theme.secondary : null,
                            shadowColor:
                                themeState.currentTheme == AppTheme.theme3
                                    ? appColors.theme3EqualsKeyShadow
                                    : null,
                            textColor:
                                item == 'DEL' ? appColors.whiteText : null,
                            onTap: () {},
                          );
                        },
                      ),
                    ),
                    YBox(15),
                    Row(
                      children: [
                        Expanded(
                          child: AppButton(
                            title: 'RESET',
                            color: theme.secondary,
                            hoverColor: theme.secondaryContainer,
                            textColor: appColors.whiteText,
                            fontSize: fontSize,
                            onTap: () {},
                          ),
                        ),
                        XBox(15),
                        Expanded(
                          child: AppButton(
                            title: '=',
                            textColor:
                                themeState.currentTheme == AppTheme.theme3
                                    ? Colors.black
                                    : appColors.whiteText,
                            color: theme.tertiary,
                            hoverColor: theme.tertiaryContainer,
                            fontSize: fontSize,
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
