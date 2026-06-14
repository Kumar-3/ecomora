import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/utils/typedefs.dart';

abstract class AuthRepository {
  const AuthRepository();
  ResultFuture<void> register({
    required String name,
    required String password,
    required String email,
    required String phone,
  });
  ResultFuture<User> login({required String email, required String password});
  ResultFuture<void> forgetPassword(String email);
  ResultFuture<void> verifyOTP({required String email, required String otp});
  ResultFuture<void> resetPassword({required String email, required String password});
  ResultFuture<bool> verifyToken();
}
