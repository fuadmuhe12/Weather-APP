import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/cards.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({super.key});

  @override
  State<WeatherCard> createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 12),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only(bottom: 15.0),
            child:  Text(
              "Weather Forecast",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:  [
                CardsInd(time:'12:00', tempValue: '14',icon: Icons.water_drop,),
                CardsInd(time:'6:00', tempValue: '22',icon: Icons.sunny),
                CardsInd(time:'1:00', tempValue: '19',icon: Icons.cloud_circle_sharp),
                CardsInd(time:'8:00', tempValue: '16',icon: Icons.sunny_snowing),
                CardsInd(time:'12:00', tempValue: '14',icon: Icons.water_drop,),
                CardsInd(time:'6:00', tempValue: '22',icon: Icons.sunny),
                CardsInd(time:'1:00', tempValue: '19',icon: Icons.cloud_circle_sharp),
                CardsInd(time:'8:00', tempValue: '16',icon: Icons.sunny_snowing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
