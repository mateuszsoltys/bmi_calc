import 'package:bmi_calc/app/cubit/core_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/theme/theme_data.dart';
import 'features/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CoreCubit()..start(),
      child: BlocBuilder<CoreCubit, CoreState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'BMI CALC',
            theme: appTheme(),
            home: const HomePage(),
          );
        },
      ),
    );
  }
}
