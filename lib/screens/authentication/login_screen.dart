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
  TextEditingController resetCtr = TextEditingController();

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
                  cursorColor: white_color,
                  style: white_text,
                  decoration: const InputDecoration(
                    focusedBorder: white_border,
                    enabledBorder: white_border,
                    labelStyle: white_text,
                    icon: Icon(
                      Icons.email,
                      color: white_color,
                    ),
                    hintText: 'Enter your email...',
                    hintStyle: white_text,
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
                  cursorColor: white_color,
                  style: white_text,
                  decoration: const InputDecoration(
                    // style
                    focusedBorder: white_border,
                    enabledBorder: white_border,
                    labelStyle: white_text,
                    // counterStyle: white_text,
                    icon: Icon(
                      Icons.lock,
                      color: white_color,
                    ),
                    hintText: 'Enter your password...',
                    hintStyle: white_text,
                    labelText: 'Password ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: Container(
                  child: Material(
                    child: InkWell(
                      splashColor: Colors.grey,
                      child: Container(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: white_color,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      onTap: () {
                        showDialog(
                          context: context,
                          child: AlertDialog(
                            backgroundColor: background_color1,
                            content: Form(
                              child: Container(
                                height: MediaQuery.of(context).size.height * .2,
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      style: white_text,
                                      cursorColor: white_color,
                                      controller: resetCtr,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        focusedBorder: white_border,
                                        enabledBorder: white_border,
                                        border: white_border,
                                        labelText: 'Email Address',
                                        labelStyle: white_text,
                                        hintText: 'Enter your email address',
                                        hintStyle: white_text,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: FlatButton(
                                        child: Text(
                                          'Reset Password',
                                          style: white_text,
                                        ),
                                        color: main_color1,
                                        onPressed: () {
                                          print(resetCtr.text);
                                          if (resetCtr.text != null ||
                                              resetCtr.text != '') {
                                            _auth.resetPassword(resetCtr.text);
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                        // _auth.resetPassword(email);
                      },
                    ),
                    color: Colors.transparent,
                  ),
                  // color: Colors.orange,
                ),
              ),
              Column(
                children: <Widget>[
                  const SizedBox(
                    width: double.infinity,
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 35, 0),
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
                      child: InkWell(
                        splashColor: Colors.grey,
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
                            padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
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
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Roboto',
                                color: background_color1),
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
