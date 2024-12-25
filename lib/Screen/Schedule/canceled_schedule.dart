import 'package:flutter/material.dart';
class CanceledSchedule extends StatefulWidget {
  const CanceledSchedule({super.key});

  @override
  CanceledScheduleState createState() => CanceledScheduleState();
}

class CanceledScheduleState extends State<CanceledSchedule> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(
      child: Text("Canceled Schedule"),
    );
  }
  @override
  bool get wantKeepAlive => true;
}