import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarih/providers/all_providers.dart';

class DogruYanlisWidget extends ConsumerWidget {
  const DogruYanlisWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double yaziBoyutu = MediaQuery.of(context).size.width * 0.1;
    double yaziAyari = MediaQuery.textScaleFactorOf(context);
    double en = MediaQuery.of(context).size.width;

    var deger = ref.watch(dogruYanlisSayisiProvider);
    return  Container(
      width: en/1.5,
      child: Row(
          mainAxisAlignment :MainAxisAlignment.end,
          children: [
            Text(
              deger[0].toString(),
              style:    GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari,color: Colors.red) ,
            ),
            Text(
              ' / ',
               style:    GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari) ,
            ),
            Text(
              deger[1].toString() ,
               style:    GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari,color:Colors.green) ,
            ),
          ],
        
      ),
    );
  }
}
