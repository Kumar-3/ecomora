import 'dart:convert';

import 'package:ecom/core/common/entities/address.dart';
import 'package:ecom/core/utils/typedefs.dart';

class AddressModel extends Address {
  const AddressModel({super.apartment, super.city, super.country, super.postalCode, super.street});

  const AddressModel.empty()
    : this(
        street: "Test String",
        apartment: "Test String",
        city: "Test String",
        postalCode: "Test String",
        country: "Test String",
      );

  DataMap toMap() {
    return {
      if (street != null) 'street': street,
      if (apartment != null) 'apartment': apartment,
      if (city != null) 'city': city,
      if (postalCode != null) 'postalCode': postalCode,
      if (country != null) 'country': country,
    };
  }

  factory AddressModel.fromMap(DataMap map) {
    return AddressModel(
      street: map['street'] as String?,
      apartment: map['apartment'] as String?,
      city: map['city'] as String?,
      postalCode: map['postalCode'] as String?,
      country: map['country'] as String?,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(jsonDecode(source) as DataMap);
}
