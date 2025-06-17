import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
import 'package:sanda/features/paymnet/data/model/payment_model.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;
  static const storage = FlutterSecureStorage();

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setData({required String key, required dynamic value}) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      throw ArgumentError("Unsupported type for SharedPreferences");
    }
  }

  String? getString({required String key}) {
    return prefs.getString(key);
  }

  int? getInt({required String key}) {
    return prefs.getInt(key);
  }

  bool? getBool({required String key}) {
    return prefs.getBool(key);
  }

  double? getDouble({required String key}) {
    return prefs.getDouble(key);
  }

  Future<void> removeData({required String key}) async {
    await prefs.remove(key);
  }

  Future<void> clearAllData() async {
    await prefs.clear();
  }

  static Future<void> saveDefaultAddress(AddressModel address) async {
    await prefs.setString("defaultAddress", address.toJson());
  }

  static AddressModel getDefaultAddress() {
    String? defalutAddress = prefs.getString("defaultAddress");
    if (defalutAddress != null) {
      return AddressModel.fromJson(defalutAddress);
    } else {
      return AddressModel(
        address: '',
        city: '',
        zipCode: '',
      );
    }
  }

  Future<void> saveAddressList(List<AddressModel> addresses) async {
    List<String> addressJsonList = addresses.map((e) => e.toJson()).toList();
    await prefs.setStringList('addresses', addressJsonList);
  }

  List<AddressModel> getAddressList() {
    List<String>? addressJsonList = prefs.getStringList('addresses');
    if (addressJsonList != null) {
      return addressJsonList.map((e) => AddressModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  static Future<void> saveDefaultPaymentCard(
      PaymentCardModel paymentCard) async {
    await prefs.setString("defaultPaymentCard", paymentCard.toJson());
  }

  PaymentCardModel getDefaultPaymentCard() {
    String? defalutPaymentCard = prefs.getString("defaultPaymentCard");
    if (defalutPaymentCard != null) {
      return PaymentCardModel.fromJson(defalutPaymentCard);
    } else {
      return PaymentCardModel(
        cardNumber: '',
        expiryDate: '',
        cardHolderName: '',
        cvv: '',
      );
    }
  }

  Future<void> savePaymentCardList(List<PaymentCardModel> paymentCards) async {
    List<String> paymentCardsJsonList =
        paymentCards.map((e) => e.toJson()).toList();
    await prefs.setStringList('paymentCards', paymentCardsJsonList);
  }

  List<PaymentCardModel> getPaymentCardList() {
    List<String>? paymentCardsJsonList = prefs.getStringList('paymentCards');
    if (paymentCardsJsonList != null) {
      return paymentCardsJsonList
          .map((e) => PaymentCardModel.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> setSecureData(
      {required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> getSecureData({required String key}) async {
    return await storage.read(key: key);
  }

  Future<void> deletSecureData({required String key}) async {
    await storage.delete(key: key);
  }

  Future<void> clearAllSecureData() async {
    await storage.deleteAll();
  }

  Future<List<FavListResModel>> getFavList() async {
    List<String>? favListJsonList = prefs.getStringList('favoriteServices');
    if (favListJsonList != null) {
      return favListJsonList
          .map((e) => FavListResModel.fromJson(jsonDecode(e)))
          .toList();
    } else {
      return [];
    }
  }

  Future<void> saveFavorites(List<FavListResModel> favoriteIds) async {
    final List<String> favoriteIdsAsString =
        favoriteIds.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList('favoriteServices', favoriteIdsAsString);
  }
}
