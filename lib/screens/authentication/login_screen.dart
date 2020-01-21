import 'package:LIFFT/services/auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase';

import '../../style/theme.dart';

final _auth = AuthService();

//state

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                child: TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                  style: white_text,
                  decoration: const InputDecoration(
                    enabledBorder: white_border,
                    labelStyle: white_text,
                    icon: Icon(
                      Icons.email,
                      color: white_color,
                    ),
                    // hintText: 'What do people call you?',
                    labelText: 'Email ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: TextFormField(
                  validator: (val) => val.length < 6
                      ? 'Enter a password 6+ characters long'
                      : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                  style: white_text,
                  decoration: const InputDecoration(
                    // style
                    enabledBorder: white_border,
                    labelStyle: white_text,
                    // counterStyle: white_text,
                    icon: Icon(
                      Icons.lock,
                      color: white_color,
                    ),
                    // hintText: 'What do people call you?',
                    labelText: 'Password ',
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 35, 0),
                    child: RaisedButton(
                      onPressed: () async {
                        dynamic result = await _auth
                            .signInWIthUsernameAndPassword(email, password);
                        if (result == null) {
                          setState(() => error = 'please supply a valid email');
                        } else {
                          print('signed in');
                          print(result.uid);
                        }
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20)),
                      child: Container(
                        width: 250,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[main_color1, main_color2],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0))),
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: const Text(
                            'Log In',
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 35, 0),
                    child: RaisedButton(
                      onPressed: () async {
                        _auth.signInWithGoogle();
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20)),
                      child: Container(
                        width: 250,
                        decoration: const BoxDecoration(
                            // gradient: null,
                            color: white_color,
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0))),
                        padding: const EdgeInsets.all(10.0),
                        child: Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,0,8,0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * .06,
                              child: Image.asset(
                                'assets/images/google.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          const Text(
                            'Sign in with Google',
                            style:
                                TextStyle(fontSize: 18, fontFamily: 'Roboto', color: background_color1),
                          ),
                        ]),
                      ),
                    ),
                  ),
                  Text(
                    error,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
