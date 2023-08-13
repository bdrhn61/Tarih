// To parse this JSON data, do
//
//     final soru = soruFromMap(jsonString);

import 'dart:convert';

import 'package:tarih/model/cevapModel.dart';

Soru soruFromMap(String str) => Soru.fromMap(json.decode(str));

String soruToMap(Soru data) => json.encode(data.toMap());

class Soru {
    Soru({
        this.sorular,
    });

    List<Sorular> sorular;

    factory Soru.fromMap(Map<String, dynamic> json) => Soru(
        sorular: List<Sorular>.from(json["sorular"].map((x) => Sorular.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "sorular": List<dynamic>.from(sorular.map((x) => x.toMap())),
    };
}

class Sorular {
    Sorular({
        this.numarasi,
        this.soru,
        this.a,
        this.b,
        this.c,
        this.d,
        this.e,
        this.aciklama,
        this.ustsoru,
        this.ustara,
        this.i,
        this.ii,
        this.iii,
        this.iiii,
        this.iiiii,
        this.cevap
    });

    String numarasi;
    String soru;
    String a;
    String b;
    String c;
    String d;
    String e;
    String aciklama;
    String ustsoru;
    String ustara;
    String i;
    String ii;
    String iii;
    String iiii;
    String iiiii;
    Cevap cevap;

    factory Sorular.fromMap(Map<String, dynamic> json) => Sorular(
        numarasi: json["numarasi"],
        soru: json["soru"],
        a: json["A"],
        b: json["B"],
        c: json["C"],
        d: json["D"],
        e: json["E"],
        aciklama: json["aciklama"] == null ? null : json["aciklama"],
        ustsoru: json["ustsoru"] == null ? null : json["ustsoru"],
        ustara: json["ustara"] == null ? null : json["ustara"],
        i: json["I"] == null ? null : json["I"],
        ii: json["II"] == null ? null : json["II"],
        iii: json["III"] == null ? null : json["III"],
        iiii: json["IV"] == null ? null : json["IV"],
        iiiii: json["V"] == null ? null : json["V"],

    );

    Map<String, dynamic> toMap() => {
        "numarasi": numarasi,
        "soru": soru,
        "A": a,
        "B": b,
        "C": c,
        "D": d,
        "E": e,
        "aciklama": aciklama == null ? null : aciklama,
        "ustsoru": ustsoru == null ? null : ustsoru,
        "ustara": ustara == null ? null : ustara,
        "I": i == null ? null : i,
        "II": ii == null ? null : ii,
        "III": iii == null ? null : iii,
        "IV": iiii == null ? null : iiii,
        "V": iiiii == null ? null : iiiii,
    };
}
