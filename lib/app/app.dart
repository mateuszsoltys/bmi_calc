// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bmi_calc/app/cubit/core_cubit.dart';

import 'data/theme/theme_data.dart';
import 'features/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.preferences,
  }) : super(key: key);

  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CoreCubit(preferences),
        child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          title: 'BMI CALC',
          theme: appTheme(),
          home: const HomePage(),
        ));
  }
}
