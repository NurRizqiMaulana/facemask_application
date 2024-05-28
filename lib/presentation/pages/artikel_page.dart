// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/constants.dart';
import 'package:facemask_application/presentation/widget/artikel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/artikel/artikel_bloc.dart';

class ArtikelPage extends StatelessWidget {
  const ArtikelPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Artikel'),
        backgroundColor: Constants.primaryColor,
      ),
      body: BlocBuilder<ArtikelBloc, ArtikelState>(
        builder: (context, state) {
          if (state is ArtikelInitial) {
            context.read<ArtikelBloc>().add(FetchArtikels());
            return Center(child: CircularProgressIndicator());
          } else if (state is ArtikelLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ArtikelLoaded) {
            return ListView.builder(
              itemCount: state.artikels.length,
              itemBuilder: (context, index) {
                final artikel = state.artikels[index];
                return ArtikelCard(artikel: artikel);
              },
            );
          } else if (state is ArtikelError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
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
