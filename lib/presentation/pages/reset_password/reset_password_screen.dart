import 'package:facemask_application/data/datasources/auth_datasources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/reset_password/reset_password_bloc.dart';

class ConfirmResetPasswordScreen extends StatelessWidget {
  final String token;
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  ConfirmResetPasswordScreen({required this.token});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
      ),
      body: BlocProvider(
        create: (context) => ResetPasswordBloc(AuthDatasource()),
        child: BlocListener<ResetPasswordBloc, ResetPasswordState>(
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: newPasswordController,
                  decoration: InputDecoration(labelText: "New Password"),
                  obscureText: true,
                ),
                TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(labelText: "Confirm Password"),
                  obscureText: true,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    context.read<ResetPasswordBloc>().add(
                          ResetPasswordConfirm(
                            token,
                            newPasswordController.text,
                            confirmPasswordController.text,
                          ),
                        );
                  },
                  child: Text("Reset Password"),
                ),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                  builder: (context, state) {
                    if (state is ResetPasswordLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
