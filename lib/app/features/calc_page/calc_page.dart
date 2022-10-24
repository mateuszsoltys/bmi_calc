import 'package:bmi_calc/app/cubit/core_cubit.dart';
import 'package:bmi_calc/app/features/settings_page/settings_page.dart';
import 'package:bmi_calc/models/animated_widgets/anim_widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/custom_TextInputFormatter.dart';
import '../../models/widgets/horizontal_picker_model.dart';

class CalcPage extends StatelessWidget {
  CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CoreCubit, CoreState>(
        builder: (context, core) {
          return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF3CE761), Color(0xFF2BC0EF)])),
              child: Center(
                child: Scaffold(
                  body: Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('calc page'),
                            InkWell(
                                child: const AnimatedSettings(),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SettingsPage()));
                                }),
                          ],
                        ),
                        InkWell(
                          child: const Icon(Icons.info_outline_rounded),
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: Text('BMI'),
                                      content: Text('Teskt o BMI'),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            child: Text('OK'))
                                      ],
                                    ));
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        //todo: Gender Field
                        Container(
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(59, 0, 0, 0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: [
                              Icon(Icons.man_rounded),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(Icons.woman_rounded),
                            ],
                          ),
                        ),
                        TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.digitsOnly,
                              NumericalRangeFormatter(min: 1, max: 100)
                            ],
                            onChanged: (String age) {
                              context.read<CoreCubit>().saveAge(age);
                            }),
                        HorizontalPicker(
                            fieldTitle: 'Twoja wysokość',
                            textUnit: 'cm',
                            unit: core.unit,
                            value: core.height,
                            minVal: 100,
                            maxVal: 200,
                            onChanged: context.read<CoreCubit>().saveHeight),
                        const SizedBox(height: 10),
                        HorizontalPicker(
                            fieldTitle: 'Twoja waga',
                            textUnit: 'kg',
                            unit: core.age,
                            value: core.weight,
                            minVal: 30,
                            maxVal: 200,
                            onChanged: context.read<CoreCubit>().saveWeight),
                        const SizedBox(height: 10),
                        //todo: ResultWidget
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
