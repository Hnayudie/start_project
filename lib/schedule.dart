import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();

}

class _ScheduleScreenState  extends State<ScheduleScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Material(
              child: Container(
                height: 60,
                color: Colors.white,
                child: TabBar(
                  isScrollable: true,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  tabs: [
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Canceled Schedule",
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Upcoming Schedule",
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey, width: 1),
                        ),
                        child: const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Completed Schedule",
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  const Center(
                    child: Text("Canceled Schedule"),
                  ),
                  ListView(
                    padding: const EdgeInsets.all(8),
                    children: [
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Sunday, 12 June",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 30),
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "11:00 - 12:00 AM",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 154),
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              child: const Text(
                                "Detail",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],

                        ),
                      ),
                      const SizedBox(height:5),
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
                                  child: SvgPicture.asset('images/doctor3.svg'),
                                ),
                                const SizedBox(width: 16),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr.Bessie Coleman",
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Sunday, 12 June",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 30),
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "11:00 - 12:00 AM",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 154),
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              child: const Text(
                                "Detail",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],

                        ),
                      ),
                      const SizedBox(height:5),
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
                                  child: SvgPicture.asset('images/doctor4.svg'),
                                ),
                                const SizedBox(width: 16),
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dr.Babe Didrikson",
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Sunday, 12 June",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 30),
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "11:00 - 12:00 AM",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 154),
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              child: const Text(
                                "Detail",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],

                        ),
                      ),
                      const SizedBox(height:5),
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
                                  child: SvgPicture.asset('images/doctor4.svg'),
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
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(color: Colors.grey.shade300),
                            const SizedBox(height: 10),
                            const Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "Sunday, 12 June",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 30),
                                Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "11:00 - 12:00 AM",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 154),
                                backgroundColor: Colors.blue.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),

                              child: const Text(
                                "Detail",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],

                        ),
                      ),
                    ],
                  ),
                  const Center(
                    child: Text("Completed Schedule"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}




