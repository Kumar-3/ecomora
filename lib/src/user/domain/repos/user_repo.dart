import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/utils/typedefs.dart';

abstract class UserRepo {
  const UserRepo();
  ResultFuture<User> getUser(String userId);
  ResultFuture<User> updateUser({required String userId, required DataMap updatedData});
  ResultFuture<String> getUserPaymentProfile(String userId);
}
