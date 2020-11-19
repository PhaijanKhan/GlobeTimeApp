import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldTime {

  String time;
  String location;
  String url;
  String flag;
  bool isDaytime;

  WorldTime({this.location, this.isDaytime, this.flag, this.url});

  Future<void> getTime() async {
    http.Response response =
    // http://worldtimeapi.org/api/timezone/Asia/Kolkata
        await http.get('http://worldtimeapi.org/api/timezone/$url');
    print(response);
    Map bhi = jsonDecode(response.body);
    String datetime = bhi['datetime'];
    String offset = bhi['utc_offset'].substring(1, 3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);
  }

  @override
  String toString() {
    return 'class WorldTime[location: ${this.location}, url: ${this.url}]';
  }
}
