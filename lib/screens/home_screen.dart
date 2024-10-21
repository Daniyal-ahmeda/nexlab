import 'package:flutter/material.dart';
import 'package:nex_lab/screens/inhome_screens/bookedtests_screen.dart';
import 'package:nex_lab/screens/inhome_screens/tests_sceen.dart';


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

  void _bookTest(BookedTest bookedTest) {
    setState(() {
      if (!bookedTests.any((test) => test.name == bookedTest.name)) {
        bookedTests.add(bookedTest);
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
        actions: [Icon(Icons.notifications, color: Colors.black, size: 40)],
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
      body: _selectedIndex == 0
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
          : Center(child: Text("Blank")),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
          _selectedIndex = index;
          _currentSwappableIndex = 0;
        }),
      ),
    );
  }
}