import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:start_project/doctor_data.dart';
import 'package:start_project/doctor_model.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();

}

class _ScheduleScreenState  extends State<ScheduleScreen> {
  late HighlightDoctor highlightDoctor;
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
                  ListView.builder(
                    itemCount: highlightDoctorList.length,
                    itemBuilder: (BuildContext context, int index){
                      final highlightDoctor = highlightDoctorList[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
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
                                  child: SvgPicture.asset(highlightDoctor.avatarPath),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      highlightDoctor.name,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      highlightDoctor.specialty,
                                      style: const TextStyle(
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
                            Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  highlightDoctor.scheduleDate,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                const Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  highlightDoctor.scheduleTime,
                                  style: const TextStyle(
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
                      );
                    },
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




