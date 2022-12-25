part of 'check_saved_cubit.dart';

@immutable
abstract class CheckSavedState {}

class CheckSavedInitial extends CheckSavedState {}

class CheckSavedIsSuccess extends CheckSavedState {}

class CheckSavedIsFailed extends CheckSavedState {}
