import 'package:LIFFT/services/auth.dart';
import 'package:LIFFT/style/theme.dart';
import 'package:flutter/material.dart';

final _auth = AuthService();

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white_color,
        elevation: 0,
        title: Text(
          'Account',
          style: TextStyle(color: black_color),
        ),
      ),
      body: Center(
        child: FlatButton(
          color: main_color1,
          child: Text('Log Out'),
          onPressed: () {
            _auth.signOut();
            _auth.signOutGoogle();
          },
        ),
      ),
    );
  }
}
