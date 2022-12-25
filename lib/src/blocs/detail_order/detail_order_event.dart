part of 'detail_order_bloc.dart';

@immutable
abstract class DetailOrderEvent {}

class FetchDetailOrder extends DetailOrderEvent {
  final String docId;

  FetchDetailOrder(this.docId);
}
