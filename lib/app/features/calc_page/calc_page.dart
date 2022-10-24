import 'package:bmi_calc/app/cubit/core_cubit.dart';
import 'package:bmi_calc/app/features/settings_page/settings_page.dart';
import 'package:bmi_calc/models/animated_widgets/anim_widget_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcPage extends StatelessWidget {
  CalcPage({super.key});

  final ageValue = TextEditingController();

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
                            // controller: ageValue,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.digitsOnly,
                              NumericalRangeFormatter(min: 1, max: 100)
                            ],
                            onChanged: (String age) {
                              context.read<CoreCubit>().saveAge(age);
                            }),

                        Text('Wpisany wiek to: ${core.age}')
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

class NumericalRangeFormatter extends TextInputFormatter {
  final int min;
  final int max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return TextEditingValue().copyWith(text: min.toStringAsFixed(0));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
