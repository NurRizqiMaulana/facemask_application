import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/response/history_response_model.dart';

class HistoryCard extends StatelessWidget {
  final HistoryResponseModel history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  history
                      .historyResponseModelClass, // Properti yang sesuai dari model
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10.0), // Jarak horizontal antara dua teks
                Text(
                  history.direction,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            SizedBox(height: 10.0), // Jarak antara row dan tanggal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(history.day),
                Text(
                  DateFormat('yyyy-MM-dd')
                      .format(history.date.toUtc()), // Pemformatan tanggal
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
