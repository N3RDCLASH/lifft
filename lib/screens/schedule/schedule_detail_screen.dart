import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleDetail extends StatefulWidget {
  final event;

  ScheduleDetail(this.event);

  @override
  _ScheduleDetailState createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  bool isLoaded = false;
  List m = [];
  @override
  void initState() {
    super.initState();

    Firestore.instance
        .collection('logs')
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      setState(() {
        snapshot.documents.forEach((f) {
          if (DateFormat('EEEE').format(
                  DateTime.parse(widget.event[4].toDate().toString())) ==
              DateFormat('EEEE')
                  .format(DateTime.parse(f.data['date'].toDate().toString()))) {
            m.add(f.data);
          }
        });
      });
      isLoaded = true;

      print(m);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('schedule detail'),
      ),
      body: isLoaded == true
          ? ListView.builder(
              itemCount: m.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(m[index]['exercise']),
                  subtitle: Text(m[index]['logs'].toString()),
                );
              },
            )
          : CircularProgressIndicator(),
    );
  }
}
