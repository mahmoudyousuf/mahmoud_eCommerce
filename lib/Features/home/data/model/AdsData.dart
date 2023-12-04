import 'dart:convert';
AdsData adsDataFromJson(String str) => AdsData.fromJson(json.decode(str));
String adsDataToJson(AdsData data) => json.encode(data.toJson());
class AdsData {
  AdsData({
      this.ads, 
      this.showAds,});

  AdsData.fromJson(dynamic json) {
    if (json['ads'] != null) {
      ads = [];
      json['ads'].forEach((v) {
        ads?.add(Ads.fromJson(v));
      });
    }
    showAds = json['showAds'];
  }
  List<Ads>? ads;
  bool? showAds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (ads != null) {
      map['ads'] = ads?.map((v) => v.toJson()).toList();
    }
    map['showAds'] = showAds;
    return map;
  }

}

Ads adsFromJson(String str) => Ads.fromJson(json.decode(str));
String adsToJson(Ads data) => json.encode(data.toJson());
class Ads {
  Ads({
      this.isShowAd, 
      this.adUrl,});

  Ads.fromJson(dynamic json) {
    isShowAd = json['isShowAd'];
    adUrl = json['adUrl'];
  }
  bool? isShowAd;
  String? adUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isShowAd'] = isShowAd;
    map['adUrl'] = adUrl;
    return map;
  }

}