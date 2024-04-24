// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/data/localsources/auth_local_storage.dart';
import 'package:facemask_application/presentation/pages/artikel_page.dart';
import 'package:facemask_application/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                // Menampilkan dialog konfirmasi
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Konfirmasi Logout"),
                      content: Text("Anda yakin ingin keluar?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Menutup dialog
                          },
                          child: Text("Batal"),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Proses logout jika pengguna menekan "Ya"
                            await AuthLocalStorage().removeToken();
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const LoginPage();
                            }));
                          },
                          child: Text("Ya"),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(209, 209, 239, 1),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: ListTile(
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/22272400?s=400&u=c9ca914d05b0e941d33239286e974d66590ab6f5&v=4',
                    ),
                  ),
                  title: Text(
                    'Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Your Email Address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20), // Spasi antara kedua kontainer
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(209, 209, 239, 1),
                borderRadius: BorderRadius.all(Radius.circular(30)
                    // topLeft: Radius.circular(30),
                    // topRight: Radius.circular(30),
                    ),
              ),
              padding:
                  const EdgeInsets.all(20), // Padding untuk kontainer kedua
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Protect yourself and your love once',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                            height: 10), // Spasi antara teks dan gambar
                        ElevatedButton(
                          onPressed: () {
                            // Fungsi yang dijalankan saat tombol ditekan
                          },
                          child: const Text('Get Started'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      width: 20), // Spasi antara gambar dan teks/tombol
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(
                        'images/bgHP.png', // Ubah dengan path gambar yang sesuai
                        width: 150, // Sesuaikan lebar gambar sesuai kebutuhan
                        height: 150, // Sesuaikan tinggi gambar sesuai kebutuhan
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2, // Jumlah kolom
              crossAxisSpacing: 20, // Spasi antar kolom
              mainAxisSpacing: 20, // Spasi antar baris
              padding: const EdgeInsets.all(30), // Padding untuk grid view
              children: [
                _buildColumn(
                  'HandShake',
                  'images/img1.png',
                  const Color.fromRGBO(255, 218, 240, 1),
                ),
                _buildColumnWithButton('FaceMask', 'images/img2.png',
                    const Color.fromRGBO(209, 209, 239, 1), () {}),
                _buildColumnWithButton('Article', 'images/img3.png',
                    const Color.fromRGBO(209, 209, 239, 1), () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ArticlePage();
                  }));
                }),
                _buildColumn('Wash Hand', 'images/img4.png',
                    const Color.fromRGBO(255, 218, 240, 1)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildColumn(String text, String imagePath, Color backgroundColor) {
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor, // Warna latar belakang sesuai parameter
      borderRadius: BorderRadius.circular(10), // Border radius jika diperlukan
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath,
            width: 60, height: 50), // Gambar lokal // Icon gambar
        const SizedBox(height: 5), // Spasi antara ikon dan teks
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget _buildColumnWithButton(String buttonText, String imagePath,
    Color backgroundColor, VoidCallback onPressed) {
  return Container(
    decoration: BoxDecoration(
      color: backgroundColor, // Warna latar belakang sesuai parameter
      borderRadius: BorderRadius.circular(10), // Border radius jika diperlukan
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(imagePath,
            width: 60, height: 50), // Gambar lokal // Icon gambar
        const SizedBox(height: 5), // Spasi antara ikon dan tombol
        ElevatedButton(
          onPressed: () {
            // Panggil tindakan yang sesuai berdasarkan kondisi
            onPressed();
          },
          child: Text(buttonText),
        ),
      ],
    ),
  );
}
