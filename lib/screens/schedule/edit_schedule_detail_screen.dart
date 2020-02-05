import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditScheduleDetail extends StatefulWidget {
  final DocumentSnapshot ds;

  EditScheduleDetail(this.ds);

  @override
  _EditScheduleDetailState createState() => _EditScheduleDetailState();
}

class _EditScheduleDetailState extends State<EditScheduleDetail> {
  void _showConfirmDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Please review data"),
          content: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Sets'),
                SizedBox(width: 20),
                Text('Weight (kg)'),
                SizedBox(width: 20),
                Text('Reps'),
              ],
            ),
            ...sets
          ]),
          actions: <Widget>[
            FlatButton(
              child: new Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text("Save"),
              onPressed: () {
                List logs = [];

                for (int i = 0; i < weightControllers.length; i++) {
                  Map setMap = {
                    'set': i + 1,
                    'weight': weightControllers[i].text,
                    'reps': repsControllers[i].text,
                  };

                  logs.add(setMap);
                }

                Firestore.instance
                    .collection('logs')
                    .document(widget.ds.documentID)
                    .updateData({
                  'date': _date,
                  'logs': logs,
                }).then((onValue) {
                  Navigator.pop(context);
                  Navigator.pop(context);
                }).catchError((onError) => print(onError));
              },
            ),
          ],
        );
      },
    );
  }

  List weightControllers = [];
  List repsControllers = [];

  DateTime _date;

  void initState() {
    super.initState();

    _date = DateTime.parse(widget.ds['date'].toDate().toString());

    setCount = 0;

    for (var i = 0; i < widget.ds['logs'].length; i++) {
      setState(() {
        setCount++;
        TextEditingController wCtr = TextEditingController();
        TextEditingController rCtr = TextEditingController();

        wCtr.text = widget.ds['logs'][i]['weight'];
        rCtr.text = widget.ds['logs'][i]['reps'];

        weightControllers.add(wCtr);
        repsControllers.add(rCtr);

        sets.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('$setCount'),
              SizedBox(width: 20),
              Flexible(
                child: TextField(
                  controller: wCtr,
                  decoration: InputDecoration(hintText: '20'),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: TextField(
                  controller: rCtr,
                  decoration: InputDecoration(hintText: '12'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        );
      });
    }
  }

  Future _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _date = picked;
      });
    }
  }

  List<Widget> sets = [];

  int setCount = 0;

  _addNewSet() {
    setState(() {
      setCount++;
      TextEditingController wCtr = TextEditingController();
      TextEditingController rCtr = TextEditingController();

      weightControllers.add(wCtr);
      repsControllers.add(rCtr);

      sets.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('$setCount'),
            SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: wCtr,
                decoration: InputDecoration(hintText: '20'),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(width: 20),
            Flexible(
              child: TextField(
                controller: rCtr,
                decoration: InputDecoration(hintText: '12'),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit ${widget.ds['exercise']}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text('Change date'),
              onPressed: () => _selectDate(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Sets'),
                SizedBox(width: 20),
                Text('Weight (kg)'),
                SizedBox(width: 20),
                Text('Reps'),
              ],
            ),
            ...sets,
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add),
                      Text('new set'),
                    ],
                  ),
                  onPressed: _addNewSet,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      if (sets.isNotEmpty &&
                          weightControllers.isNotEmpty &&
                          repsControllers.isNotEmpty) {
                        sets.remove(sets.last);
                        weightControllers.remove(weightControllers.last);
                        repsControllers.remove(repsControllers.last);
                      }
                    });
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text('Update Log'),
              onPressed: () => _showConfirmDialog(),
            ),
          ],
        ),
      ),
    );
  }
}
