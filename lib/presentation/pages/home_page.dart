// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/constants.dart';
import 'package:facemask_application/data/localsources/auth_local_storage.dart';
import 'package:facemask_application/presentation/pages/artikel_page.dart';
import 'package:facemask_application/presentation/pages/auth/login_page.dart';
import 'package:facemask_application/presentation/pages/profile/profile_page.dart';
import 'package:facemask_application/presentation/pages/detection/realtime_page.dart';
import 'package:facemask_application/presentation/pages/detection/realtime_web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/profile/profile_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
        centerTitle: true,
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // How do you fill card
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ProfileLoaded) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 15.0),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(209, 209, 239, 1),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  getGreeting(),
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 210,
                                  child: Text(
                                    state.profile.email ?? '',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 16),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage()),
                                );
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        const Color.fromRGBO(255, 218, 240, 1),
                                    width: 2.0, // Lebar border
                                  ),
                                ),
                                child: CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                    state.profile.avatar ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAdmCtWjfGHEabmDXtRwRDMQ1RLh2v1gxGKA&s'
                                            '',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(209, 209, 239, 1),
                          borderRadius: BorderRadius.all(Radius.circular(30)
                              // topLeft: Radius.circular(30),
                              // topRight: Radius.circular(30),
                              ),
                        ),
                        padding: const EdgeInsets.all(
                            20), // Padding untuk kontainer kedua
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
                                      height:
                                          10), // Spasi antara teks dan gambar
                                  ElevatedButton(
                                    onPressed: () {
                                      // Pindah ke halaman CameraAccessPage saat tombol ditekan
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const YoloVideo()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                    ),
                                    child: const Text('Get Started'),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                width:
                                    20), // Spasi antara gambar dan teks/tombol
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  'images/bgHP.png', // Ubah dengan path gambar yang sesuai
                                  width:
                                      150, // Sesuaikan lebar gambar sesuai kebutuhan
                                  height:
                                      150, // Sesuaikan tinggi gambar sesuai kebutuhan
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
                        padding:
                            const EdgeInsets.all(30), // Padding untuk grid view
                        children: [
                          _buildColumn(
                            'HandShake',
                            'images/img1.png',
                            const Color.fromRGBO(255, 218, 240, 1),
                          ),
                          _buildColumnWithButton('FaceMask', 'images/img2.png',
                              const Color.fromRGBO(209, 209, 239, 1), () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return CameraView();
                            }));
                          }),
                          _buildColumnWithButton('Article', 'images/img3.png',
                              const Color.fromRGBO(209, 209, 239, 1), () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ArtikelPage();
                            }));
                          }),
                          _buildColumn('Wash Hand', 'images/img4.png',
                              const Color.fromRGBO(255, 218, 240, 1)),
                        ],
                      ),
                    ],
                  );
                }
                return Center(child: Text("Kesalahan Jaringan"));
              },
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
            color: Colors.black,
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
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
          ),
          child: Text(buttonText),
        ),
      ],
    ),
  );
}
