import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';

class VerifyToken extends UsecaseWithoutParams<bool> {
  VerifyToken(this._repo);
  final AuthRepository _repo;
  @override
  ResultFuture<bool> call() => _repo.verifyToken();
}
