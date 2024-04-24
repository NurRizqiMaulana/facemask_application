// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/presentation/pages/login_page.dart';
import 'package:facemask_application/presentation/pages/register_page.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/bg.png'), // Ganti dengan path gambar latar belakang yang sesuai
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selamat Datang",
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Image.asset(
              'images/ob1.png', // Ganti dengan path gambar yang sesuai
              width: 500, // Sesuaikan lebar gambar sesuai kebutuhan
              height: 250, // Sesuaikan tinggi gambar sesuai kebutuhan
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const RegisterPage();
                }));
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
