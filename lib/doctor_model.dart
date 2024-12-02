import 'dart:ffi';

class HighlightDoctor {
  final String name;
  final String specialty;
  final String avatarPath;
  final String scheduleDate;
  final String scheduleTime;

  HighlightDoctor({
    required this.name,
    required this.specialty,
    required this.avatarPath,
    required this.scheduleDate,
    required this.scheduleTime,
  });
}

class NearDoctor {
  final String name;
  final String specialty;
  final String avatarPath;
  final String distance;
  final double rating;
  final int review;
  final String availability;

  NearDoctor({
    required this.name,
    required this.specialty,
    required this.avatarPath,
    required this.distance,
    required this.rating,
    required this.review,
    required this.availability,
});
}

