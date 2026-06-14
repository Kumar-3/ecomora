import 'dart:convert';

import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/common/models/address_model.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/dashboard/wishlist/data/models/wishlist_product_model.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.isAdmin,
    required super.wishlist,
    super.address,
    super.phone,
  });

  const UserModel.empty()
    : this(
        id: "Test String",
        name: "Test String",
        isAdmin: true,
        wishlist: const [],
        email: "Test String",
        address: null,
        phone: null,
      );

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    bool? isAdmin,
    List<WishlistProductModel>? wishlist,
    AddressModel? address,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isAdmin: isAdmin ?? this.isAdmin,
      wishlist: wishlist ?? this.wishlist,
      address: address ?? this.address,
      phone: phone ?? this.phone,
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'isAdmin': isAdmin,
      'wishlist': wishlist.map((product) => (product as WishlistProductModel).toMap()).toList(),
      if (address != null) 'address': (address as AddressModel).toMap(),
      if (phone != null) 'phone': phone,
    };
  }

  factory UserModel.fromJson(String source) => UserModel.fromMap(jsonDecode(source) as DataMap);

  factory UserModel.fromMap(Map<String, dynamic> map) {
    final address = AddressModel.fromMap({
      if (map case {'street': final String street}) 'street': street,
      if (map case {'apartment': final String apartment}) 'apartment': apartment,
      if (map case {'city': final String city}) 'city': city,
      if (map case {'postalCode': final String postalCode}) 'postalCode': postalCode,
      if (map case {'country': final String country}) 'country': country,
    });
    return UserModel(
      id: map['id'] as String? ?? map["_id"] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      isAdmin: map['isAdmin'] as bool,
      wishlist: List<DataMap>.from(
        map['wishlist'] as List,
      ).map(WishlistProductModel.fromMap).toList(),
      address: address.isEmpty ? null : address,
      phone: map['phone'] as String?,
    );
  }
  String tojson() => jsonEncode(toMap());
}
