import 'package:bmi_calc/app/features/calc_page/calc_page.dart';
import 'package:bmi_calc/app/features/history_page/history_page.dart';
import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF3CE761), Color(0xFF2BC0EF)])),
        child: Scaffold(
            body: DraggableBottomSheet(
                minExtent: 50,
                useSafeArea: false,
                curve: Curves.easeIn,
                previewWidget: _previewWidget(),
                backgroundWidget: CalcPage(),
                expandedWidget: HistoryPage(),
                onDragging: (pos) {})));
  }
}

Widget _previewWidget() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: 40,
          height: 6,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: const Text(
            'HISTORIA',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
