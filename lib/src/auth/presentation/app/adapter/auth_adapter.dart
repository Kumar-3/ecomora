import 'package:ecom/core/common/app/riverpod/current_user_provider.dart';
import 'package:ecom/core/common/entities/user.dart';
import 'package:ecom/core/services/injection_container.dart';
import 'package:ecom/src/auth/domain/usecases/forgot_password.dart';
import 'package:ecom/src/auth/domain/usecases/login.dart';
import 'package:ecom/src/auth/domain/usecases/register.dart';
import 'package:ecom/src/auth/domain/usecases/reset_password.dart';
import 'package:ecom/src/auth/domain/usecases/verify_o_t_p.dart';
import 'package:ecom/src/auth/domain/usecases/verify_token.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_adapter.g.dart';
part 'auth_state.dart';

@riverpod
class AuthAdapter extends _$AuthAdapter {
  @override
  AuthState build([GlobalKey? key]) {
    _forgotPassword = sl<ForgotPassword>();
    _login = sl<Login>();
    _register = sl<Register>();
    _resetPassword = sl<ResetPassword>();
    _verifyOtp = sl<VerifyOTP>();
    _verifyToken = sl<VerifyToken>();
    return const AuthInitial();
  }

  late ForgotPassword _forgotPassword;
  late Login _login;
  late Register _register;
  late ResetPassword _resetPassword;
  late VerifyOTP _verifyOtp;
  late VerifyToken _verifyToken;

  // Login method
  Future<void> login({required String email, required String password}) async {
    state = const AuthLoading();
    final result = await _login(LoginParams(email: email, password: password));
    result.fold((failure) => state = AuthError(failure.message), (user) {
      ref.read(currentUserProvider.notifier).setUser(user);
      state = LoggedIn(user);
    });
  }

  //Register method
  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    state = const AuthLoading();
    final result = await _register(
      RegisterParams(name: name, password: password, email: email, phone: phone),
    );
    result.fold((failure) => state = AuthError(failure.message), (_) => state = const Registered());
  }

  // Forgot password method
  Future<void> forgotPassword({required String email}) async {
    state = const AuthLoading();
    final result = await _forgotPassword(email);
    result.fold((failure) => state = AuthError(failure.message), (_) => state = const OTPSent());
  }

  // Verify OTP method
  Future<void> verifyOTP({required String email, required String otp}) async {
    state = const AuthLoading();
    final result = await _verifyOtp(VerifyOtpParams(email: email, otp: otp));
    result.fold(
      (failure) => state = AuthError(failure.message),
      (user) => state = const OTPVerified(),
    );
  }

  //Reset password method
  Future<void> resetPassword({required String email, required String newPassword}) async {
    state = const AuthLoading();
    final result = await _resetPassword(ResetPasswordParams(email: email, password: newPassword));
    result.fold(
      (failure) => state = AuthError(failure.message),
      (_) => state = const PasswordReset(),
    );
  }

  //Verify token method
  Future<void> verifyToken() async {
    state = const AuthLoading();
    final result = await _verifyToken();
    result.fold((failure) => state = AuthError(failure.message), (isValid) {
      state = TokenVerified(isValid);
      if (!isValid) {
        ref.read(currentUserProvider.notifier).setUser(null);
      } 
    });
  }
}
