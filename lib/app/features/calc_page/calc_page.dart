import 'package:bmi_calc/app/cubit/core_cubit.dart';
import 'package:bmi_calc/app/features/settings_page/settings_page.dart';
import 'package:bmi_calc/models/animated_widgets/anim_widget_settings.dart';
import 'package:bmi_calc/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/custom_TextInputFormatter.dart';
import '../../core/enum.dart';
import '../../models/widgets/horizontal_picker_model.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CalcPage extends StatelessWidget {
  CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, core) {
        return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF3CE761), Color(0xFF2BC0EF)])),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 60,
                        ),
                        const Text(
                          'BMI CALC',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
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
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(4),
                            constraints: const BoxConstraints(),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: const Text('BMI'),
                                        content: Text(LocaleKeys.txtBMI.tr()),
                                        actions: [
                                          TextButton(
                                              onPressed: () =>
                                                  Navigator.of(context).pop(),
                                              child: const Text('OK'))
                                        ],
                                      ));
                            },
                            icon: const Icon(Icons.info_outline_rounded)),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(59, 0, 0, 0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Row(
                              children: [
                                Material(
                                  type: MaterialType.circle,
                                  color: core.gender == Gender.man
                                      ? Colors.amber
                                      : Colors.transparent,
                                  child: IconButton(
                                      padding: const EdgeInsets.all(4),
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        context
                                            .read<CoreCubit>()
                                            .changeAndSaveGender(Gender.man);
                                      },
                                      icon: const Icon(Icons.man_rounded)),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Material(
                                  type: MaterialType.circle,
                                  color: core.gender == Gender.woman
                                      ? Colors.amber
                                      : Colors.transparent,
                                  child: IconButton(
                                      padding: const EdgeInsets.all(4),
                                      constraints: const BoxConstraints(),
                                      onPressed: () {
                                        context
                                            .read<CoreCubit>()
                                            .changeAndSaveGender(Gender.woman);
                                      },
                                      icon: const Icon(Icons.woman_rounded)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: TextFormField(
                                textAlign: TextAlign.center,
                                initialValue: core.age?.toString(),
                                decoration: InputDecoration(
                                    hintText: 'infoAge'.tr(),
                                    contentPadding: const EdgeInsets.all(10.0),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: Colors.greenAccent))),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                  FilteringTextInputFormatter.digitsOnly,
                                  NumericalRangeFormatter(min: 1, max: 100)
                                ],
                                onChanged: (String age) {
                                  context.read<CoreCubit>().saveAge(age);
                                }),
                          )
                        ],
                      ),
                    ),
                    HorizontalPicker(
                        fieldTitle: 'infoHeight'.tr(),
                        textUnit: core.unit == Units.iso ? 'cm' : 'in',
                        unit: core.unit,
                        value: core.height,
                        minVal: core.minValHeight,
                        maxVal: core.maxValHeight,
                        onChanged: context.read<CoreCubit>().saveHeight),
                    const SizedBox(height: 10),
                    HorizontalPicker(
                        fieldTitle: LocaleKeys.infoWeight.tr(),
                        textUnit: core.unit == Units.iso ? 'kg' : 'lbs',
                        unit: core.age,
                        value: core.weight,
                        minVal: core.minValWeight,
                        maxVal: core.maxValWeight,
                        onChanged: context.read<CoreCubit>().saveWeight),
                    const SizedBox(height: 10),
                    //todo: ResultWidget
                    if (core.bmi == 0.0) ...[
                      Text('infoBmi0'.tr())
                    ] else ...[
                      SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: core.gender == Gender.man ? 45 : 44,
                            interval: 2,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 25,
                                color: Colors.green,
                              )
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(
                                value: core.bmi,
                                enableAnimation: true,
                              )
                            ],
                            annotations: [
                              GaugeAnnotation(
                                widget: Text(core.weightGroup?.name.tr() ?? ''),
                                positionFactor: 0.6,
                                angle: 90,
                              ),
                              GaugeAnnotation(
                                widget: Text(
                                  'BMI: ${core.bmi.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                                positionFactor: 0.5,
                                angle: 90,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ],
                ),
              ),
            ));
      },
    );
  }
}
