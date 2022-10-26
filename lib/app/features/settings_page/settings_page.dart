import 'package:bmi_calc/app/cubit/core_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../translations/locale_keys.g.dart';
import '../../core/enum.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
            child: SafeArea(
              child: Scaffold(
                body: Center(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              iconSize: 50,
                              constraints: const BoxConstraints(),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.close_rounded,
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'titleSettings'.tr().toUpperCase(),
                            style: const TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(59, 0, 0, 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              LocaleKeys.infoLanguage.tr(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: core.language == Lang.pl
                                      ? Colors.blue
                                      : Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      context
                                          .read<CoreCubit>()
                                          .changeAndSaveLanguage(Lang.pl);
                                      await context
                                          .setLocale(const Locale('pl'));
                                    },
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundImage:
                                          AssetImage('assets/pics/flag_pl.png'),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 50),
                                CircleAvatar(
                                  radius: 25,
                                  backgroundColor: core.language == Lang.gb
                                      ? Colors.blue
                                      : Colors.transparent,
                                  child: InkWell(
                                    onTap: () async {
                                      context
                                          .read<CoreCubit>()
                                          .changeAndSaveLanguage(Lang.gb);
                                      await context
                                          .setLocale(const Locale('en'));
                                    },
                                    child: const CircleAvatar(
                                      radius: 20,
                                      backgroundImage:
                                          AssetImage('assets/pics/flag_uk.png'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20)
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(59, 0, 0, 0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(LocaleKeys.infoUnit.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                            DropdownButton(
                                borderRadius: BorderRadius.circular(20),
                                dropdownColor:
                                    const Color.fromARGB(255, 35, 228, 212),
                                value: core.unit,
                                items: Units.values.map((Units unit) {
                                  return DropdownMenuItem<Units>(
                                      value: unit, child: Text(unit.label));
                                }).toList(),
                                onChanged: (Units? unit) {
                                  context.read<CoreCubit>().changeUnit(unit);
                                })
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
