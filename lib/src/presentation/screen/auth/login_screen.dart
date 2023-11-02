import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../values/colors.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../router/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Image.network(
                      'https://lp2m.uma.ac.id/wp-content/uploads/2021/04/modulelearning.png',
                      width: 270,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 36),
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    BlocListener<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is SignInWithGoogleState) {
                          if (!state.isLoading && state.result != null) {
                            //// Check is registered.
                            context.read<AuthBloc>().add(CheckIsUserRegisteredEvent());
                          } else {
                            print('Login cancelled!');
                          }
                        }

                        // TODO: handler for CheckIsUserRegisteredEvent
                        if (state is CheckIsUserRegisteredState) {
                          bool isRegistered = state.isRegistered;

                          if (isRegistered) {
                            Navigator.pushReplacementNamed(context, Routes.homeScreen);
                          } else {
                            Navigator.pushReplacementNamed(context, Routes.registrationFormScreen);
                          }
                        }
                      },
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          context.read<AuthBloc>().add(SignInWithGoogleEvent());
                        },
                        child: Ink(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: AppColors.green,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.login),
                              SizedBox(width: 12),
                              Text('Masuk dengan Google'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Login With Apple'),
                    ),
                    const SizedBox(height: 60),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
