// booked_tests_screen.dart
import 'package:flutter/material.dart';
import 'package:nex_lab/screens/details_screen.dart';
 // Import the BookedTest class

class BookedTest {
  final String name;
  final DateTime dateTime;

  BookedTest({required this.name, required this.dateTime});
}
// booked_tests_screen.dart

class BookedTestsScreen extends StatelessWidget {
  final List<BookedTest> bookedTests; // Receive the booked tests

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
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(bookedTests[index].name),
              subtitle: Text(
                '${bookedTests[index].dateTime.day}/${bookedTests[index].dateTime.month}/${bookedTests[index].dateTime.year} ${bookedTests[index].dateTime.hour}:${bookedTests[index].dateTime.minute}',
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Handle tap on the booked test item
                // You can navigate to a details screen or show more information
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestDetailsScreen(testName: bookedTests[index].name),
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