import 'package:flutter/material.dart';
import 'package:my_time_app/pages/Choose_location.dart';
import 'package:my_time_app/pages/Home.dart';
import 'package:my_time_app/pages/Loading.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
         '/':(context)=>Loading(),
       // Loading.routeName: (context) => Loading(),
        '/Home': (context) => Home(),
        '/location': (context) => ChooseLocation(),
      },
    ));
