import 'package:flutter/material.dart';
import 'package:nex_lab/screens/details_screen.dart';
import 'package:nex_lab/screens/inhome_screens/tests_sceen.dart'; // Import the test.dart file

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  // Variable to track dark mode state
  bool isDarkMode = false;

  // Variable to track the selected index of the bottom navigation bar
  int _selectedIndex = 0;

  // Variable to track the currently selected swappable item
  int _currentSwappableIndex = 0;

  // List of pages for the bottom navigation
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildHomePage(), // Home page with icons
      Center(child: Text('Search Page')),
      Center(child: ElevatedButton(onPressed: () {}, child: Text('Profile Page'))),
      Center(child: Text('Chat Page')),
      Center(child: Text('Settings Page')),
    ];
  }
  Widget _buildSwappableRow() {
    final List<String> titles = ['Tests', 'Packages', 'Doctors'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: List.generate(titles.length, (index) {
        return _buildSwappableItem(titles[index], index);
      }),
    );
  }

  Widget _buildHomePage() {
    return Column(
      children: [
        _buildSwappableRow(), // Add the swappable row here
        Expanded(
          child: IndexedStack(
            index: _currentSwappableIndex,
            children: [
              Tests_Screen(), // Use the TestScreen widget here
              Center(child: Text('This is the Packages screen.')), // Placeholder for Packages
              Center(child: Text('This is the Doctors screen.')), // Placeholder for Doctors
            ],
          ),
        ),
      ],
    );
  }



  Widget _buildSwappableItem(String title, int index) {
    return GestureDetector(
      onTap: () {
        
        setState(() {
          _currentSwappableIndex = index; 
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _currentSwappableIndex == index ? Colors.blue.withOpacity(0.5) : Color(0x79FFFFFF),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: _currentSwappableIndex == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
      _currentSwappableIndex = 0; // Reset the swappable index when changing tabs
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade50,
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(0.5, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              'Assets/Nexlab logo.png',
              width: 189,
              height: 33,
              fit: BoxFit.contain,
              alignment: Alignment(-1, -1.6),
            ),
          ),
        ),
        actions: const [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Icon(
              Icons.menu,
              color: Colors.black,
              size: 44,
            ),
          ),
        ],
        centerTitle: true,
        elevation:  0,
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
              ),
              child: Text(
                'Nexlab',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text('Darkmode'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  setState(() {
                    isDarkMode = value; // Update the dark mode state
                  });
                },
              ),
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body:_selectedIndex==0?_buildHomePage():
            Center(child: Text("Blanck")), 
            // Display the home page with swappable row
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.blue,
        unselectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
      ),
    );
  }
}