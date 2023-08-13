import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarih/model/cevapModel.dart';
import 'package:tarih/providers/all_providers.dart';

// ignore: must_be_immutable
class Yazi extends ConsumerWidget {
  String sik;
  Cevap cevap;
  String icerik;
  int sayi;
  int siraSayisi;
  Color dogruRenk=Colors.green;
  Color yanlisRenk=Colors.red;
  
  Yazi(this.sik, this.icerik, this.cevap, this.sayi, BuildContext context,
      this.siraSayisi);

  Widget build(BuildContext context, WidgetRef ref) {
  double yaziBoyutu = MediaQuery.of(context).size.width * 0.055;
  double en = MediaQuery.of(context).size.width;
  double boy = MediaQuery.of(context).size.height;
    double yaziAyari = MediaQuery.textScaleFactorOf(context);


    print(" siklaaaarr  build !!!!!!");
    var renk = ref.watch(renkProvider);
    var dogruYanlis = ref.read(dogruYanlisSayisiProvider);
    List<Color> temp = [
      Colors.grey.shade300,
      Colors.grey.shade300,
      Colors.grey.shade300,
      Colors.grey.shade300,
      Colors.grey.shade300
    ];
    print("*************************************************************");
    if (eskiCevaplar[siraSayisi].keys.first != 5) {
      print("renk atamasi yapıldı");
      renk = temp;
      renk[eskiCevaplar[siraSayisi].keys.first] = dogruRenk;
      if (eskiCevaplar[siraSayisi].keys.first !=
          eskiCevaplar[siraSayisi].values.first)
        renk[eskiCevaplar[siraSayisi].values.first] = yanlisRenk ;

     // cevapVerilsinMiProvider++;
       print(cevapVerilsinMiProvider.toString()+' arttirildi 1');

    } else {
      renk = temp;
    }

    return InkWell(
      onTap: () {
        print(cevapVerilsinMiProvider.toString()+'+++');
        if (cevapVerilsinMiProvider == 0) {
          cevapVerilsinMiProvider++;
          print(cevapVerilsinMiProvider.toString()+' arttirildi 2');
          if (cevap.name.toString() != sik) {
            temp[sayi] = Colors.red;
            ref.read(dogruYanlisSayisiProvider.notifier).state = [
              dogruYanlis[0] + 1,
              dogruYanlis[1]
            ]; //dogruYanlis[0]+1;
            // dogruYanlis[0]=dogruYanlis[0]+1;

          } else {
            ref.read(dogruYanlisSayisiProvider.notifier).state = [
              dogruYanlis[0],
              dogruYanlis[1] + 1
            ];
          }

          switch (cevap) {
            case Cevap.A:
              temp[0] = dogruRenk;
              eskiCevaplar[siraSayisi] = {0: sayi};
              break;
            case Cevap.B:
              temp[1] = dogruRenk;
              eskiCevaplar[siraSayisi] = {1: sayi};
              break;
            case Cevap.C:
              temp[2] = dogruRenk;
              eskiCevaplar[siraSayisi] = {2: sayi};
              break;
            case Cevap.D:
              temp[3] = dogruRenk;
              eskiCevaplar[siraSayisi] = {3: sayi};
              break;
            case Cevap.E:
              temp[4] = dogruRenk;
              eskiCevaplar[siraSayisi] = {4: sayi};
              break;
          }

          ref.read(renkProvider.notifier).state = temp;
          print(eskiCevaplar.toString());
        }
      },
      child: Padding(
        padding:  EdgeInsets.only(left: en/50.0, right: en/50.0, top: boy/150),
        child: Container(
          decoration: BoxDecoration(
              color: renk[sayi],
             // border: Border.all(color: Colors.grey.shade400,width: 1),
              borderRadius: BorderRadius.circular(6)),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding:  EdgeInsets.only(left: en/15, bottom: boy/20, top: boy/50),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Text(
                    sik + ')  ' ,
                    style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari,fontWeight: FontWeight.bold) 
                  ),
                  Expanded(
                    child: Text(
                      icerik,
                      style:  GoogleFonts.josefinSans( fontSize: yaziBoyutu/yaziAyari) 
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
