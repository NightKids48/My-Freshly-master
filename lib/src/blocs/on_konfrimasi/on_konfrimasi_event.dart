part of 'on_konfrimasi_bloc.dart';

@immutable
abstract class OnKonfrimasiEvent {}

class OnClickKonfrimasi extends OnKonfrimasiEvent {
  final OrderModel data;
  OnClickKonfrimasi({
    required this.data,
  });
}
