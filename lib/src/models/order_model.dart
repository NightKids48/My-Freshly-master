// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

part of 'models.dart';

class OrderModel {
  final DateTime? dateTime;
  final String? productName;
  final double? totalPrice;
  final String? uid;
  final int? paymentStatus;
  final String? id;
  final List<ProductModel> products;
  OrderModel({
    this.dateTime,
    this.productName,
    this.totalPrice,
    this.uid,
    this.paymentStatus,
    this.id,
    required this.products,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'productName': productName,
      'totalPrice': totalPrice,
      'uid': uid,
      'paymentStatus': paymentStatus,
      'id': id,
      'products': products.map((x) => x.toMap()).toList(),
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
      productName:
          map['productName'] != null ? map['productName'] as String : null,
      totalPrice:
          map['totalPrice'] != null ? map['totalPrice'] as double : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      paymentStatus:
          map['paymentStatus'] != null ? map['paymentStatus'] as int : null,
      id: map['id'] != null ? map['id'] as String : null,
      products: List.from(
        (map['products']).map<ProductModel>(
          (x) => ProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
