import 'package:flutter/material.dart';

const _primaryColor = Color.fromARGB(255, 64, 138, 203);
const _secondaryColor = Color.fromARGB(255, 96, 99, 195);
const _successColor = Color(0xFF77b300);
const _infoColor = Color(0xFF9933cc);
const _warningColor = Color(0xFFff8800);
const _dangerColor = Color.fromARGB(255, 223, 48, 36);
const _light = Color(0xFFf8f9fa);
const _dark = Color(0xFF060606);

const _textColorDark = _dark;
const _textColorLight = _light;

enum AppColorVariant {
  primary,
  secondary,
  info,
  success,
  warning,
  danger,
  light,
  dark,
}

enum AppSizeVariant {
  xs,
  sm,
  md,
  lg,
  xl,
}

extension CustomColorScheme on ColorScheme {
  Color? get primary => _primaryColor;
  Color get secondary => _secondaryColor;
  Color get success => _successColor;
  Color get info => _infoColor;
  Color get warning => _warningColor;
  Color get danger => _dangerColor;
  Color get light => _light;
  Color get dark => _dark;

  Color get text => brightness == Brightness.light ? _textColorDark : _textColorLight;

  // buttons
  Color? get primaryButtonBg => primary;
  Color get primaryButtonFg => const Color(0xFFFFFFFF);

  Color get secondaryButtonBg => secondary;
  Color get secondaryButtonFg => const Color(0xFFFFFFFF);

  Color get infoButtonBg => info;
  Color get infoButtonFg => const Color(0xFFFFFFFF);

  Color get dangerButtonBg => danger;
  Color get dangerButtonFg => const Color(0xFFFFFFFF);

  Color get successButtonBg => success;
  Color get successButtonFg => const Color(0xFFFFFFFF);

  Color get warningButtonBg => warning;
  Color get warningButtonFg => const Color(0xFFFFFFFF);

  Color get lightButtonBg => light;
  Color get lightButtonFg => const Color(0xFF000000);

  Color get darkButtonBg => dark;
  Color get darkButtonFg => const Color(0xFFFFFFFF);

  Color get drawerBackground => brightness == Brightness.light ? Colors.white70 : Colors.black87;
  Color get bottomSheetBackground => brightness == Brightness.light ? Colors.white70 : Colors.black87;
}

class AppTheme {
  final ThemeData themeData;

  const AppTheme({
    required this.themeData,
  });

  factory AppTheme.light() {
    return AppTheme(
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: _primaryColor != null
            ? ColorScheme.fromSeed(
                seedColor: _primaryColor,
                brightness: Brightness.light,
              )
            : const ColorScheme.light(),
      ),
    );
  }

  factory AppTheme.dark() {
    return AppTheme(
      themeData: ThemeData(
        useMaterial3: true,
        colorScheme: _primaryColor != null
            ? ColorScheme.fromSeed(
                seedColor: _primaryColor,
                brightness: Brightness.dark,
              )
            : const ColorScheme.dark(),
      ),
    );
  }

  static Color appVariantToColor(
    BuildContext context,
    AppColorVariant variant, [
    double opacity = 1.0,
  ]) {
    final colors = Theme.of(context).colorScheme;
    switch (variant) {
      case AppColorVariant.primary:
        return colors.primary.withOpacity(opacity);
      case AppColorVariant.secondary:
        return colors.secondary.withOpacity(opacity);
      case AppColorVariant.info:
        return colors.info.withOpacity(opacity);
      case AppColorVariant.success:
        return colors.success.withOpacity(opacity);
      case AppColorVariant.warning:
        return colors.warning.withOpacity(opacity);
      case AppColorVariant.danger:
        return colors.danger.withOpacity(opacity);
      case AppColorVariant.light:
        return colors.light.withOpacity(opacity);
      case AppColorVariant.dark:
        return colors.dark.withOpacity(opacity);
    }
  }
}
