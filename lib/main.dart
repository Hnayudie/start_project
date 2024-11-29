
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_project/schedule.dart';

void main() {
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Hello,\n",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const TextSpan(
                  text: "Hi James",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              backgroundColor: Colors.orange[200],
              radius: 35,
              child: const Icon(Icons.mood, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Doctor Highlight Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset('images/doctor1.svg'),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr. Imran Syahir",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "General Doctor",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios, color: Colors.white),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(color: Colors.blue),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Sunday, 12 June",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "11:00 - 12:00 AM",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16),

                ),
                child: TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search doctor or health issue",
                    icon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Quick Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickAction(Icons.coronavirus, "Covid 19"),
                  _quickAction(Icons.person, "Doctor"),
                  _quickAction(Icons.medication, "Medicine"),
                  _quickAction(Icons.local_hospital, "Hospital"),
                ],
              ),
              const SizedBox(height: 30),

              //Near Doctor Session
              const Text(
                "Near Doctor",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: SvgPicture.asset('images/doctor2.svg'),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dr.Joseph Brostito",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Dental Speacialist",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 20),
                        const Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.grey,
                              size: 18,
                            ),

                            SizedBox(width: 5),
                            Text(
                              "1.2 KM",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade300),
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.orange,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "4.8 (120 Reviews)",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                        SizedBox(width: 30),
                        Icon(
                          Icons.access_time,
                          color: Colors.blue,
                          size: 18,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Open at 17.00",
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _quickAction(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue[100],
          radius: 32,
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
