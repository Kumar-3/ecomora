import 'package:ecom/core/common/entities/address.dart';
import 'package:ecom/src/dashboard/wishlist/domain/entities/wishlist_product.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.isAdmin,
    required this.wishlist,
    this.address,
    this.phone,
  });
  const User.empty()
    : id = "Test String",
      name = "Test String",
      isAdmin = true,
      wishlist = const [],
      email = "Test String",
      address = null,
      phone = null;

  final String id;
  final String name;
  final String email;
  final bool isAdmin;
  final List<WishListProduct> wishlist;
  final Address? address;
  final String? phone;

  @override
  List<Object?> get props => [id, name, email, isAdmin, wishlist.length];
}
