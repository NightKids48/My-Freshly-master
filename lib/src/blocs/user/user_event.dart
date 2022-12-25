part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoadUserData extends UserEvent {}

class LogOutUser extends UserEvent {}

// class FetchAllUser extends UserEvent {}

class ChangePhoto extends UserEvent {}
