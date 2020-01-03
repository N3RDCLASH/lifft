import 'package:flutter/material.dart';
import 'package:lifft/style/theme.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: new GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: SingleChildScrollView(
            // child: ConstrainedBox(
              // constraints: BoxConstraints(),
              child: Column(
                children: <Widget>[
                  Image.asset('assets/images/login_header.png',colorBlendMode:BlendMode.clear,),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.588,
                    decoration: background_gradient,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                              child: TextFormField(
                                style: white_text,
                                decoration: const InputDecoration(
                                  enabledBorder: white_border,
                                  labelStyle: white_text,
                                  icon: Icon(
                                    Icons.person,
                                    color: white_color,
                                  ),
                                  // hintText: 'What do people call you?',
                                  labelText: 'Username ',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                              child: TextFormField(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(50, 20, 35, 0),
                                  child: RaisedButton(
                                    onPressed: () {},
                                    textColor: Colors.white,
                                    padding: const EdgeInsets.all(0.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(20)),
                                    child: Container(
                                      width: 250,
                                      decoration: const BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              main_color1,
                                              main_color2
                                            ],
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(80.0))),
                                      padding: const EdgeInsets.all(10.0),
                                      child: Center(
                                        child: const Text(
                                          'Log In',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            // ),
          ),
        ),
      ),
    );
  }
}
