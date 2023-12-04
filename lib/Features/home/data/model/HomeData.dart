import 'dart:convert';
HomeData homeDataFromJson(String str) => HomeData.fromJson(json.decode(str));
String homeDataToJson(HomeData data) => json.encode(data.toJson());
class HomeData {
  HomeData({
      this.data,});

  HomeData.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ProductData.fromJson(v));
      });
    }
  }
  List<ProductData>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

ProductData dataFromJson(String str) => ProductData.fromJson(json.decode(str));
String dataToJson(ProductData data) => json.encode(data.toJson());
class ProductData {
  ProductData({
      this.internalName, 
      this.title, 
      this.metacriticLink, 
      this.dealID, 
      this.storeID, 
      this.gameID, 
      this.salePrice, 
      this.normalPrice, 
      this.isOnSale, 
      this.savings, 
      this.metacriticScore, 
      this.steamRatingText, 
      this.steamRatingPercent, 
      this.steamRatingCount, 
      this.steamAppID, 
      this.releaseDate, 
      this.lastChange, 
      this.dealRating, 
      this.thumb,});

  ProductData.fromJson(dynamic json) {
    internalName = json['internalName'];
    title = json['title'];
    metacriticLink = json['metacriticLink'];
    dealID = json['dealID'];
    storeID = json['storeID'];
    gameID = json['gameID'];
    salePrice = json['salePrice'];
    normalPrice = json['normalPrice'];
    isOnSale = json['isOnSale'];
    savings = json['savings'];
    metacriticScore = json['metacriticScore'];
    steamRatingText = json['steamRatingText'];
    steamRatingPercent = json['steamRatingPercent'];
    steamRatingCount = json['steamRatingCount'];
    steamAppID = json['steamAppID'];
    releaseDate = json['releaseDate'];
    lastChange = json['lastChange'];
    dealRating = json['dealRating'];
    thumb = json['thumb'];
  }
  String? internalName;
  String? title;
  String? metacriticLink;
  String? dealID;
  String? storeID;
  String? gameID;
  String? salePrice;
  String? normalPrice;
  String? isOnSale;
  String? savings;
  String? metacriticScore;
  String? steamRatingText;
  String? steamRatingPercent;
  String? steamRatingCount;
  String? steamAppID;
  int? releaseDate;
  int? lastChange;
  String? dealRating;
  String? thumb;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['internalName'] = internalName;
    map['title'] = title;
    map['metacriticLink'] = metacriticLink;
    map['dealID'] = dealID;
    map['storeID'] = storeID;
    map['gameID'] = gameID;
    map['salePrice'] = salePrice;
    map['normalPrice'] = normalPrice;
    map['isOnSale'] = isOnSale;
    map['savings'] = savings;
    map['metacriticScore'] = metacriticScore;
    map['steamRatingText'] = steamRatingText;
    map['steamRatingPercent'] = steamRatingPercent;
    map['steamRatingCount'] = steamRatingCount;
    map['steamAppID'] = steamAppID;
    map['releaseDate'] = releaseDate;
    map['lastChange'] = lastChange;
    map['dealRating'] = dealRating;
    map['thumb'] = thumb;
    return map;
  }

}