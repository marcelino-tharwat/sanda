part of 'address_cubit.dart';

@immutable
sealed class AddressState {}

final class AddressInitial extends AddressState {}

final class AddressLoaded extends AddressState {
  final List<AddressModel> addresses;

  AddressLoaded(this.addresses);
}

final class AddressSelected extends AddressState {}
