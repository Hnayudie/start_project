import 'package:flutter/material.dart';
class CompletedSchedule extends StatefulWidget {
  const CompletedSchedule({super.key});

  @override
  CompletedScheduleState createState() => CompletedScheduleState();
}

class CompletedScheduleState extends State<CompletedSchedule> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("Completed Schedule"),
    );
  }

  @override
  bool get wantKeepAlive => true;

}