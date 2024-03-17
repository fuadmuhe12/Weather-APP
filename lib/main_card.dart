
import 'dart:ui';

import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  final  String curtemp ;
  final  String cond;
  final String icon;

  const MainCard(  {super.key,required this.curtemp, required this.cond , required this.icon});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(44)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
        child: Card(
          shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: const EdgeInsets.all(12),
          elevation: 30,
          child: SizedBox(
            width: double.infinity,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('$curtemp °C', style: const TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),),
                 Image(image: NetworkImage('https:$icon')),
                 Text(cond, style: const TextStyle(fontSize: 18, color: Colors.white))
              ],
            ),
          ),
        ),
      ),
    );
  }

}

