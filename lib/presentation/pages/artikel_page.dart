// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ArtikelPage extends StatefulWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  @override
  State<ArtikelPage> createState() => _ArtikelPageState();
}

class _ArtikelPageState extends State<ArtikelPage> {
  final String url =
      'https://ayosehat.kemkes.go.id/pentingnya-pakai-masker-di-dalam-ruangan';
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Artikel'),
          backgroundColor: Constants.primaryColor,
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(
            url: WebUri(url), // Gunakan WebUri sebagai pengganti Uri
          ),
        )
        // body: BlocBuilder<ArtikelBloc, ArtikelState>(
        //   builder: (context, state) {
        //     if (state is ArtikelInitial) {
        //       context.read<ArtikelBloc>().add(FetchArtikels());
        //       return Center(child: CircularProgressIndicator());
        //     } else if (state is ArtikelLoading) {
        //       return Center(child: CircularProgressIndicator());
        //     } else if (state is ArtikelLoaded) {
        //       return ListView.builder(
        //         itemCount: state.artikels.length,
        //         itemBuilder: (context, index) {
        //           final artikel = state.artikels[index];
        //           return ArtikelCard(artikel: artikel);
        //         },
        //       );
        //     } else if (state is ArtikelError) {
        //       return Center(child: Text(state.message));
        //     } else {
        //       return Container();
        //     }
        //   },
        // ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) => CreateArtikelDialog(),
        //     );
        //   },
        // ),
        );
  }
}
