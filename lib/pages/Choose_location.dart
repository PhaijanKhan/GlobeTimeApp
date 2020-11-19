import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_time_app/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', location: 'KOLKATA', flag: 'india.png'),
    WorldTime(url: 'Europe/London', location: 'LONDON', flag: 'uk.png'),
    WorldTime(url: 'America/Chicago', location: 'CHICAGO', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'NEW YORK', flag: 'usa.png'),
    WorldTime(url: 'Europe/Berlin', location: 'ATHENS', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'CAIRO', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'NAIROBI', flag: 'kenya.png'),
    WorldTime(url: 'Asia/Seoul', location: 'SEOUL', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'JAKARTA', flag: 'indonesia.png'),
  ];
  void updatTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "Choose Location",
          style: GoogleFonts.oswald(
            fontSize: 25,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  updatTime(index);
                },
                title: Text(
                  locations[index].location,
                  style: GoogleFonts.oswald(),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('images/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
