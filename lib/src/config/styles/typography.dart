import 'package:flutter/cupertino.dart';

abstract class HotelChoosingTypography {
  HotelChoosingTypography._();

  static const displayLarge = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w600,
    fontSize: 30,
  );

  static const displaySmall = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );

  static const bodyLarge = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontSize: 22,
  );

  static const bodyMedium = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 16,
    letterSpacing: 0.1,
  );

  static const bodySmall = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static const labelSmall = TextStyle(
    fontFamily: 'SF Pro Display',
    fontWeight: FontWeight.w400,
    fontSize: 12,
  );
}
