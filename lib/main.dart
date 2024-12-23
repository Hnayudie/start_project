import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_project/Screen/schedule.dart';
import 'Screen/homeScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ScheduleScreen(),
    Center(child: Text('Messages Screen', style: TextStyle(fontSize: 20))),
    Center(child: Text('Profile Screen', style: TextStyle(fontSize: 20))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              icon: SvgPicture.asset('images/home.svg', width: 30, height: 30, color: _selectedIndex == 0 ?  Colors.blue : Colors.grey)
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/calendar.svg', width: 30, height: 30, color: _selectedIndex == 1 ?  Colors.blue : Colors.grey),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/message.svg', width: 28, height: 28, color: _selectedIndex == 2 ?  Colors.blue : Colors.grey),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('images/person.svg', width: 30, height: 30, color: _selectedIndex == 3 ?  Colors.blue : Colors.grey),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
