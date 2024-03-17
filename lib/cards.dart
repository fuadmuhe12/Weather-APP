import 'package:flutter/material.dart';

class CardsInd extends StatelessWidget {
  final String time;
  final String icon;
  final String tempValue;
  const CardsInd(
      {super.key,
      required this.icon,
      required this.tempValue,
      required this.time});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 30,
      child: SizedBox(
        width: 90,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              time,
              style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Image(
              image: NetworkImage('https:$icon'),
            ),
            Text('$tempValue °C',
                style: const TextStyle(fontSize: 13, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
