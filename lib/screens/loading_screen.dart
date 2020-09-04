
import 'dart:convert';

import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';


const apiKey = '2d6668717e9b7db99bc955ca06eebd94';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {

    super.initState();
    getLocationData();
  }

  void getLocationData() async{
   Location loc = new Location();
   await loc.getCurrentLocation();
   latitude = loc.latitude;
   longitude = loc.longitude;

   NetworkHelper helper = NetworkHelper("https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
   var weatherData = await helper.getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold( 
    );
  }
}
