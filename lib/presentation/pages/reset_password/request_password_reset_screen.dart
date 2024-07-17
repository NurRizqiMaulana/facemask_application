import 'package:facemask_application/bloc/reset_password/reset_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocListener<ResetPasswordBloc, ResetPasswordState>(
            listener: (context, state) {
              if (state is ResetPasswordSuccess) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is ResetPasswordFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Please enter your email address',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      builder: (context, state) {
                    if (state is ResetPasswordLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ResetPasswordBloc>().add(
                              ResetPasswordRequest(
                                  email: emailController.text));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white // Background color
                            ),
                        child: Text("Reset Password"),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
