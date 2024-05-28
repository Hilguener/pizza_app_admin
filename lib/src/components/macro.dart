import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyMacroWidget extends StatelessWidget {
  final String title;
  final int value;
  final IconData icon;
  final TextEditingController controller;
  const MyMacroWidget(
      {required this.title,
      required this.value,
      super.key,
      required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade400,
                offset: const Offset(2, 2),
                blurRadius: 5)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            FaIcon(
              icon,
              color: Colors.red,
            ),
            const SizedBox(
              height: 4.0,
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  suffixText: title == "Calories" ? '' : 'g',
                  isDense: true,
                  contentPadding: const EdgeInsets.all(8)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              title,
              style: const TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    ));
  }
}
