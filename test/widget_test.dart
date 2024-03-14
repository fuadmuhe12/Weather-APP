import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//http://api.weatherapi.com/v1/current.json?key=9c814d122736458db8452447240903&q=Addis Ababa&aqi=yes

Future<String> getData() async{
  Uri url = Uri(
    scheme: 'http',
    host: 'api.weatherapi.com',
    path: 'v1/current.json',
    queryParameters: {
      'key' :'9c814d122736458db8452447240903',
      'q':'Addis Ababa',
      'aqi':'yes'
    }
  );
  try {
      var responce =  await http.get(url);
      return responce.body;
  } catch (e) {
    debugPrint(e.toString());
    
  }
  return 'fetch Not succesfull';
}


void main() async {
  var reslt  = await getData();
  print(jsonDecode(reslt)['current']);
}