import 'package:facemask_application/presentation/pages/profile/confirm_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/change_email/change_email_bloc.dart';

class RequestChangeEmailScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permintaan Perubahan Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email Baru'),
            ),
            SizedBox(height: 20),
            BlocConsumer<ChangeEmailBloc, ChangeEmailState>(
              listener: (context, state) {
                if (state is ChangeEmailSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('OTP telah dikirim ke email baru.')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConfirmOtpScreen()),
                  );
                } else if (state is ChangeEmailFaulure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ChangeEmailLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context
                        .read<ChangeEmailBloc>()
                        .add(ChangeEmail(email: emailController.text));
                  },
                  child: Text('Kirim OTP'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
