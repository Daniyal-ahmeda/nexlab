import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nex_lab/models/bookedtest.dart';
import 'package:nex_lab/screens/details_screen.dart';


class Tests_Screen extends StatelessWidget {
  final Function(BookedTest) onTestBooked;
  Tests_Screen({super.key, required this.onTestBooked});

  final List<IconData> iconDataList = [
    FontAwesomeIcons.solidHeart,
    FontAwesomeIcons.heartPulse,
    FontAwesomeIcons.cannabis,
    FontAwesomeIcons.lungs,
    FontAwesomeIcons.brain,
    FontAwesomeIcons.virus,
    FontAwesomeIcons.handHoldingHeart,
    FontAwesomeIcons.microscope,
    FontAwesomeIcons.dna,
    FontAwesomeIcons.pills,
    FontAwesomeIcons.syringe,
    FontAwesomeIcons.virusCovid,
    FontAwesomeIcons.thermometer,
    FontAwesomeIcons.bacteria,
  ];

  final List<String> textList = [
    'Heart',
    'Pulse',
    'Drug Test',
    'Lungs',
    'Brain',
    'Virus',
    'Heart Care',
    'Microscope',
    'DNA',
    'Pills',
    'Syringe',
    'Virus',
    'Thermometer',
    'Allergies',
  ];

  final List<List<String>> testDetailsList = [
    ['ECG', 'Echo', 'Stress Test'],
    ['Pulse Oximetry', 'ABG'],
    ['Cannabis Test', 'Opioids Test'],
    ['Chest X-Ray', 'Lung Function Test'],
    ['CT Scan', 'MRI'],
    ['PCR', 'Antigen Test'],
    ['Cardiac MRI', 'Cardiac CT'],
    ['Microscopic Analysis'],
    ['Genetic Test', 'Ancestry Test'],
    ['Prescription Medications'],
    ['Vaccinations', 'Flu Shot'],
    ['COVID-19 Test', 'Antibody Test'],
    ['Fever Check'],
    ['Allergy Skin Test', 'IgE Blood Test'],
  ];

  final List<Color> colorList = [
    Colors.red.withOpacity(0.5),
    Colors.pink.withOpacity(0.5),
    Colors.green.withOpacity(0.5),
    Colors.teal.withOpacity(0.5),
    Colors.blue.withOpacity(0.5),
    Colors.purple.withOpacity(0.5),
    Colors.orange.withOpacity(0.5),
    Colors.brown.withOpacity(0.5),
    Colors.cyan.withOpacity(0.5),
    Colors.yellow.withOpacity(0.5),
    Colors.deepPurple.withOpacity(0.5),
    Colors.lime.withOpacity(0.5),
    Colors.indigo.withOpacity(0.5),
    Colors.amber.withOpacity(0.5),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
      ),
      itemCount: iconDataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TestDetailsScreen(
                  testName: textList[index],
                  testDetails: testDetailsList[index],
                  onTestBooked: onTestBooked,
                ),
              ),
            );
          },
          child: Card(
            color: Colors.blue.shade50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(iconDataList[index], size: 50, color: colorList[index]),
                SizedBox(height: 8),
                Text(textList[index]),
              ],
            ),
          ),
        );
      },
    );
  }
}
