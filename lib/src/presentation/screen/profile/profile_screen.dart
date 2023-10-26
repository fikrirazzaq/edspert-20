import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/banner/banner_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    print('initState: ProfileScreen');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    context.read<BannerCubit>().getBanners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
      ),
      body: ListView(
        children: [
          Text('Name:'),
        ],
      ),
    );
  }
}
