// ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'dart:convert';

part of 'models.dart';

class ProductModel2 {
  final String? id;
  final DateTime? dateTime;
  final String? name;
  final double? price;
  final List<String>? pictures;
  final String? desc;
  final List<String>? variant;
  // final int? total;
  ProductModel2({
    this.id,
    this.dateTime,
    this.name,
    this.price,
    this.pictures,
    this.desc,
    this.variant,
    // this.total,
  });

  // ProductModel2({
  //   this.id,
  //   this.dateTime,
  //   this.name,
  //   this.price,
  //   this.pictures,
  //   this.desc,
  //   this.variant,
  // });

  // ProductModel2 copyWith({
  //   String? id,
  //   DateTime? dateTime,
  //   String? name,
  //   double? price,
  //   List<String>? pictures,
  //   String? desc,
  //   List<String>? variant,
  // }) {
  //   return ProductModel2(
  //     id: id ?? this.id,
  //     dateTime: dateTime ?? this.dateTime,
  //     name: name ?? this.name,
  //     price: price ?? this.price,
  //     pictures: pictures ?? this.pictures,
  //     desc: desc ?? this.desc,
  //     variant: variant ?? this.variant,
  //   );
  // }

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'dateTime': dateTime?.millisecondsSinceEpoch,
  //     'name': name,
  //     'price': price,
  //     'pictures': pictures,
  //     'desc': desc,
  //     'variant': variant,
  //   };
  // }

  // factory ProductModel2.fromMap(Map<String, dynamic> map) {
  //   return ProductModel2(
  //     id: map['id'] != null ? map['id'] as String : null,
  //     dateTime: map['dateTime'] != null
  //         ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
  //         : null,
  //     name: map['name'] != null ? map['name'] as String : null,
  //     price: map['price'] != null ? map['price'] as double : null,
  //     pictures: map['pictures'] != null ? List.from(map['pictures']) : [],
  //     desc: map['desc'] != null ? map['desc'] as String : null,
  //     variant: map['variant'] != null ? List.from(map['variant']) : [],
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory ProductModel2.fromJson(String source) =>
  //     ProductModel2.fromMap(json.decode(source) as Map<String, dynamic>);

  ProductModel2 copyWith({
    String? id,
    DateTime? dateTime,
    String? name,
    double? price,
    List<String>? pictures,
    String? desc,
    List<String>? variant,
    // int? total,
  }) {
    return ProductModel2(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      name: name ?? this.name,
      price: price ?? this.price,
      pictures: pictures ?? this.pictures,
      desc: desc ?? this.desc,
      variant: variant ?? this.variant,
      // total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'dateTime': dateTime?.millisecondsSinceEpoch,
      'name': name,
      'price': price,
      'pictures': pictures,
      'desc': desc,
      'variant': variant,
      // 'total': total,
    };
  }

  factory ProductModel2.fromMap(Map<String, dynamic> map) {
    return ProductModel2(
      id: map['id'] != null ? map['id'] as String : null,
      dateTime: map['dateTime'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int)
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as double : null,
      pictures: map['pictures'] != null ? List.from(map['pictures']) : [],
      desc: map['desc'] != null ? map['desc'] as String : null,
      variant: map['variant'] != null ? List.from(map['variant']) : [],
      // total: map['total'] != null ? map['total'] as int : 1,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel2.fromJson(String source) =>
      ProductModel2.fromMap(json.decode(source) as Map<String, dynamic>);
}
