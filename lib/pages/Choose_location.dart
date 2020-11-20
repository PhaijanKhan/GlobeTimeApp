import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_time_app/services/WorldTime.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Bangkok', location: 'BANGKOK', flag: 'thailand.png'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'HONG_KONG', flag: 'hong_kong.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'KOLKATA', flag: 'india.png'),
    WorldTime(url: 'Asia/Kabul', location: 'KABUL', flag: 'afganistan.png'),
    WorldTime(url: 'Asia/Seoul', location: 'SEOUL', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'JAKARTA', flag: 'indonesia.png'),

    WorldTime(url: 'Australia/Darwin', location: 'DARWIN', flag: 'australia.png'),
    WorldTime(url: 'Australia/Hobart', location: 'HOBART', flag: 'australia.png'),
    WorldTime(url: 'Australia/Perth', location: 'PERTH', flag: 'australia.png'),
    WorldTime(url: 'Australia/Sydney', location: 'SYDNEY', flag: 'australia.png'),

    WorldTime(url: 'Europe/London', location: 'LONDON', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'ATHENS', flag: 'germany.png'),
    WorldTime(url: 'Europe/Istanbul', location: 'ISTANBUL', flag: 'turkey.png'),
    WorldTime(url: 'Europe/Paris', location: 'PARIS', flag: 'france.png'),

    WorldTime(url: 'America/Chicago', location: 'CHICAGO', flag: 'usa.png'),
    WorldTime(url: 'America/Argentina/San_Luis', location: 'SAN_LUIS', flag: 'argentina.png'),
    WorldTime(url: 'America/Jamaica', location: 'JAMAICA', flag: 'jamaica.png'),
    WorldTime(url: 'America/New_York', location: 'NEW YORK', flag: 'usa.png'),
    WorldTime(url: 'America/Mexico_City', location: 'MEXICO_CITY', flag: 'Mexico_City.png'),

    WorldTime(url: 'Antarctica/Davis', location: 'DAVIS', flag: 'davis.jpg'),
    WorldTime(url: 'Antarctica/Syowa', location: 'SYOWA', flag: 'syowa.jpg'),
    WorldTime(url: 'Antarctica/Troll', location: 'TROLL', flag: 'troll_antarctica.jpg'),

    WorldTime(url: 'Africa/Abidjan', location: 'ABIDJAN', flag: 'Cote_dlvoire.png'),
    WorldTime(url: 'Africa/Cairo', location: 'CAIRO', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Johannesburg', location: 'JOHANNESBURG', flag: 'south_africa.png'),
    WorldTime(url: 'Africa/Lagos', location: 'LAGOS', flag: 'kenya.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'NAIROBI', flag: 'kenya.png'),
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
