import 'package:facemask_application/data/models/response/history_response_model.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final HistoryResponseModel history;

  const HistoryCard({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      elevation: 5.0,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  history.className,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  history.direction,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              history.date,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
