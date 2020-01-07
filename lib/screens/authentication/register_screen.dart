import 'package:LIFFT/services/auth.dart';
import 'package:LIFFT/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:LIFFT/style/theme.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

final _auth = AuthService();

String email = '';
String password = '';
String error = '';

class RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.588,
      decoration: background_gradient,
      child: Form(
        key: _formKey,
        child: Container(
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
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email, password);
                            if (result == null) {
                              setState(
                                  () => error = 'please supply a valid email');
                            }
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
                                  BorderRadius.all(Radius.circular(20.0))),
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: const Text(
                              'Register',
                              style:
                                  TextStyle(fontSize: 18, fontFamily: 'Roboto'),
                            ),
                          ),
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
                    // Center(
                    //   child: Row(
                    //     children: <Widget>[
                    //       Icon(Social.google),
                    //       Icon(Social.facebook)
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
