import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool lang = false;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/pics/flag_pl.png'),
                    ),
                    Switch(
                      value: lang,
                      onChanged: (value) {
                        lang = !value;
                      },
                    ),
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/pics/flag_uk.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
