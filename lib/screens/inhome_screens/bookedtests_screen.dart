import 'package:flutter/material.dart';
import 'package:nex_lab/models/bookedtest.dart';
import 'package:nex_lab/screens/details_screen.dart';


class BookedTestsScreen extends StatelessWidget {
  final List<BookedTest> bookedTests; 
  const BookedTestsScreen({super.key, required this.bookedTests});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Booked Tests'),
        backgroundColor: Colors.blue.shade50,
      ),
      body: ListView.builder(
        itemCount: bookedTests.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.blue.shade50,
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(bookedTests[index].name),
              subtitle: Text(
                '${bookedTests[index].dateTime.day}/${bookedTests[index].dateTime.month}/${bookedTests[index].dateTime.year} ${bookedTests[index].dateTime.hour}:${bookedTests[index].dateTime.minute}',
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestDetailsScreen(testName: bookedTests[index].name, key: null, onTestBooked: (BookedTest ) {  }, testDetails: [],),
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