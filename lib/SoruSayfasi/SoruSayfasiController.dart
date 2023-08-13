import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarih/providers/all_providers.dart';

geriButton(WidgetRef ref, BuildContext context, String metin,
    List<Color> siklarIcinBeyazRenk) async {
      
      Navigator.of(context).pop();
  String simdikiDogruYanlis =
      ref.read(dogruYanlisSayisiProvider.notifier).state[0].toString() +
          ' / ' +
          ref.read(dogruYanlisSayisiProvider.notifier).state[1].toString();  // Veri tabanına yazılacak değer ayarlandı
  SharedPreferences pref = await SharedPreferences.getInstance();
  
  ref.read(siraSayisiProvider.notifier).state = 10; // kaçıncı sorudayız değeri rastgele atandı state değişşin diye
  pref.setString(metin, simdikiDogruYanlis);  // yapılan doğruyanşış sayısı locale  yazıldı 
 
 
  ref.read(dogruYanlisSayisiProvider.notifier).state = [0, 0];
  ref.read(renkProvider.notifier).state = siklarIcinBeyazRenk;
  
  
  Map<String, String> yillaraGoreDogruYanlis =
      ref.read(dogruYanlisSayimProvider);
  yillaraGoreDogruYanlis[metin] = simdikiDogruYanlis;
  ref.read(dogruYanlisSayimProvider.notifier).state = {};
  ref.read(dogruYanlisSayimProvider.notifier).state = yillaraGoreDogruYanlis;
  cevapVerilsinMiProvider = 0;
  eskiCevaplar=List<Map<int,int>>.filled(30, {5:5});
}
