import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:tarih/SoruSayfasi/SoruSayfasiController.dart';
import 'package:tarih/SoruSayfasi/soruDegistirController.dart';
import 'package:tarih/Widgets/Soru/Aciklama.dart';
import 'package:tarih/Widgets/Soru/Siklar.dart';
import 'package:tarih/Widgets/Soru/SoruNumarasi.dart';
import 'package:tarih/Widgets/Top/TimerWidget.dart';
import 'package:tarih/api/api.dart';
import 'package:tarih/Widgets/Top/dogruYanlisWidget.dart';
import 'package:tarih/model/soruModel.dart';
import 'package:tarih/providers/all_providers.dart';

class SoruSayfasi extends ConsumerStatefulWidget {
  String metin;
  SoruSayfasi(this.metin, {Key key});

  @override
  SoruSayfasiState createState() => SoruSayfasiState(metin);
}

class SoruSayfasiState extends ConsumerState {
  String metin;
  SoruSayfasiState(this.metin);
  // Map<String,String> yillaraGoreDogruYanlis={};
  List<Color> siklarIcinBeyazRenk = [
    Colors.grey.shade300,
    Colors.grey.shade300,
    Colors.grey.shade300,
    Colors.grey.shade300,
    Colors.grey.shade300
  ];
  Future<List<Sorular>> localdenOkunanSorular;

  @override
  Future<void> initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      localdenOkunanSorular = jsonOku(context, ref, metin);
    });
  }

  @override
  Widget build(BuildContext context) {
    var siraSayisi = ref.watch(siraSayisiProvider);

    double en = MediaQuery.of(context).size.width;
    double boy = MediaQuery.of(context).size.height;

    return WillPopScope(
      // ignore: missing_return
      onWillPop: () async {
        geriButton(ref, context, metin, siklarIcinBeyazRenk);
      },
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: boy / 14, // en tepedeki başluk
                  ),
                  
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        numara(context, siraSayisi),
                        Padding(
                          padding: EdgeInsets.only(
                              right: en / 20, bottom: boy / 100),
                          child: Column(
                            children: [
                              TimerWidget(),
                              DogruYanlisWidget(),
                            ],
                          ),
                        ),
                      ],
                    ),
               
                  Container(
                    color: Colors.grey.shade200,
                    child: Center(
                      child: FutureBuilder(
                        future: localdenOkunanSorular,
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (snapshot.hasData) {
                            List<Sorular> sorum = snapshot.data;
                            return Center(
                              child: Column(children: [
                                Container(
                                  //  height: MediaQuery.of(context).size.height / 5,

                                  //  color: Colors.red,

                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Row(
                                      children: [
                                        // numara(context, siraSayisi),
                                        aciklama(context, sorum[siraSayisi])
                                      ],
                                    ),
                                  ),
                                ),
                                Yazi(
                                    "A",
                                    sorum[siraSayisi].a,
                                    sorum[siraSayisi].cevap,
                                    0,
                                    context,
                                    siraSayisi),
                                Yazi(
                                    "B",
                                    sorum[siraSayisi].b,
                                    sorum[siraSayisi].cevap,
                                    1,
                                    context,
                                    siraSayisi),
                                Yazi(
                                    "C",
                                    sorum[siraSayisi].c,
                                    sorum[siraSayisi].cevap,
                                    2,
                                    context,
                                    siraSayisi),
                                Yazi(
                                    "D",
                                    sorum[siraSayisi].d,
                                    sorum[siraSayisi].cevap,
                                    3,
                                    context,
                                    siraSayisi),
                                Yazi(
                                    "E",
                                    sorum[siraSayisi].e,
                                    sorum[siraSayisi].cevap,
                                    4,
                                    context,
                                    siraSayisi),
                              ]),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(strokeWidth: 1),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: InkWell(
                        onTap: () async {
                          oncekiSoru(ref, siklarIcinBeyazRenk, siraSayisi);
                        },
                        child: Opacity(
                          opacity: 0.65,
                          child: Image.asset(
                            'lib/images/geri.png',
                            width: en / 4,
                            height: boy / 10.5,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        sonrakiSoru(ref, siklarIcinBeyazRenk, siraSayisi);
                      },
                      child: Opacity(
                        opacity: 0.65,
                        child: Image.asset(
                          'lib/images/ileri.png',
                          width: en / 4,
                          height: boy / 10.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ])),
    );
  }
}
