import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/addtional_info.dart';
import 'package:weather_app/main_card.dart';
import 'package:weather_app/weather_cards.dart';
import 'package:http/http.dart' as http;

Future getData() async {
  Uri url = Uri(
      scheme: 'http',
      host: 'api.weatherapi.com',
      path: 'v1/current.json',
      queryParameters: {
        'key': '9c814d122736458db8452447240903',
        'q': 'Addis Ababa',
        'aqi': 'yes'
      });
  try {
    var responce = await http.get(url);
    var data = jsonDecode(responce.body);
    return data;
  } catch (e) {
    return {};
  }
}

class MyWeatherPage extends StatefulWidget {
  const MyWeatherPage({super.key});

  @override
  State createState() => _MyWeatherPagestate();
}

class _MyWeatherPagestate extends State {
  Map<String, dynamic> data = {};
  //get the data from the API
  Future getData() async {
    Uri url = Uri(
        scheme: 'http',
        host: 'api.weatherapi.com',
        path: 'v1/current.json',
        queryParameters: {
          'key': '9c814d122736458db8452447240903',
          'q': 'Addis Ababa',
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

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting  ) {
          return const Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text("Weather App"),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      
                    });
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          body: snapshot.data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    MainCard(
                        curtemp: snapshot.data['current']['temp_c'].toString(),
                        icon: Icons.sunny,
                        cond: snapshot.data['current']['condition']['text'].toString()),
                    const SizedBox(
                      height: 20,
                    ),

                    const WeatherCard(),

                    const SizedBox(
                      height: 20,
                    ),

                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Additional Information ',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfo(
                            label: 'Humidity',
                            value: snapshot.data.length > 1
                                ? snapshot.data['current']['humidity'].toString()
                                : "Looding ",
                            icon: Icons.water_drop),
                        AdditionalInfo(
                            label: 'Wind',
                            value: snapshot.data.length > 1
                                ? snapshot.data['current']['wind_kph'].toString()
                                : 'loading',
                            icon: Icons.air),
                        AdditionalInfo(
                            label: 'pressure',
                            value: snapshot.data.length > 1
                                ? snapshot.data['current']['pressure_mb'].toString()
                                : 'loading',
                            icon: Icons.south_america_sharp)
                      ],
                    )

                    //Addition inofrmation
                  ],
                ),
        );
      },
    );
  }
}
