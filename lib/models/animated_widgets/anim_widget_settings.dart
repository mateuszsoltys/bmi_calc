import 'package:flutter/widgets.dart';
import 'package:rive/rive.dart';

class AnimatedSettings extends StatelessWidget {
  const AnimatedSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        child: const RiveAnimation.asset(
            'assets/animations/anim_setting_ico.riv'));
  }
}
