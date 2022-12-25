// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'admin_bloc.dart';

@immutable
abstract class AdminEvent {}

class AddProduct extends AdminEvent {
  final String? name;
  final double? price;
  final String? desc;
  final String? variants;
  final String? category;
  AddProduct({
    this.name,
    this.price,
    this.desc,
    this.variants,
    this.category,
  });
}
