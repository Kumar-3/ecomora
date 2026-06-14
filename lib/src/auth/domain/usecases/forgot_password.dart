import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);
  final AuthRepository _repo;

  @override
  ResultFuture<void> call(String email) => _repo.forgetPassword(email);
}
