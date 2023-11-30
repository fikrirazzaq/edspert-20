import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/auth/auth_bloc.dart';
import 'widgets/select_gender_widget.dart';
import 'widgets/widgets.dart';

class RegistrationFormScreen extends StatelessWidget {
  const RegistrationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        ///
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Yuk isi data diri'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InputFieldWidget(
                name: 'Email',
                hintText: 'Email...',
                enabled: false,
                controller: TextEditingController(
                  text: context.read<AuthBloc>().getCurrentSignedInEmail() ?? '',
                ),
              ),
              InputFieldWidget(
                name: 'Nama Lengkap',
                hintText: 'contoh: Lionel Messi',
                controller: TextEditingController(),
              ),
              SelectGenderWidget(
                gender: '',
                onSelectGender: (value) {},
              ),
              DropdownButtonFormField(
                value: '10',
                items: const [
                  DropdownMenuItem(value: '10', child: Text('Kelas 10')),
                  DropdownMenuItem(value: '11', child: Text('Kelas 11')),
                  DropdownMenuItem(value: '12', child: Text('Kelas 12')),
                ],
                onChanged: (value) {},
              ),
              InputFieldWidget(
                name: 'Nama Sekolah',
                hintText: 'Sekolah...',
                controller: TextEditingController(),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('DAFTAR'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
