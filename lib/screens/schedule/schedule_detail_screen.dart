import 'package:LIFFT/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleDetail extends StatefulWidget {
  final event;

  ScheduleDetail(this.event);

  @override
  _ScheduleDetailState createState() => _ScheduleDetailState();
}

class _ScheduleDetailState extends State<ScheduleDetail> {
  bool isLoaded = false;
  List m = new List(100);
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = Provider.of<User>(context);

    Firestore.instance
        .collection('logs')
        .where('uid', isEqualTo: user.uid)
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      setState(() {
        for (var i = 0; i < snapshot.documents.length; i++) {
          if (DateFormat("yyyy-MM-dd").format(
                  DateTime.parse(widget.event[4].toDate().toString())) ==
              DateFormat("yyyy-MM-dd").format(DateTime.parse(
                  snapshot.documents[i].data['date'].toDate().toString()))) {
            m[i] = snapshot.documents[i];
          }
        }
      });
      isLoaded = true;
    });
  }

  void _showDeleteDialog(DocumentSnapshot ds) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are u sure?"),
          content: Text("This log will be deleted permanently."),
          actions: <Widget>[
            FlatButton(
              child: new Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text("Yes"),
              onPressed: () {
                setState(() {
                  try {
                    Firestore.instance
                        .collection('logs')
                        .document(ds.documentID)
                        .delete();
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                    m.remove(ds);
                  } catch (e) {
                    print(e.toString());
                  }
                });
              },
            ),
          ],
        );
      },
    );
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
                return m[index] != null
                    ? ListTile(
                        title: Text(m[index].data['exercise']),
                        subtitle: Text(m[index].data['logs'].toString()),
                        trailing: PopupMenuButton(
                          color: Colors.white,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 1,
                              child: FlatButton(
                                child: Text('Edit'),
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    '/edit_schedule_detail',
                                    arguments: m[index],
                                  );
                                },
                              ),
                            ),
                            PopupMenuItem(
                              value: 2,
                              child: FlatButton(
                                child: Text('Delete'),
                                onPressed: () {
                                  _showDeleteDialog(m[index]);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container();
              },
            )
          : CircularProgressIndicator(),
    );
  }
}
