part of 'auth_adapter.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// [AuthInitial] - Initial state of the authentication process.
final class AuthInitial extends AuthState {
  const AuthInitial();
}

/// [AuthLoading] - State when an authentication-related operation is in progress.
final class AuthLoading extends AuthState {
  const AuthLoading();
}

/// [OTPSent] - State indicating that an OTP has been sent to the user, typically after a forgot password request or during registration.
final class OTPSent extends AuthState {
  const OTPSent();
}

/// [OTPVerified] - State indicating that the OTP provided by the user has been successfully verified, allowing them to proceed with the authentication process.
final class OTPVerified extends AuthState {
  const OTPVerified();
}

/// [TokenVerified] - State indicating that the user's authentication token has been successfully verified, confirming their authenticated status.
final class TokenVerified extends AuthState {
  const TokenVerified(this.isValid);
  final bool isValid;

  @override
  List<Object?> get props => [isValid];
}

/// [LoggedIn] - State indicating that the user has successfully logged in.
final class LoggedIn extends AuthState {
  const LoggedIn(this.user);
  final User user;

  @override
  List<Object?> get props => [user];
}

/// [Registered] - State indicating that the user has successfully registered.
final class Registered extends AuthState {
  const Registered();
}

/// [PasswordReset] - State indicating that the user's password has been successfully reset.
final class PasswordReset extends AuthState {
  const PasswordReset();
}

/// [AuthError] - State indicating that an error occurred during an authentication-related operation, containing an error message for debugging or user feedback purposes.
final class AuthError extends AuthState {
  const AuthError(this.message);
  final String message;

  @override
  List<Object?> get props => [message];
}
