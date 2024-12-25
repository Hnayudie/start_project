import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:start_project/Screen/Schedule/canceled_schedule.dart';
import 'package:start_project/Screen/Schedule/completed_schedule.dart';
import 'package:start_project/Screen/Schedule/upcoming_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            // Custom TabBar
            SizedBox(
              height: 70,
              child: TabBar(
                isScrollable: true,
                automaticIndicatorColorAdjustment: false,
                overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
                unselectedLabelColor: Colors.grey,
                padding: const EdgeInsets.only(left: 16),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.blue.withOpacity(0.1),
                ),
                tabAlignment: TabAlignment.center,

                tabs: [
                  _buildCustomTab("Canceled Schedule"),
                  _buildCustomTab("Upcoming Schedule"),
                  _buildCustomTab("Completed Schedule"),
                ],
              ),
            ),
            // TabBarView for each tab
            Expanded(
              child: TabBarView(
                children: [
                  const CanceledSchedule(),
                  UpcomingSchedule(firestore: firestore),
                  const CompletedSchedule(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCustomTab(String title) {
    return Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.visible,
          ),
        ),
      ),
    );
  }
}



