part of 'check_variant_cubit.dart';

@immutable
abstract class CheckVariantState {}

class CheckVariantInitial extends CheckVariantState {}

class CheckVariantIsSelected extends CheckVariantState {
  final String selectedVariant;

  CheckVariantIsSelected(this.selectedVariant);
}
