import 'package:flutter/material.dart';
import 'SpeedRegulator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const _title = 'Jogging Pacer';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyHomePage(
        title: _title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double targetRunningSpeed = 50;
  bool musicPlaying = false;

  @override
  Widget build(BuildContext context) {
    SpeedRegulator speedRegulator = new SpeedRegulator(targetRunningSpeed);
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          // use same color as strava
          backgroundColor: Colors.deepOrange),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Text(
                "RUNNING SPEED",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              targetRunningSpeed.toString(),
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w900),
            ),
            Slider(
              value: targetRunningSpeed,
              min: 0,
              max: 100,
              divisions: 10,
              activeColor: Colors.pink,
              onChanged: (double value) {
                setState(() {
                  targetRunningSpeed = value;
                  speedRegulator.changeRunningSpeed(targetRunningSpeed);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Text(
                  "Just slide the Slider to increase\nor decrease target running speed",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Transform.scale(
                  scale: 5,
                  child: IconButton(
                      icon: Icon(musicPlaying ? Icons.pause : Icons.play_arrow),
                      tooltip: "play or pause music",
                      onPressed: () {
                        setState(() {
                          musicPlaying = !musicPlaying;
                          speedRegulator.playMusic(musicPlaying);
                        });
                      })),
            ),
            Text("Play/Pause Music"),
          ],
        ),
      ),
    );
  }
}
