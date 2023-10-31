part of 'auth_bloc.dart';

@immutable
class AuthState {}

final class AuthInitial extends AuthState {}

class SignInWithGoogleState extends AuthState {
  final User? result;
  final bool isLoading;

  SignInWithGoogleState({
    required this.result,
    required this.isLoading,
  });
}
