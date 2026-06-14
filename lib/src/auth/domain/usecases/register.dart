import 'package:ecom/core/usecase/usecase.dart';
import 'package:ecom/core/utils/typedefs.dart';
import 'package:ecom/src/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class Register extends UsecaseWithParams<void, RegisterParams> {
  const Register(this._repo);
  final AuthRepository _repo;
  @override
  ResultFuture<void> call(RegisterParams params) => _repo.register(
    name: params.name,
    password: params.name,
    email: params.email,
    phone: params.phone,
  );
}

class RegisterParams extends Equatable {
  const RegisterParams({
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
  });
  const RegisterParams.empty()
    : name = "Test String",
      password = "Test String",
      email = "Test String",
      phone = "Test String";
  final String name;
  final String password;
  final String email;
  final String phone;

  @override
  List<Object?> get props => [name, password, email, phone];
}
