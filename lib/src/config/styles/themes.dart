import 'package:flutter/material.dart';
import 'package:hotel_choosing/src/config/styles/colors.dart';
import 'package:hotel_choosing/src/config/styles/dimensions.dart';
import 'package:hotel_choosing/src/config/styles/typography.dart';

abstract class HotelChoosingThemes {
  HotelChoosingThemes._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.light,
      background: HotelChoosingColors.cultured,
      onBackground: Colors.white,
      primary: Colors.black,
      secondary: HotelChoosingColors.gunmetal,
      secondaryContainer: HotelChoosingColors.lotion,
      onPrimary: HotelChoosingColors.brandeisBlue,
      onSecondary: HotelChoosingColors.chromeYellow,
      onSecondaryContainer: HotelChoosingColors.philippineYellow,
    ),
    textTheme: TextTheme(
      displayLarge: HotelChoosingTypography.displayLarge.copyWith(
        color: Colors.black,
      ),
      displaySmall: HotelChoosingTypography.displaySmall.copyWith(
        color: Colors.black,
      ),
      bodyLarge: HotelChoosingTypography.bodyLarge.copyWith(
        color: Colors.black,
      ),
      bodyMedium: HotelChoosingTypography.bodyMedium.copyWith(
        color: Colors.black,
      ),
      bodySmall: HotelChoosingTypography.bodySmall.copyWith(
        color: Colors.black,
      ),
      labelSmall: HotelChoosingTypography.labelSmall.copyWith(
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: const MaterialStatePropertyAll(
          HotelChoosingTypography.bodyMedium,
        ),
        backgroundColor: const MaterialStatePropertyAll(
          HotelChoosingColors.brandeisBlue,
        ),
        foregroundColor: const MaterialStatePropertyAll(
          Colors.white,
        ),
        elevation: const MaterialStatePropertyAll(0),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              HotelChoosingDimensions.large,
            ),
          ),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      titleTextStyle: HotelChoosingTypography.displaySmall.copyWith(
        color: Colors.black,
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: HotelChoosingColors.lotion,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          HotelChoosingDimensions.extraSmall,
        ),
      ),
      labelStyle: HotelChoosingTypography.bodyMedium.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.black.withOpacity(.4),
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      elevation: 0,
      pressElevation: 0,
    ),
    listTileTheme: ListTileThemeData(
      horizontalTitleGap: 12,
      titleTextStyle: HotelChoosingTypography.bodyMedium.copyWith(
        color: HotelChoosingColors.gunmetal,
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: HotelChoosingTypography.bodySmall.copyWith(
        color: HotelChoosingColors.gunmetal.withOpacity(.4),
      ),
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.zero,
      iconColor: HotelChoosingColors.gunmetal,
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: HotelChoosingColors.brandeisBlue,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStatePropertyAll(
          HotelChoosingTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          HotelChoosingColors.brandeisBlue.withOpacity(.1),
        ),
        foregroundColor: const MaterialStatePropertyAll(
          HotelChoosingColors.brandeisBlue,
        ),
        iconColor: const MaterialStatePropertyAll(
          HotelChoosingColors.brandeisBlue,
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              HotelChoosingDimensions.extraSmall,
            ),
          ),
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.fromLTRB(10, 5, 2, 5),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HotelChoosingColors.cultured,
      labelStyle: HotelChoosingTypography.bodyMedium.copyWith(
        fontSize: 17,
        color: Colors.black.withOpacity(.4),
      ),
      hintStyle: HotelChoosingTypography.bodyMedium.copyWith(
        fontSize: 17,
        color: Colors.black.withOpacity(.4),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      floatingLabelStyle: HotelChoosingTypography.labelSmall.copyWith(
        fontSize: 18,
        color: Colors.black.withOpacity(.4),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(HotelChoosingDimensions.small),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: HotelChoosingColors.brandeisBlue.withOpacity(.1),
      foregroundColor: HotelChoosingColors.brandeisBlue,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      disabledElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      brightness: Brightness.dark,
    ),
  );
}
