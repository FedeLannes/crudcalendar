import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudcalendar/model/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class MeetingScreen extends StatefulWidget {
  final Meeting meeting;

  MeetingScreen(this.meeting);

  @override
  _MeetingScreenState createState() => _MeetingScreenState();
}

final meetingReference = FirebaseDatabase.instance.reference().child('meeting');

class _MeetingScreenState extends State<MeetingScreen> {
  final fireStoreReference = FirebaseFirestore.instance;

  TextEditingController? _subjectController;

  @override
  void initState() {
    super.initState();

    _subjectController =
        new TextEditingController(text: widget.meeting.eventName);

    // eventname
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _subjectController,
                  style:
                      TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
                  decoration: InputDecoration(
                      icon: Icon(Icons.list), labelText: 'subject'),
                ),
                Divider(),
                TextButton(
                    onPressed: () {
                      if (widget.meeting.key != null) {
                        meetingReference.child(widget.meeting.key).set({
                          'Subject': _subjectController?.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      } else {
                        meetingReference.push().set({
                          'Subject': _subjectController?.text,
                        }).then((_) {
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.meeting.eventName != null)
                        ? Text('Update')
                        : Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
