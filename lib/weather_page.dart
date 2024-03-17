import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/addtional_info.dart';
import 'package:weather_app/main_card.dart';
import 'package:weather_app/weather_cards.dart';
import 'package:http/http.dart' as http;
import 'package:dropdown_search/dropdown_search.dart';

// Future getData(String country) async {
//   Uri url = Uri(
//       scheme: 'http',
//       host: 'api.weatherapi.com',
//       path: 'v1/current.json',
//       queryParameters: {
//         'key': '9c814d122736458db8452447240903',
//         'q': country,
//         'aqi': 'yes'
//       });
//   try {
//     var responce = await http.get(url);
//     var data = jsonDecode(responce.body);
//     return data;
//   } catch (e) {
//     return {};
//   }
// }

class MyWeatherPage extends StatefulWidget {
  const MyWeatherPage({super.key});

  @override
  State createState() => _MyWeatherPagestate();
}

class _MyWeatherPagestate extends State {

  String? selectedItem = 'Addis Ababa' ;
  Map<String, dynamic> data = {};
  //get the data from the API
  Future getData({String? country}) async {
    Uri url = Uri(
        scheme: 'http',
        host: 'api.weatherapi.com',
        path: 'v1/current.json',
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

  @override
  void initState() {
    super.initState();
    getData(country: selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(country: selectedItem),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
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
                      getData();
                    });
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          body: snapshot.data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    DropdownSearch<String>(
                      selectedItem: selectedItem,
                    onChanged:(value) {
                      setState(() {
                        selectedItem = value;
                      });
                    } ,
                    
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const [
                        'Addis Ababa',
                        "Tokyo",
                        "New Delhi",
                        "Washington, D.C.",
                        "Beijing",
                        "Moscow",
                        "London",
                        "Paris",
                        "Berlin",
                        "Rome",
                        "Canberra",
                        "Brasília",
                        "Ottawa",
                        "Ankara",
                        "Madrid",
                        "Stockholm",
                        "Cairo",
                        "Dublin",
                        "Mexico City",
                        "Buenos Aires",
                        "Brussels",
                        "Bogotá",
                        "Santiago",
                        "Bangkok",
                        "Athens",
                        "Helsinki",
                        "Oslo",
                        "Amsterdam",
                        "Vienna",
                        "Islamabad",
                        "Dhaka",
                        "Nairobi",
                        "Kuala Lumpur",
                        "Manila",
                        "Lisbon",
                        "Warsaw",
                        "Seoul",
                        "Singapore",
                        "Wellington",
                        "Jakarta",
                        "Hanoi",
                        "Budapest",
                        "Prague",
                        "Copenhagen",
                        "Tehran",
                        "Jerusalem",
                        "Kiev",
                        "Manama",
                        "Doha",
                        "Abu Dhabi",
                        "Muscat",
                        "Kuwait City",
                        "San José",
                        "Panama City",
                        "Havana",
                        "Caracas",
                        "Lima",
                        "San Salvador",
                        "Guatemala City",
                        "Tegucigalpa",
                        "San Salvador",
                        "Guatemala City",
                        "Tegucigalpa",
                        "San Juan",
                        "Santo Domingo",
                        "Port-au-Prince",
                        "Kingston",
                        "Nassau",
                        "Belmopan",
                        "Paramaribo",
                        "Georgetown",
                        "Bridgetown",
                        "Port of Spain",
                        "Castries",
                        "Apia",
                        "Port Vila",
                        "Honiara",
                        "Palikir",
                        "Majuro",
                        "Funafuti",
                        "Tarawa",
                        "Yaren",
                        "South Tarawa",
                        "Avarua",
                        "Pago Pago",
                        "Ngerulmud",
                        "Hamilton",
                        "Charlotte Amalie",
                        "Gustavia",
                        "Saint-Pierre",
                        "The Valley",
                        "Oranjestad",
                        "Philipsburg",
                        "Cockburn Town",
                        "Basse-Terre",
                        "Fort-de-France",
                        "George Town",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish Cove",
                        "Kingston",
                        "Alofi",
                        "Hagåtña",
                        "Mata-Utu",
                        "Avarua",
                        "Willemstad",
                        "The Bottom",
                        "Kralendijk",
                        "Grytviken",
                        "Longyearbyen",
                        "Marigot",
                        "Gibraltar",
                        "Saint Helier",
                        "Saint Peter Port",
                        "Vaduz",
                        "Saint Peter Port",
                        "Douglas",
                        "St. Helier",
                        "Road Town",
                        "Jamestown",
                        "Adamstown",
                        "Flying Fish"
                      ],
                      dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          labelText: "Selected City",
                          hintText: "Select the city",
                        ),
                      ),

                    ),
                    MainCard(
                        curtemp: snapshot.data['current']['temp_c'].toString(),
                        icon: snapshot.data['current']['condition']['icon'],
                        cond: snapshot.data['current']['condition']['text']
                            .toString()),
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
                    Center(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AdditionalInfo(
                                label: 'Humidity',
                                value: snapshot.data.length > 1
                                    ? snapshot.data['current']['humidity']
                                        .toString()
                                    : "Looding ",
                                icon: Icons.water_drop),
                            AdditionalInfo(
                                label: 'Wind',
                                value: snapshot.data.length > 1
                                    ? snapshot.data['current']['wind_kph']
                                        .toString()
                                    : 'loading',
                                icon: Icons.air),
                            AdditionalInfo(
                                label: 'pressure',
                                value: snapshot.data.length > 1
                                    ? snapshot.data['current']['pressure_mb']
                                        .toString()
                                    : 'loading',
                                icon: Icons.south_america_sharp)
                          ],
                        ),
                      ),
                    )

                    //Addition inofrmation
                  ],
                ),
        );
      },
    );
  }
}
