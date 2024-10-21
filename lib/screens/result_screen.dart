// results_screen.dart
import 'package:flutter/material.dart';
import 'package:nex_lab/models/test_report.dart';

class ResultsScreen extends StatelessWidget {
  final List<TestReport> testReports;

  ResultsScreen({required this.testReports});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: testReports.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(testReports[index].testName),
            subtitle: Text('Date: ${testReports[index].date}'),
            trailing: Text('Result: ${testReports[index].result}'),
          );
        },
      ),
    );
  }
}