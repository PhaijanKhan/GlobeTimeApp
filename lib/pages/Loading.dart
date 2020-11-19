import 'package:my_time_app/services/WorldTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time="loding....";

  void setupWorldTime() async{
    WorldTime instance=WorldTime(location:'KOLKATA',flag:'',url: 'Asia/Kolkata');
    print(instance);
    await instance.getTime();
    print(instance);
    Navigator.pushReplacementNamed(context, '/Home',arguments: {
      'location':instance.location,
      'time':instance.time,
      'isDaytime':instance.isDaytime,
    });
  }

  @override
  void initState()
  {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[700],
      body:SpinKitFadingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}