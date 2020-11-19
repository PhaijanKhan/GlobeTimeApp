import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    print(data);
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "World Time",
          style: GoogleFonts.oswald(
            fontSize: 40,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100.0)),
            image: DecorationImage(
              image: AssetImage('images/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 65, 0, 0),
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("images/earth.png"),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: GoogleFonts.oswald(
                        fontSize: 28.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  data['time'],
                  style: GoogleFonts.oswald(
                    fontSize: 56.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 70.0,
                ),
                Center(
                  child: ButtonTheme(
                    minWidth: 350.0,
                    height: 50.0,
                    child: FlatButton.icon(
                      onPressed: () async {
                        dynamic results =
                            await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': results['time'],
                            'location': results['location'],
                            'isDaytime': results['isDaytime'],
                          };
                        });
                      },
                      icon: Icon(
                        Icons.edit_location,
                        color: Colors.grey[300],
                      ),
                      label: Text(
                        "Edit Location",
                        style: GoogleFonts.oswald(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      color: Colors.blue[900],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
