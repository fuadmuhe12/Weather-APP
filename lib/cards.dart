import 'package:flutter/material.dart';

class CardsInd extends StatelessWidget {
  final String time;
  final IconData icon;
  final String tempValue;
  const CardsInd({super.key, required this.icon, required this.tempValue, required this.time});
   @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 30,
      child: SizedBox(
        width: 90,
        height: 100,
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
            Icon(
              icon,
              color: Colors.white,
              size: 25,
            ),
            Text('$tempValue °C', style: const TextStyle(fontSize: 13, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
