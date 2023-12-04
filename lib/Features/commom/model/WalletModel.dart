import 'dart:convert';
WalletModel walletModelFromJson(String str) => WalletModel.fromJson(json.decode(str));
String walletModelToJson(WalletModel data) => json.encode(data.toJson());
class WalletModel {
  WalletModel({
      this.cardNumber, 
      this.expireDate, 
      this.cardHolderName, 
      this.cvvCode,});

  WalletModel.fromJson(dynamic json) {
    cardNumber = json['cardNumber'];
    expireDate = json['expireDate'];
    cardHolderName = json['cardHolderName'];
    cvvCode = json['cvvCode'];
  }
  String? cardNumber;
  String? expireDate;
  String? cardHolderName;
  String? cvvCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cardNumber'] = cardNumber;
    map['expireDate'] = expireDate;
    map['cardHolderName'] = cardHolderName;
    map['cvvCode'] = cvvCode;
    return map;
  }

}