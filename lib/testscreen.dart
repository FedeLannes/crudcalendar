import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class Meeting {
  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;
  String? key;

  Meeting(
      {this.eventName,
      this.from,
      this.to,
      this.background,
      this.isAllDay,
      this.key});

  static Meeting fromFireBaseSnapShotData(dynamic element, Color color) {
    return Meeting(
        eventName: element.doc.data()!['Subject'],
        from: DateFormat('dd/MM/yyyy HH:mm:ss')
            .parse(element.doc.data()!['StartTime']),
        to: DateFormat('dd/MM/yyyy HH:mm:ss')
            .parse(element.doc.data()!['EndTime']),
        background: color,
        isAllDay: false,
        key: element.doc.id);
  }
}

class MeetingScreen extends StatefulWidget {
  const MeetingScreen(Meeting meeting, {Key? key}) : super(key: key);

  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  @override
  void initState() {
    super.initState();

    // eventname
  }

  Widget build(BuildContext context) {
    return Container();
  }
}
