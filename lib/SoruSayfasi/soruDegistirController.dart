import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tarih/providers/all_providers.dart';

sonrakiSoru(WidgetRef ref, List<Color> siklarIcinBeyazRenk, int siraSayisi) {
  if (siraSayisi < toplamVarOlanSoruSayisiProvider - 1) {
    ref.read(siraSayisiProvider.notifier).state++;
    ref.read(renkProvider.notifier).state = siklarIcinBeyazRenk;
    if (eskiCevaplar[siraSayisi + 1].containsKey(5))
      cevapVerilsinMiProvider = 0;
    else
      cevapVerilsinMiProvider = 1;
  }
}

oncekiSoru(WidgetRef ref, List<Color> siklarIcinBeyazRenk, int siraSayisi) {
  if (siraSayisi > 0) {
    cevapVerilsinMiProvider = 0;
    ref.read(siraSayisiProvider.notifier).state--;
    ref.read(renkProvider.notifier).state = siklarIcinBeyazRenk;
    if (eskiCevaplar[siraSayisi - 1].containsKey(5))
      cevapVerilsinMiProvider = 0;
    else
      cevapVerilsinMiProvider = 1;
  }
}
