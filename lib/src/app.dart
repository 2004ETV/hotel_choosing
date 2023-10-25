import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hotel_choosing/src/config/routes/routes.dart';
import 'package:hotel_choosing/src/config/styles/themes.dart';

class HotelChoosingApp extends HookWidget {
  const HotelChoosingApp({super.key});

  @override
  Widget build(BuildContext context) {
    final platformBrightness = usePlatformBrightness();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: platformBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark,
      ),
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routes.all,
      theme: HotelChoosingThemes.light,
      darkTheme: HotelChoosingThemes.dark,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
