import 'package:audioplayers/audio_cache.dart';                                        // This is needed for AudioPlayer.
import 'package:audioplayers/audioplayers.dart';                                       // This is needed for AudioPlayer.
import 'package:flutter/material.dart';

typedef void OnError(Exception exception);

class Blank extends StatelessWidget {
  static AudioPlayer advancedPlayer = new AudioPlayer();                               // This is needed for AudioPlayer.
  static AudioCache audioCache= new AudioCache(fixedPlayer: advancedPlayer);           // This is needed for AudioPlayer.
  static AudioPlayer audioPlayer = AudioPlayer();                                      // This is needed for AudioPlayer.
  static String vTitle = 'My Audio app';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(vTitle),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              Blank.audioCache.play('bells.mp3');                                       // This is needed for AudioPlayer.
            },
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(new MaterialApp(debugShowCheckedModeBanner: false,home:  Blank()));
}