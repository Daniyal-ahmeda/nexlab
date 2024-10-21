import 'package:flutter/material.dart';

class TestDetailsScreen extends StatelessWidget {
  final String testName;

  const TestDetailsScreen({super.key, required this.testName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(testName),
        backgroundColor: Colors.blue.shade50,
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details for $testName',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Here are the details of this test',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                '- Purpose of the test:\n '
                '- It will tell the current values of your $testName \n'
                '- What the results mean\n'
                '- Any preparation needed before the test\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                  // Handle confirmation action here
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Are you sure you want to take the $testName test?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Add your confirmation logic here
                            Navigator.of(context).pop(); // Close the dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('You have confirmed to take the $testName test.')),
                            );
                          },
                          child: Text('Confirm'),
                        ),
                      ],
                    ),
                  );
                },
                
                child: Text('Confirm Test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}