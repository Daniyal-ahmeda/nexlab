import 'package:flutter/material.dart';
import 'package:nex_lab/models/bookedtest.dart';
import 'package:nex_lab/screens/payment/payment_screen.dart';

class TestConfirmationScreen extends StatefulWidget {
  final String testName;
  final Function(BookedTest) onTestBooked;

  const TestConfirmationScreen({required this.testName, required this.onTestBooked, Key? key}) : super(key: key);

  @override
  _TestConfirmationScreenState createState() => _TestConfirmationScreenState();
}

class _TestConfirmationScreenState extends State<TestConfirmationScreen> {
  Future<void> _selectDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      TimeOfDay? time = await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        widget.onTestBooked(BookedTest(
          name: widget.testName,
          dateTime: DateTime(date.year, date.month, date.day, time.hour, time.minute),
        ));
        Navigator.of(context).popUntil((route) => route.isFirst);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Test confirmed: ${widget.testName}')));
        
        // Navigate to PaymentMethodsScreen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentMethodsScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.testName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), spreadRadius: 2, blurRadius: 5, offset: Offset(0, 3))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details for ${widget.testName}',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Here are the details of this test',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Purpose of the test:\n'
                'It will tell the current values of your ${widget.testName} \n'
                'What the results mean\n'
                'Any preparation needed before the test\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectDateTime,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.check, size: 18),
                    SizedBox(width: 8),
                    Text('Confirm Test'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
