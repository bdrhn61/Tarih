import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarih/model/soruModel.dart';

Widget aciklama(BuildContext context, Sorular sorum) {
 final en= MediaQuery.of(context).size.width/80;
 double yaziBoyutu = MediaQuery.of(context).size.width * 0.055;
  double yaziAyari = MediaQuery.textScaleFactorOf(context);
  print((yaziBoyutu).toString()+"---------");
print((yaziAyari).toString()+"---------");

print((yaziBoyutu/yaziAyari).toString()+"---------");
   
  // ignore: unused_local_variable
  double boy = MediaQuery.of(context).size.height;
  return Expanded(
    child: Container(
      
      color: Colors.grey.shade200,
      child: Column(children: [
        if (sorum.aciklama != null)
          Container(
              width: (MediaQuery.of(context).size.width * 19) / 19,
              child: Padding(
              padding:  EdgeInsets.only(left:en,right:en),
                child: Text(
                  sorum.aciklama.toString(),
                  style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
                ),
              ),
            
          ),
          
        if (sorum.ustsoru != null)
          Container(
            color:Colors.grey.shade200,
            width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                sorum.ustsoru.toString(),
                style:  GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari) 
              ),
            ),
          ),
          if (sorum.ustara != null)
          Container(
            color:Colors.grey.shade200,
            width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                sorum.ustara.toString(),
                style:  GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari) 
               ),
              ),
            ),
          
        if (sorum.i != null)
          Container(
          color:Colors.grey.shade200,
           width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                'I. ' + sorum.i.toString(),
                style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
              ),
            ),
          ),
        if (sorum.ii != null)
          Container(
            color:Colors.grey.shade200,
            width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                'II. ' + sorum.ii.toString(),
                style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
              ),
            ),
          ),
        if (sorum.iii != null)
          Container(
            color:Colors.grey.shade200,
            width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                'III. ' + sorum.iii.toString(),
                style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
              ),
            ),
          ),
        if (sorum.iiii != null)
          Container(
            color:Colors.grey.shade200,
            width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                'IV. ' + sorum.iiii.toString(),
                style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
              ),
            ),
          ),
               if (sorum.iiiii != null)
          Container(
            color:Colors.grey.shade200,
            width: (MediaQuery.of(context).size.width * 19) / 19,
            child: Padding(
              padding: EdgeInsets.only(left:en,right:en),
              child: Text(
                'V. ' + sorum.iiiii.toString(),
                style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
              ),
            ),
          ),
           if (sorum.soru != null)
          Container(
            color:Colors.grey.shade200,
              width: (MediaQuery.of(context).size.width * 19) / 19,
              child: Padding(
              padding:  EdgeInsets.only(left:en,right:en),
                child: Text(
                  sorum.soru.toString(),
                  style:  GoogleFonts.josefinSans( fontWeight: FontWeight.bold,fontSize: yaziBoyutu/yaziAyari) ),

                ),
              ),
            
          
      ]),
    ),
  );
}
