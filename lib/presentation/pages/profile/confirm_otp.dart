import 'package:facemask_application/bloc/confirm_otp/confirm_otp_bloc.dart';
import 'package:facemask_application/presentation/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOtpScreen extends StatelessWidget {
  final TextEditingController otpontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Permintaan Perubahan Email')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: otpontroller,
              decoration: InputDecoration(labelText: 'Kode OTP'),
            ),
            SizedBox(height: 20),
            BlocConsumer<ConfirmOtpBloc, ConfirmOtpState>(
              listener: (context, state) {
                if (state is ConfirmOtpSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Email berhasil diganti')));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfilePage()),
                  );
                } else if (state is ConfirmOtpFailure) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.error)));
                }
              },
              builder: (context, state) {
                if (state is ConfirmOtpLoading) {
                  return CircularProgressIndicator();
                }
                return ElevatedButton(
                  onPressed: () {
                    context
                        .read<ConfirmOtpBloc>()
                        .add(ConfirmOTP(otp: otpontroller.text));
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
