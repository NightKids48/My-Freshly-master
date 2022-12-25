// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'list_user_bloc.dart';

@immutable
abstract class ListUserState {}

class ListUserInitial extends ListUserState {}

class ListUserIsFailed extends ListUserState {
  final String message;
  ListUserIsFailed({
    required this.message,
  });
}

class ListUserIsSuccess extends ListUserState {
  final List<UserModel> data;
  ListUserIsSuccess({
    required this.data,
  });
}

class ListUserIsLoading extends ListUserState {}
