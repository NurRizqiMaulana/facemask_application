// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';
// import 'package:facemask_application/data/datasources/artikel_datasources.dart';

// import '../../data/models/requests/detection_model.dart';

// class DataVisualizationPage extends StatefulWidget {
//   @override
//   _DataVisualizationPageState createState() => _DataVisualizationPageState();
// }

// class _DataVisualizationPageState extends State<DataVisualizationPage> {
//   late ArtikelDatasources apiService;
//   late Future<List<DetectionResponseModel>> futureDetections;
//   late Future<List<DetectionCountResponseModel>> futureDetectionCounts;

//   @override
//   void initState() {
//     super.initState();
//     apiService = ArtikelDatasources();
//     futureDetections = apiService.fetchDetections();
//     futureDetectionCounts = apiService.fetchDetectionCounts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Data Visualization'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: FutureBuilder<List<DetectionCountResponseModel>>(
//                 future: futureDetectionCounts,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No data available'));
//                   } else {
//                     return Column(
//                       children: [
//                         Text('Bar Chart'),
//                         Expanded(
//                           child: BarChart(
//                             BarChartData(
//                               barGroups: snapshot.data!.map((count) {
//                                 return BarChartGroupData(
//                                   x: count.detectionClass.hashCode,
//                                   barRods: [
//                                     BarChartRodData(
//                                         toY: count.inCount.toDouble(),
//                                         color: Colors.blue),
//                                     BarChartRodData(
//                                         toY: count.outCount.toDouble(),
//                                         color: Colors.red),
//                                   ],
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         Text('Pie Chart'),
//                         Expanded(
//                           child: PieChart(
//                             PieChartData(
//                               sections: snapshot.data!.map((count) {
//                                 return PieChartSectionData(
//                                   value: (count.inCount + count.outCount)
//                                       .toDouble(),
//                                   title: count.detectionClass,
//                                   color: count.detectionClass == 'without_mask'
//                                       ? Colors.red
//                                       : Colors.green,
//                                 );
//                               }).toList(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:facemask_application/bloc/history/history_bloc.dart';
import 'package:facemask_application/constants.dart';
import 'package:facemask_application/presentation/widget/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryBloc>().add(FetchHistory());
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Constants.primaryColor,
      ),
      body: BlocBuilder<HistoryBloc, HistoryState>(
        builder: (context, state) {
          if (state is HistoryInitial) {
            context.read<HistoryBloc>().add(FetchHistory());
            return Center(child: CircularProgressIndicator());
          } else if (state is HistoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HistoryLoaded) {
            return ListView.builder(
              itemCount: state.history.length,
              itemBuilder: (context, index) {
                final history = state.history[index];
                return HistoryCard(history: history);
              },
            );
          } else if (state is HistoryError) {
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
