import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddPaymentMethodScreen extends StatelessWidget {
  final String method;

  const AddPaymentMethodScreen({required this.method, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Text(
          'Add $method',
          style: TextStyle(
            fontFamily: 'Raleway',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: method == 'Visa Card'
                    ? Image.asset(
                        'Assets/card_placeholder.jpg',
                        width: 300,
                        height: 200,
                        fit: BoxFit.cover,
                      )
                    : method == 'Mobicash'
                        ? Image.asset('Assets/mobi2.png')
                        : method == 'Cash'
                            ? Icon(
                                FontAwesomeIcons.moneyBill1Wave,
                                size: 100,
                                color: Colors.green,
                              )
                            : Image.asset(
                                'Assets/Edfaly.png',
                                width: 300,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
              ),
              SizedBox(height: 20),
              if (method == 'Visa Card') ...[
                _buildTextField(label: 'Card Number', hint: '1234 5678 9012 3456', icon: Icons.credit_card,maxLength: 16),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _buildTextField(label: 'Expiry Date', hint: 'MM/YY', icon: Icons.calendar_today)),
                    SizedBox(width: 10),
                    Expanded(child: _buildTextField(label: 'CVV', hint: '123', icon: Icons.lock)),
                  ],
                ),
              ] else if (method == 'Mobicash') ...[
                _buildTextField(label: 'Mobicash PIN', hint: '******', icon: Icons.lock, maxLength: 6),
              ] else if (method == 'Edfaly') ...[
                _buildTextField(label: 'Edfaly Account', hint: '123456789', icon: Icons.account_balance,maxLength: 9),
              ] else if (method == 'Cash') ...[
                Row(
                  children: [
                    Icon(FontAwesomeIcons.moneyBill1Wave, size: 40, color: Colors.green),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Please provide cash once you arrive.',
                        style: TextStyle(fontSize: 16, color: Colors.grey.shade800),
                      ),
                    ),
                  ],
                ),
              ],
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await _savePaymentMethod(method);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$method added successfully!')));
                    Navigator.pop(context); // Go back to the previous screen
                  },
                  child: Text('Add $method'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue.shade900,
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint, required IconData icon, int maxLength = 20}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(),
        prefixIcon: Icon(icon, color: Colors.blue.shade900),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue.shade900),
        ),
        labelStyle: TextStyle(color: Colors.blue.shade900),
        hintStyle: TextStyle(color: Colors.grey.shade600),
        counterText: "",
      ),
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.blue.shade900),
    );
  }

  Future<void> _savePaymentMethod(String method) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? paymentMethods = prefs.getStringList('payment_methods') ?? [];
    paymentMethods.add(method);
    await prefs.setStringList('payment_methods', paymentMethods);
  }
}
