import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarih/model/cevapModel.dart';
import 'package:tarih/model/soruModel.dart';
import 'package:tarih/providers/all_providers.dart';

Future<List<Sorular>> jsonOku(BuildContext context, WidgetRef ref,String metin) async {
  var siraSayisi = ref.watch(siraSayisiProvider);

  String okunanSoru =
      await DefaultAssetBundle.of(context).loadString("lib/SoruCevapJson/Sorular/$metin.json");
  // debugPrint(okunanSoru.toString());
  var okunanSoruJsonObject = await jsonDecode(okunanSoru);


  var tumSorular = Soru.fromMap(okunanSoruJsonObject);

  var tumCevaplar = await jsonOkuCevaplar(context,metin);
  for (int i = 0; i < tumSorular.sorular.length; i++)
    tumSorular.sorular[i].cevap = tumCevaplar[(i + 1).toString()];
    ref.read(siraSayisiProvider.notifier).state=0;
    toplamVarOlanSoruSayisiProvider=tumSorular.sorular.length;

  return tumSorular.sorular;
}

Future<Map<String, Cevap>> jsonOkuCevaplar(context,metin) async {
  //var siraSayisi=ref.watch(siraSayisiProvider);

  String okunanSoru = await DefaultAssetBundle.of(context)
      .loadString("lib/SoruCevapJson/Cevaplar/$metin-cevap.json");
  var okunanSoruJsonObject = await jsonDecode(okunanSoru);
 // print(okunanSoruJsonObject.toString());
  var tumCevaplar = CevapModel.fromJson(okunanSoruJsonObject);
 // print(tumCevaplar.cevap[0]);

  return tumCevaplar.cevap[0];
}
