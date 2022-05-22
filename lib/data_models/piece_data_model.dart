// To parse this JSON data, do
//
//     final pieceModel = pieceModelFromJson(jsonString);

import 'dart:convert';

class PieceModel {
  PieceModel({
    required this.id,
    required this.type,
    required this.httpsOnerecordIataOrgCargoPieceCompanyIdentifier,
    required this.httpsOnerecordIataOrgCargoPieceShipper,
    required this.httpsOnerecordIataOrgCargoPieceCoload,
    required this.httpsOnerecordIataOrgCargoPieceDeclaredValueForCustoms,
    required this.httpsOnerecordIataOrgCargoPieceGoodsDescription,
    required this.httpsOnerecordIataOrgCargoPieceGrossWeight,
    required this.httpsOnerecordIataOrgCargoPieceNvdForCarriage,
    required this.httpsOnerecordIataOrgCargoPieceNvdForCustoms,
    required this.httpsOnerecordIataOrgCargoPiecePackagedeIdentifier,
    required this.httpsOnerecordIataOrgCargoPieceShippingMarks,
    required this.httpsOnerecordIataOrgCargoPieceSlac,
    required this.httpsOnerecordIataOrgCargoPieceStackable,
    required this.httpsOnerecordIataOrgCargoPieceTurnable,
    required this.httpsOnerecordIataOrgCargoPieceUpid,
  });

  String id;
  String type;
  String httpsOnerecordIataOrgCargoPieceCompanyIdentifier;
  HttpsOnerecordIataOrgCargoPieceShipper httpsOnerecordIataOrgCargoPieceShipper;
  bool httpsOnerecordIataOrgCargoPieceCoload;
  String httpsOnerecordIataOrgCargoPieceDeclaredValueForCustoms;
  String httpsOnerecordIataOrgCargoPieceGoodsDescription;
  String httpsOnerecordIataOrgCargoPieceGrossWeight;
  bool httpsOnerecordIataOrgCargoPieceNvdForCarriage;
  bool httpsOnerecordIataOrgCargoPieceNvdForCustoms;
  String httpsOnerecordIataOrgCargoPiecePackagedeIdentifier;
  String httpsOnerecordIataOrgCargoPieceShippingMarks;
  int httpsOnerecordIataOrgCargoPieceSlac;
  bool httpsOnerecordIataOrgCargoPieceStackable;
  bool httpsOnerecordIataOrgCargoPieceTurnable;
  String httpsOnerecordIataOrgCargoPieceUpid;

  factory PieceModel.fromRawJson(String str) =>
      PieceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PieceModel.fromJson(Map<String, dynamic> json) => PieceModel(
        id: json["@id"],
        type: json["@type"],
        httpsOnerecordIataOrgCargoPieceCompanyIdentifier:
            json["https://onerecord.iata.org/cargo#piece#companyIdentifier"],
        httpsOnerecordIataOrgCargoPieceShipper:
            HttpsOnerecordIataOrgCargoPieceShipper.fromJson(
                json["https://onerecord.iata.org/cargo#piece#shipper"]),
        httpsOnerecordIataOrgCargoPieceCoload:
            json["https://onerecord.iata.org/cargo#piece#coload"],
        httpsOnerecordIataOrgCargoPieceDeclaredValueForCustoms: json[
            "https://onerecord.iata.org/cargo#piece#declaredValueForCustoms"],
        httpsOnerecordIataOrgCargoPieceGoodsDescription:
            json["https://onerecord.iata.org/cargo#piece#goodsDescription"],
        httpsOnerecordIataOrgCargoPieceGrossWeight:
            json["https://onerecord.iata.org/cargo#piece#grossWeight"],
        httpsOnerecordIataOrgCargoPieceNvdForCarriage:
            json["https://onerecord.iata.org/cargo#piece#nvdForCarriage"],
        httpsOnerecordIataOrgCargoPieceNvdForCustoms:
            json["https://onerecord.iata.org/cargo#piece#nvdForCustoms"],
        httpsOnerecordIataOrgCargoPiecePackagedeIdentifier:
            json["https://onerecord.iata.org/cargo#piece#packagedeIdentifier"],
        httpsOnerecordIataOrgCargoPieceShippingMarks:
            json["https://onerecord.iata.org/cargo#piece#shippingMarks"],
        httpsOnerecordIataOrgCargoPieceSlac:
            json["https://onerecord.iata.org/cargo#piece#slac"],
        httpsOnerecordIataOrgCargoPieceStackable:
            json["https://onerecord.iata.org/cargo#piece#stackable"],
        httpsOnerecordIataOrgCargoPieceTurnable:
            json["https://onerecord.iata.org/cargo#piece#turnable"],
        httpsOnerecordIataOrgCargoPieceUpid:
            json["https://onerecord.iata.org/cargo#piece#upid"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
        "https://onerecord.iata.org/cargo#piece#companyIdentifier":
            httpsOnerecordIataOrgCargoPieceCompanyIdentifier,
        "https://onerecord.iata.org/cargo#piece#shipper":
            httpsOnerecordIataOrgCargoPieceShipper.toJson(),
        "https://onerecord.iata.org/cargo#piece#coload":
            httpsOnerecordIataOrgCargoPieceCoload,
        "https://onerecord.iata.org/cargo#piece#declaredValueForCustoms":
            httpsOnerecordIataOrgCargoPieceDeclaredValueForCustoms,
        "https://onerecord.iata.org/cargo#piece#goodsDescription":
            httpsOnerecordIataOrgCargoPieceGoodsDescription,
        "https://onerecord.iata.org/cargo#piece#grossWeight":
            httpsOnerecordIataOrgCargoPieceGrossWeight,
        "https://onerecord.iata.org/cargo#piece#nvdForCarriage":
            httpsOnerecordIataOrgCargoPieceNvdForCarriage,
        "https://onerecord.iata.org/cargo#piece#nvdForCustoms":
            httpsOnerecordIataOrgCargoPieceNvdForCustoms,
        "https://onerecord.iata.org/cargo#piece#packagedeIdentifier":
            httpsOnerecordIataOrgCargoPiecePackagedeIdentifier,
        "https://onerecord.iata.org/cargo#piece#shippingMarks":
            httpsOnerecordIataOrgCargoPieceShippingMarks,
        "https://onerecord.iata.org/cargo#piece#slac":
            httpsOnerecordIataOrgCargoPieceSlac,
        "https://onerecord.iata.org/cargo#piece#stackable":
            httpsOnerecordIataOrgCargoPieceStackable,
        "https://onerecord.iata.org/cargo#piece#turnable":
            httpsOnerecordIataOrgCargoPieceTurnable,
        "https://onerecord.iata.org/cargo#piece#upid":
            httpsOnerecordIataOrgCargoPieceUpid,
      };
}

class HttpsOnerecordIataOrgCargoPieceShipper {
  HttpsOnerecordIataOrgCargoPieceShipper({
    required this.id,
    required this.type,
  });

  String id;
  String type;

  factory HttpsOnerecordIataOrgCargoPieceShipper.fromRawJson(String str) =>
      HttpsOnerecordIataOrgCargoPieceShipper.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HttpsOnerecordIataOrgCargoPieceShipper.fromJson(
          Map<String, dynamic> json) =>
      HttpsOnerecordIataOrgCargoPieceShipper(
        id: json["@id"],
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
        "@type": type,
      };
}
