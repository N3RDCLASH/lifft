import 'package:LIFFT/ui/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../style/theme.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        builder: (context, model, child) {
          return Scaffold(
            body: new GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Column(
                children: <Widget>[
                  Container(
                    // height:size.height*0.20,
                    child: Image.asset('assets/images/login_header.png',
                        colorBlendMode: BlendMode.clear, fit: BoxFit.fill),
                  ),
                  Expanded(
                    child: Container(
                      decoration: background_gradient,
                      child: Container(
                        child: Container(
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
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        viewModelBuilder: () => AuthViewModel());
  }
}

//TODO: Move TO Smart Widget
class Login extends ViewModelWidget<AuthViewModel> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context, AuthViewModel model) => Form(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                validator: (value) => model.validateEmail(value),
                controller: _emailController,
                decoration: const InputDecoration(
                  focusedBorder: white_border,
                  enabledBorder: white_border,
                  labelStyle: white_text,
                  icon: Icon(
                    Icons.email,
                    color: white_color,
                  ),
                  hintStyle: white_text,
                  labelText: 'Email ',
                ),
              ),
              TextFormField(
                validator: (value) => model.validatePassword(value),
                controller: _passwordController,
                cursorColor: Colors.white,
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
            ],
          ),
        ),
      ));
}

class Register extends ViewModelWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context, AuthViewModel model) => Form(
          child: Column(
        children: <Widget>[
          TextFormField(),
          TextFormField(),
        ],
      ));
}
