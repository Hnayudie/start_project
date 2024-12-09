
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_project/schedule.dart';
import 'package:start_project/doctor_model.dart';
import 'dart:math';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FirebaseFirestore firestore;
  late HighlightDoctor highlightDoctor;
  late Future<List<HighlightDoctor>> _highlightDoctors;
  final Random _random = Random();

  @override
  void initState() {
    super.initState();
    firestore = FirebaseFirestore.instance;
    _highlightDoctors = _fetchHighlightDoctor();
  }

  Future<List<HighlightDoctor>> _fetchHighlightDoctor() async {
    final snapshot = await firestore.collection('HighlightDoctor').get();
    return snapshot.docs.map((doc){
      final data = doc.data();
      return HighlightDoctor(
          name: data['name'] ?? '',
          specialty: data['specialty'] ?? '',
          avatarPath: data['avatarPath'],
          scheduleDate: data['scheduleDate'] ?? '',
          scheduleTime: data['scheduleTime'] ?? '',
      );
    }).toList();
  }

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
              FutureBuilder<List<HighlightDoctor>> (
                future: _highlightDoctors,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasError) {
                    return const Center(child: Text("Error loading doctors"));
                  }
                  if(!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No highlight doctor."));
                  }

                  final doctors = snapshot.data!;
                  highlightDoctor = doctors[_random.nextInt(doctors.length)];
                  return Container(
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
                              child: ClipOval(
                                child: CachedNetworkImage(imageUrl: highlightDoctor.avatarPath, imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                                  ),
                                ),),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  highlightDoctor.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  highlightDoctor.specialty,
                                  style: const TextStyle(
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
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              highlightDoctor.scheduleDate,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(width: 20),
                            const Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              highlightDoctor.scheduleTime,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
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
              StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('NearDoctor').snapshots(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if(!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No doctor available."));
                    }

                    final doctors = snapshot.data!.docs.map((doc){
                      final data = doc.data();
                      return NearDoctor(
                          name: data['name'] ?? '',
                          specialty: data['specialty'] ?? '',
                          avatarPath: data['avatarPath'],
                          distance: data['distance'],
                          rating: (data['rating'] as num).toDouble() ?? 0.0,
                          review: data['review'] ?? 0,
                          availability: data['availability']
                      );
                    }).toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: doctors.length,
                      itemBuilder: (context, index) {
                        return _nearDoctor(doctors[index]);
                      },
                    );
                  }
              )
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

  Widget _nearDoctor(NearDoctor nearDoctor){
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
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
                child: ClipOval(
                  child: CachedNetworkImage(imageUrl: nearDoctor.avatarPath, imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                    ),
                  )),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nearDoctor.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    nearDoctor.specialty,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.grey,
                    size: 18,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    nearDoctor.distance,
                    style: const TextStyle(
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
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.orange,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                "${nearDoctor.rating} (${nearDoctor.review} Reviews)",
                style: const TextStyle(
                  color: Colors.orange,
                ),
              ),
              const SizedBox(width: 30),
              const Icon(
                Icons.access_time,
                color: Colors.blue,
                size: 18,
              ),
              const SizedBox(width: 5),
              Text(
                nearDoctor.availability,
                style: const TextStyle(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }



}
