import 'package:flutter/material.dart';
import 'package:nex_lab/models/bookedtest.dart';
import 'package:nex_lab/models/test_report.dart';
import 'package:nex_lab/screens/inhome_screens/bookedtests_screen.dart';
import 'package:nex_lab/screens/inhome_screens/tests_sceen.dart';
import 'package:nex_lab/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDarkMode = false;
  int _selectedIndex = 0;
  int _currentSwappableIndex = 0;
  List<BookedTest> bookedTests = [];
  List<TestReport> testReports = [];

  void _bookTest(BookedTest bookedTest) {
    setState(() {
      if (!bookedTests.any((test) => test.name == bookedTest.name)) {
        bookedTests.add(bookedTest);
        // Add a test report for demonstration purposes
        testReports.add(TestReport(
          testName: bookedTest.name,
          date: bookedTest.dateTime,
          result: "Positive", // Example result
        ));
      }
    });
  }

  Widget _buildSwappableRow() {
    final titles = ['Tests', 'Booked Tests'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(titles.length, (index) {
        return GestureDetector(
          onTap: () => setState(() => _currentSwappableIndex = index),
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _currentSwappableIndex == index ? Colors.blue.withOpacity(0.5) : Color(0x79FFFFFF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                titles[index],
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: _currentSwappableIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        title: Image.asset('Assets/Nexlab logo.png', width: 189, height: 33, fit: BoxFit.contain),
        actions: [Icon(Icons.circle_notifications, color: Colors.black, size: 40)],
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade50),
              child: Text('Nexlab', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
            ListTile(
              title: Text('Darkmode'),
              trailing: Switch(value: isDarkMode, onChanged: (value) => setState(() => isDarkMode = value)),
            ),
            ListTile(title: Text('About'), onTap: () => Navigator.pop(context)),
            ListTile(title: Text('Contact'), onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
      body: _selectedIndex == 1
          ? Column(
              children: [
                _buildSwappableRow(),
                Expanded(
                  child: IndexedStack(
                    index: _currentSwappableIndex,
                    children: [
                      Tests_Screen(onTestBooked: _bookTest),
                      BookedTestsScreen(bookedTests: bookedTests),
                    ],
                  ),
                ),
              ],
            )
          : (_selectedIndex == 0
              ? ResultsScreen(testReports: testReports)
              : Center(child: Text('Profile Screen'))), // Placeholder for Profile screen
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Results'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
        }),
      ),
    );
  }
}
