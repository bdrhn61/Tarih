import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

int cevapVerilsinMiProvider=0;
int toplamVarOlanSoruSayisiProvider=0;
List<Map<int,int>> eskiCevaplar=List<Map<int,int>>.filled(30, {5:5});


final siraSayisiProvider = StateProvider<int>((ref) {
  return 100;
});


final dogruYanlisSayisiProvider = StateProvider<List<int>>((ref) {
    
  return [0,0];
});

final renkProvider = StateProvider<List<Color>>((ref) {
  return [Colors.white, Colors.white, Colors.white, Colors.white, Colors.white];
});



final dogruYanlisSayimProvider = StateProvider<Map<String,String>>((ref) {
  return {'2020':'0/0','2019':'0/0'};
});


