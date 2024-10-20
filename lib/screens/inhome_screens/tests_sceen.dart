// test.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nex_lab/screens/details_screen.dart';

class Tests_Screen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items in a row
        childAspectRatio: 3 / 2, // Aspect ratio of each item
      ),
      itemCount: iconDataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TestDetailsScreen(testName: textList[index])),
            );
          },
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(iconDataList[index], size: 50),
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