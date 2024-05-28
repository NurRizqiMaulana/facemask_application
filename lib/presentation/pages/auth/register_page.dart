// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/bloc/register/register_bloc.dart';
import 'package:facemask_application/bloc/register/register_event.dart';
import 'package:facemask_application/bloc/register/register_state.dart';
import 'package:facemask_application/data/models/requests/register_model.dart';
import 'package:facemask_application/presentation/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;

  bool _isObscured = true;

  void _togglePasswordVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController!.dispose();
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'images/bg.png'), // Ganti dengan path gambar latar belakang yang sesuai
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100.0,
                  ),
                  const Text(
                    "Register Page",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Image.asset(
                    'images/logoAuth.png', // Ganti dengan path gambar yang sesuai
                    width: 200, // Sesuaikan lebar gambar sesuai kebutuhan
                    height: 250, // Sesuaikan tinggi gambar sesuai kebutuhan
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(),
                    ),
                    controller: nameController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: _togglePasswordVisibility,
                      ),
                    ),
                    obscureText: _isObscured,
                    controller: passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLoaded) {
                        nameController!.clear();
                        emailController!.clear();
                        passwordController!.clear();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 255, 8),
                              content: Text('Email: berhasil didaftarkan')),
                        );
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () {
                          final requestModel = RegisterModel(
                            name: nameController!.text,
                            email: emailController!.text,
                            password: passwordController!.text,
                          );

                          context
                              .read<RegisterBloc>()
                              .add(SaveRegisterEvent(request: requestModel));
                        },
                        // style: ElevatedButton.styleFrom(fore),
                        child: const Text('Register'),
                      );
                    },
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }));
                    },
                    child: const Text(
                      'Sudah Punya Akun? Login',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  ),
                  const SizedBox(
                    height: 28.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}