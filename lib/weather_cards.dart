import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:weather_app/cards.dart';

Future getData({String? country}) async {
  Uri url = Uri(
      scheme: 'http',
      host: 'api.weatherapi.com',
      path: 'v1/forecast.json',
      queryParameters: {
        'key': '9c814d122736458db8452447240903',
        'q': country ?? 'Addis Ababa',
        'aqi': 'yes'
      });
  try {
    var responce = await http.get(url);
    final res = jsonDecode(responce.body);
    return res;
  } catch (e) {
    return {};
  }
}

class WeatherCard extends StatelessWidget {
  const WeatherCard(this.data, {super.key});
  final Map data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15.0),
            child: Text(
              "Weather Forecast",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][0]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][0]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][0]
                        ['condition']['icon'],
                  ),
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][1]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][1]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][1]
                        ['condition']['icon'],
                  ),
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][3]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][3]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][3]
                        ['condition']['icon'],
                  ),
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][5]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][5]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][5]
                        ['condition']['icon'],
                  ),
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][7]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][7]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][7]
                        ['condition']['icon'],
                  ),
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][8]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][8]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][8]
                        ['condition']['icon'],
                  ),
                  CardsInd(
                    time: data['forecast']['forecastday'][0]['hour'][9]['time']
                        .toString()
                        .substring(10),
                    tempValue: data['forecast']['forecastday'][0]['hour'][9]
                            ['temp_c']
                        .toString(),
                    icon: data['forecast']['forecastday'][0]['hour'][9]
                        ['condition']['icon'],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
