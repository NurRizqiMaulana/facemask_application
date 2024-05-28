import 'package:flutter/material.dart';

import '../../data/models/response/artikel_response_model.dart';

class ArtikelCard extends StatelessWidget {
  final ArtikelResponseModel artikel;

  const ArtikelCard({Key? key, required this.artikel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder for an image
            Container(
              height: 200,
              color: Colors.grey[300],
              child: Center(
                child: Text(
                  'Image Placeholder',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              artikel.judul,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              artikel.konten,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
