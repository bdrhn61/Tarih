import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  
  int saniye;
  int dakika;
  startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.mounted)
        setState(() {
          if (saniye != 59)
            saniye++;
          else
            saniye = 0;
        });
    });
    Timer.periodic(Duration(minutes: 1), (timer) {
      if (this.mounted)
        setState(() {
          dakika++;
        });
    });
  }

  @override
  void initState() {
    super.initState();
    saniye = 0;
    dakika = 0;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    double yaziBoyutu = MediaQuery.of(context).size.width * 0.10;
    double yaziAyari = MediaQuery.textScaleFactorOf(context);
    double en = MediaQuery.of(context).size.width;
    return Container(
      width: en/1.5,
      child: SingleChildScrollView(
        scrollDirection : Axis.horizontal,
    reverse: true,
        child: Row(
          
          mainAxisAlignment :MainAxisAlignment.start,
          children: [
            Text(
              dakika.toString() + " : " ,
      
      
               style:    GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari) ,
            ),
            Text(
               saniye.toString(),
               style:    GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari) ,
            ),
          ],
        ),
      ),
    );
  }
}
