import 'package:flutter/material.dart';
import 'package:nex_lab/screens/payment/card_details_screen.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  final String method;
  const AddPaymentMethodScreen({required this.method, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add $method'),
        backgroundColor: Colors.blue.shade50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Enter your $method details:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            if (method == 'Credit Card') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
              ),
            ] else if (method == 'Visa Card') ...[
              TextField(
                decoration: InputDecoration(
                  labelText: 'visa card PIN',
                  border: OutlineInputBorder(),
                ),
              ),
            ] else if (method == 'Cash') ...[
              Text('Please provide cash at the front desk.', style: TextStyle(fontSize: 16)),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$method added successfully!')));
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardDetailsScreen()), // Navigate to the new screen
                );
              },
              child: Text('Add $method'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
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
    );
  }
}
