// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tentang Aplikasi',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                'MaskcareApp adalah solusi yang dirancang untuk membantu memantau kepatuhan penggunaan masker dalam berbagai situasi dan tempat. Aplikasi ini menggunakan teknologi pengenalan wajah dan deteksi objek untuk secara otomatis mengidentifikasi apakah seseorang memakai masker atau tidak.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Image.asset(
                  'assets/images/ob2.png'), // Gambar ilustrasi (pastikan Anda memiliki gambar ini di folder assets)
              SizedBox(height: 16),
              Text(
                'Cara Kerja:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '1. Aplikasi ini menangkap gambar atau video dari kamera perangkat.\n'
                '2. Algoritma deteksi akan menganalisis gambar tersebut untuk mengenali wajah.\n'
                '3. Selanjutnya, algoritma akan menentukan apakah orang tersebut memakai masker atau tidak.\n'
                '4. Data hasil deteksi kemudian dicatat dan dapat digunakan untuk menghitung jumlah pengguna masker.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Manfaat Penggunaan:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '• Meningkatkan kepatuhan penggunaan masker di tempat umum.\n'
                '• Memudahkan pihak pengelola tempat dalam memantau dan mengelola protokol kesehatan.\n'
                '• Memberikan data statistik yang berguna untuk analisis dan pengambilan keputusan.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Kontak dan Informasi:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Jika Anda memiliki pertanyaan atau membutuhkan bantuan lebih lanjut, silakan hubungi kami melalui email: maulana29.rizqi@gamil.com.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
