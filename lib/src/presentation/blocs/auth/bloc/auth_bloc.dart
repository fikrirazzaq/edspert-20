import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/domain/usecase/auth_usecases/usecases.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInWithGoogleUsecase signInWithGoogleUsecase;
  AuthBloc(this.signInWithGoogleUsecase) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInWithGoogleEvent) {
        emit(SignInWithGoogleState(result: null, isLoading: true));
        final User? user = await signInWithGoogleUsecase();
        emit(SignInWithGoogleState(result: user, isLoading: false));
      }
    });
  }
}
