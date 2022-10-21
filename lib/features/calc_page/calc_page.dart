import 'package:bmi_calc/features/settings_page/settings_page.dart';
import 'package:bmi_calc/models/animated_widgets/anim_widget_settings.dart';
import 'package:flutter/material.dart';

class CalcPage extends StatelessWidget {
  const CalcPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
