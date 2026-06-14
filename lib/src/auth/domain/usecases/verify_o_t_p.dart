import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class VerifyOTP extends UsecaseWithParams<void, VerifyOtpParams> {
  VerifyOTP(this._repo);
  final AuthRepository _repo;
  @override
  ResultFuture<void> call(VerifyOtpParams params) =>
      _repo.verifyOTP(email: params.email, otp: params.otp);
}

class VerifyOtpParams extends Equatable {
  const VerifyOtpParams({required this.email, required this.otp});
  const VerifyOtpParams.empty() : email = "Test String", otp = "Test String";
  final String email;
  final String otp;
  @override
  List<Object?> get props => [email, otp];
}
