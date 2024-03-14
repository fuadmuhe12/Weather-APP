import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
   final String label;
   final String value;
   final IconData icon;
   const AdditionalInfo({super.key, required this.label,required  this.value, required this.icon});
  
  @override
  Widget build(BuildContext context) {
    return  Card(
      color: const Color.fromARGB(255, 28, 26, 26),
      elevation: 0,
      child: SizedBox(
        width: 90,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            Text(label,
                style: const TextStyle(fontSize: 13, color: Colors.white)),
            Text(value, style: const TextStyle(fontSize: 13, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
