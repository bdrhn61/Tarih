// To parse this JSON data, do
//
//     final cevapModel = cevapModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CevapModel cevapModelFromJson(String str) => CevapModel.fromJson(json.decode(str));

String cevapModelToJson(CevapModel data) => json.encode(data.toJson());

class CevapModel {
    CevapModel({
         this.cevap,
    });

    final List<Map<String, Cevap>> cevap;

    factory CevapModel.fromJson(Map<String, dynamic> json) => CevapModel(
        cevap: List<Map<String, Cevap>>.from(json["cevap"].map((x) => Map.from(x).map((k, v) => MapEntry<String, Cevap>(k, cevapValues.map[v])))),
    );

    Map<String, dynamic> toJson() => {
        "cevap": List<dynamic>.from(cevap.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, cevapValues.reverse[v])))),
    };
}

enum Cevap { D, A, B, E, C }

final cevapValues = EnumValues({
    "A": Cevap.A,
    "B": Cevap.B,
    "C": Cevap.C,
    "D": Cevap.D,
    "E": Cevap.E
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
