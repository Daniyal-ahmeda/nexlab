import 'package:flutter/material.dart';
import 'package:nex_lab/screens/testconfirmation_screen.dart';
import '../models/bookedtest.dart';

class TestDetailsScreen extends StatelessWidget {
  final String testName;
  final List<String> testDetails;
  final Function(BookedTest) onTestBooked;

  const TestDetailsScreen({required this.testName, required this.testDetails, required this.onTestBooked, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(testName),
        backgroundColor: Colors.blue.shade50,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: testDetails.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(bottom: 16.0),
            child: ListTile(
              title: Text(
                testDetails[index],
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestConfirmationScreen(
                      testName: testDetails[index],
                      onTestBooked: onTestBooked,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
