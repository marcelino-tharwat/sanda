import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressInitial());

  List<AddressModel> addresses = [];
  AddressModel? selectedAddress;

  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final zipCodeController = TextEditingController();

  void loadAddresses() {
    addresses = CacheHelper().getAddressList();
    emit(AddressLoaded(addresses));
  }
  Future<void> saveOrUpdateAddress({AddressModel? existingAddress}) async {
    AddressModel newAddress = AddressModel(
      address: addressController.text,
      city: cityController.text,
      zipCode: zipCodeController.text,
    );

    List<AddressModel> currentAddresses = CacheHelper().getAddressList();

    if (existingAddress != null) {
      int index = currentAddresses.indexWhere((e) =>
          e.address == existingAddress.address &&
          e.city == existingAddress.city &&
          e.zipCode == existingAddress.zipCode 
        )
        ;

      if (index != -1) {
        currentAddresses[index] = newAddress;
      }
    } else {
      currentAddresses.add(newAddress);
    }
    await CacheHelper().saveAddressList(currentAddresses);
    loadAddresses();
  }

  void selectAddress(AddressModel address) {
    selectedAddress = address;
    emit(AddressSelected());
  }

  void deleteAddress(AddressModel address) async {
    List<AddressModel> currentAddresses = CacheHelper().getAddressList();
    currentAddresses.removeWhere((e) =>
        e.address == address.address &&
        e.city == address.city &&
        e.zipCode == address.zipCode 
       );
    await CacheHelper().saveAddressList(currentAddresses);
    loadAddresses();
  }
}
