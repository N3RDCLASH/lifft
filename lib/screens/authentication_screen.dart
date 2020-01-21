import 'package:LIFFT/screens/authentication/login_screen.dart';
import 'package:LIFFT/screens/authentication/register_screen.dart';
import 'package:LIFFT/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase';

import './../style/theme.dart';

class Authentication extends StatefulWidget {
  @override
  AuthenticationState createState() => AuthenticationState();
}

class AuthenticationState extends State<Authentication> {
  final _auth = AuthService();
//state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                // height:size.height*0.20,
                child: Image.asset(
                  'assets/images/login_header.png',
                  colorBlendMode: BlendMode.clear,
                  fit: BoxFit.fill
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 1,
                decoration: background_gradient,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: ListView(
                      children: <Widget>[
                        Container(
                          child: DefaultTabController(
                              length: 2,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    child: TabBar(
                                      tabs: [
                                        // Login(),
                                        Tab(
                                          text: 'Login',
                                        ),
                                        Tab(
                                          text: 'Register',
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.58,
                                      child: TabBarView(
                                        children: [
                                          Login(),
                                          Register(),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
