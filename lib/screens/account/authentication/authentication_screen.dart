import 'package:flutter/material.dart';

import '../../../style/theme.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class Authentication extends StatefulWidget {
  @override
  AuthenticationState createState() => AuthenticationState();
}

class AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  // height:size.height*0.20,
                  child: Image.asset('assets/images/login_header.png',
                      colorBlendMode: BlendMode.clear, fit: BoxFit.fill),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.55,
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
                                        indicatorColor: white_color,
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
                                                0.55,
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
      ),
    );
  }
}