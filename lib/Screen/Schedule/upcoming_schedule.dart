import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../doctor_model.dart';
class UpcomingSchedule extends StatefulWidget {
  final FirebaseFirestore firestore;
  const UpcomingSchedule({super.key, required this.firestore});

  @override
  UpcomingScheduleState createState() => UpcomingScheduleState();
}

class UpcomingScheduleState extends State<UpcomingSchedule> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<QuerySnapshot>(
      stream: widget.firestore.collection('HighlightDoctor').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No Upcoming Schedules.'));
        }
        final doctors = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return HighlightDoctor(
            name: data['name'] ?? 'Unknown',
            specialty: data['specialty'] ?? 'Not Available',
            avatarPath: data['avatarPath'],
            scheduleDate: data['scheduleDate'] ?? 'No Date',
            scheduleTime: data['scheduleTime'] ?? 'No Time',
          );
        }).toList();

        return ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return _upComingSchedule(doctors[index]);
          },
        );
      },
    );
  }

  Widget _upComingSchedule(HighlightDoctor highlightDoctor) {
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
                  child: CachedNetworkImage(
                    imageUrl: highlightDoctor.avatarPath,
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
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
  }

  @override
  bool get wantKeepAlive => true;
}