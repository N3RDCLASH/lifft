import 'package:LIFFT/models/user.dart';
import 'package:LIFFT/screens/account/authentication/authentication_screen.dart';
import 'package:provider/provider.dart';
import '../screens/home_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authentication();
    } else {
      return Home();
    }
  }
}
