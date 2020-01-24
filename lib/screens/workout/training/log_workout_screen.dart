import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LogWorkout extends StatefulWidget {
  @override
  _LogWorkoutState createState() => _LogWorkoutState();
}

class _LogWorkoutState extends State<LogWorkout> {
  TextEditingController searchController = TextEditingController();
  String searchString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('logging'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Search for exercises"),
              controller: searchController,
              onChanged: (val) {
                setState(() {
                  searchString = val.toLowerCase();
                });
              },
            ),
            RaisedButton(
              child: Text('add new exercise'),
              onPressed: () => Navigator.pushNamed(context, '/add_exercise'),
            ),
            StreamBuilder(
                stream: (searchString == null || searchString.trim() == "")
                    ? Firestore.instance.collection('exercises').snapshots()
                    : Firestore.instance
                        .collection('exercises')
                        .where('searchIndex', arrayContains: searchString)
                        .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Text("Loading..");
                  }

                  print(snapshot.data.documents);

                  return Container(
                    height: 600,
                    child: ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (BuildContext context, int index) {
                          DocumentSnapshot ds = snapshot.data.documents[index];

                          return ListTile(
                            title: Text(ds['name']),
                            subtitle: Text(ds['description']),
                            onTap: () {},
                          );
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
