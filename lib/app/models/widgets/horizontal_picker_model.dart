import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class HorizontalPicker extends StatelessWidget {
  HorizontalPicker({
    Key? key,
    required this.fieldTitle,
    required this.textUnit,
    required this.unit,
    required this.value,
    required this.minVal,
    required this.maxVal,
    required this.onChanged,
  }) : super(key: key);
  final fieldTitle;
  final textUnit;
  final onChanged;
  final unit;
  final value;
  final minVal;
  final maxVal;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromARGB(59, 0, 0, 0),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(fieldTitle),
          NumberPicker(
              selectedTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 28, 0, 94), fontSize: 30),
              textStyle: const TextStyle(color: Colors.amber),
              axis: Axis.horizontal,
              minValue: minVal,
              maxValue: maxVal,
              value: value,
              onChanged: (val) {
                onChanged.call(val);
              }),
          Text(textUnit),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
