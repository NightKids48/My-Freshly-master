part of 'list_order_admin_bloc.dart';

@immutable
abstract class ListOrderAdminState {}

class ListOrderAdminInitial extends ListOrderAdminState {}

class ListOrderAdminIsSuccess extends ListOrderAdminState {
  final List<OrderModel> model;
  ListOrderAdminIsSuccess({
    required this.model,
  });
}

class ListOrderAdminIsLoading extends ListOrderAdminState {}

class ListOrderAdminIsFailed extends ListOrderAdminState {
  final String message;
  ListOrderAdminIsFailed({
    required this.message,
  });
}
