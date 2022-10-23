import 'package:bmi_calc/app/cubit/core_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/enum.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool lang = true;
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, core) {
        return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF3CE761), Color(0xFF2BC0EF)])),
            child: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Settings Page'),
                        Icon(Icons.close_rounded)
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    LanguageField(lang: lang),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(59, 0, 0, 0),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Jednostki:'),
                          DropdownButton(
                              borderRadius: BorderRadius.circular(20),
                              dropdownColor: Color.fromARGB(255, 35, 228, 212),
                              value: core.unit,
                              items: Units.values.map((Units unit) {
                                return DropdownMenuItem<Units>(
                                    value: unit, child: Text(unit.label));
                              }).toList(),
                              onChanged: (Units? unit) {
                                context.read<CoreCubit>().changeUnit();
                              })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ));
      },
    );
  }
}

class LanguageField extends StatelessWidget {
  const LanguageField({
    Key? key,
    required this.lang,
  }) : super(key: key);

  final bool lang;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
          color: Color.fromARGB(59, 0, 0, 0),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text('Wybierz język'),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/pics/flag_pl.png'),
              ),
              Switch(
                  inactiveThumbColor: Colors.red,
                  activeColor: Colors.red,
                  inactiveTrackColor: Colors.amber,
                  activeTrackColor: Colors.amber,
                  value: lang,
                  onChanged: (value) {}),
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/pics/flag_uk.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
