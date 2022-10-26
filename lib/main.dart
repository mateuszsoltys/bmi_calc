import 'package:bmi_calc/translations/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [Locale('en'), Locale('pl')],
    fallbackLocale: const Locale('pl'),
    assetLoader: CodegenLoader(),
    child: MyApp(
      preferences: preferences,
    ),
  ));
}
