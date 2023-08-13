
  import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarih/Widgets/Soru/SoruSayfasi.dart';
import 'package:tarih/providers/all_providers.dart';

  void soruSayfasinaGit(BuildContext context, ref, aa,String metin) async {
     Navigator.push(
       context, MaterialPageRoute(builder: (context) => SoruSayfasi(metin)));
  }


  veriOku(WidgetRef ref,Map<String, String> yillaraGoreDogruYanlis) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    for (int i = 2021; i > 2014; i--)
      yillaraGoreDogruYanlis[i.toString()] = pref.getString(i.toString());

    ref.read(dogruYanlisSayimProvider.notifier).state = yillaraGoreDogruYanlis;
  }

  List<String> sayiyaCevir(String aa) {
    print("çağrıldııııııııııııııııııı");
    RegExp regex = RegExp(r'\d+');
    Iterable<Match> matches = regex.allMatches(aa.toString());
    List<String> numbers = ["0","0"];
    int i=0;
    for (Match match in matches) {
      numbers[i] = match.group(0);
      i++;
    }
    return numbers; // [1234, 56]
  }