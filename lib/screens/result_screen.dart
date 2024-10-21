import 'package:flutter/material.dart';
import 'package:nex_lab/models/test_report.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ResultsScreen extends StatelessWidget {
  final List<TestReport> testReports;
  ResultsScreen({required this.testReports});

  Future<void> _generatePdf(TestReport report) async {
    final pdf = pw.Document();
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            pw.Text('Test Name: ${report.testName}', style: pw.TextStyle(fontSize: 18)),
            pw.Text('Date: ${report.date}', style: pw.TextStyle(fontSize: 14)),
            pw.Text('Result: ${report.result}', style: pw.TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Results'),
      ),
      body: ListView.builder(
        itemCount: testReports.length,
        itemBuilder: (context, index) {
          final report = testReports[index];
          return Card(
            color: Colors.blue.shade50,
            margin: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Test: ${report.testName}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text('Date: ${report.date}', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  Text('Result: ${report.result}', style: TextStyle(fontSize: 14)),
                  SizedBox(height: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => _generatePdf(report),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.picture_as_pdf, size: 18),
                        SizedBox(width: 8),
                        Text('Download PDF'),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
