import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning/src/presentation/blocs/auth/auth_bloc.dart';

import '../../router/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) {
      context.read<AuthBloc>().add(CheckIsSignedInWithGoogleEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is CheckIsUserSignedInWithGoogleState) {
          if (!state.isLoading && state.isSignedIn) {
            //// Check is registered.
            context.read<AuthBloc>().add(CheckIsUserRegisteredEvent());
          } else {
            Navigator.pushReplacementNamed(context, Routes.loginScreen);
          }
        }

        if (state is CheckIsUserRegisteredState) {
          bool isRegistered = state.isRegistered;
          // Navigator.pushReplacementNamed(context, Routes.homeScreen);
          // return;
          if (isRegistered) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          } else {
            Navigator.pushReplacementNamed(context, Routes.registrationFormScreen);
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Center(
          child: Text('Learning'),
        ),
      ),
    );
  }
}
