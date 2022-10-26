import 'package:bmi_calc/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Scaffold(
          body: Center(
            child: Column(
              children: [
                Text(LocaleKeys.history.tr()),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 38, 171, 204),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, bottom: 0, top: 10),
                  height: 30,
                  child: Row(
                    children: const [Text('dane')],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
