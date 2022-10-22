import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool lang = true;
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
                const Text('Zmień język'),
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
                ),
                const Text('Jednostki:'),
                //todo: DropdownButton
              ],
            ),
          ),
        ));
  }
}
