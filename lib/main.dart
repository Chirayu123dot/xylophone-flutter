import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              XylophoneButton(1),
              XylophoneButton(2),
              XylophoneButton(3),
              XylophoneButton(4),
              XylophoneButton(5),
              XylophoneButton(6),
              XylophoneButton(7),
            ],
          ),
        ),
      ),
    );
  }
}

class XylophoneButton extends StatefulWidget {
  final int noteNumber;

  const XylophoneButton(this.noteNumber);

  @override
  _XylophoneButtonState createState() => _XylophoneButtonState(noteNumber);
}

class _XylophoneButtonState extends State<XylophoneButton> {
  final player = AudioCache();
  final int noteNumber;

  _XylophoneButtonState(this.noteNumber);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          player.play('note$noteNumber.wav');
        },
        child: Text(
          'Note$noteNumber',
          style: TextStyle(color: Colors.white),
        ),
        style: TextButton.styleFrom(
          backgroundColor: getColor(noteNumber),
          shape: BeveledRectangleBorder(),
        ),
      ),
    );
  }
}

Color? getColor(int noteNumber) {
  switch (noteNumber) {
    case 1:
      return Colors.red;
    case 2:
      return Colors.orange;
    case 3:
      return Colors.yellow;
    case 4:
      return Colors.green;
    case 5:
      return Colors.lightBlue.shade900;
    case 6:
      return Colors.lightBlue;
    case 7:
      return Colors.purple;
  }
}
