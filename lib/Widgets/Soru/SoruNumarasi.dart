import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget numara(BuildContext context, int siraSayisi) {
  double yaziBoyutu = MediaQuery.of(context).size.width * 0.165;
  double en = MediaQuery.of(context).size.width;
  double boy = MediaQuery.of(context).size.height;
  double yaziAyari = MediaQuery.textScaleFactorOf(context);

  return Container(
    color: Colors.grey.shade200,
    //width: MediaQuery.of(context).size.width / 15,
    child: Padding(
      padding:  EdgeInsets.only(right: en/200,left: en/200),
      child: Text((siraSayisi + 1).toString(),
          style: GoogleFonts.josefinSans(
              fontWeight: FontWeight.bold, fontSize: yaziBoyutu/yaziAyari)),
    ),
  );
}
