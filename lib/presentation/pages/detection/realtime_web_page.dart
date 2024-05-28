import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  final String url =
      'http://192.168.229.85:5000/video_feed'; // Replace with your Flask server URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realtime Object Counting'),
        backgroundColor: Color.fromRGBO(209, 209, 239, 1),
      ),
      body: InAppWebView(
          initialUrlRequest: URLRequest(
        url: WebUri.uri(Uri.parse(url)),
      )),
    );
  }
}
