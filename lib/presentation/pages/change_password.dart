import 'package:facemask_application/bloc/change_password/change_password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController =
      TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();

  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
        centerTitle: true,
      ),
      body: BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) {
          if (state is ChangePasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Password changed successfully')),
            );
          } else if (state is ChangePasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text('Failed to change password: ${state.error}')),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: currentPasswordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _isObscured,
              ),
              TextField(
                controller: newPasswordController,
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: _isObscured,
              ),
              SizedBox(height: 20),
              BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                builder: (context, state) {
                  if (state is ChangePasswordLoading) {
                    return CircularProgressIndicator();
                  }
                  return ElevatedButton(
                    onPressed: () {
                      context.read<ChangePasswordBloc>().add(
                            ChangePassword(
                              currentPassword: currentPasswordController.text,
                              newPassword: newPasswordController.text,
                            ),
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Color.fromRGBO(209, 209, 239, 1),
                    ),
                    child: Text('Change Password'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
