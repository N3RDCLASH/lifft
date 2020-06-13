import 'package:LIFFT/ui/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../style/theme.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: Scaffold(
              body: ListView(
                children: <Widget>[
                  Container(
                    child: Image.asset('assets/images/login_header.png',
                        colorBlendMode: BlendMode.clear, fit: BoxFit.fill),
                  ),
                  Container(
                    decoration: background_gradient,
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
                                    MediaQuery.of(context).size.height * 0.55,
                                child: TabBarView(
                                  children: [
                                    Login(),
                                    Login(),
                                  ],
                                ),
                              ),
                            )
                          ],
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

class Register extends ViewModelWidget<AuthViewModel> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, AuthViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFB7B7B7).withOpacity(.16),
                    blurRadius: 30,
                    offset: Offset(0, 10)),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFB7B7B7).withOpacity(.16),
                      ),
                    ),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (val) => model.validateEmail(val),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFB7B7B7).withOpacity(.16),
                      ),
                    ),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: model.showPassword,
                    validator: (val) => model.validatePassword(val),
                    decoration: InputDecoration(
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: model.showPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            model.togglePassword();
                          },
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Forgot password?",
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              model.signIn(_emailController.text, _passwordController.text);
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[main_color1, main_color2],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//TODO: Move TO Smart Widget
class Login extends ViewModelWidget<AuthViewModel> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, AuthViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Color(0xFFB7B7B7).withOpacity(.16),
                    blurRadius: 30,
                    offset: Offset(0, 10)),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFB7B7B7).withOpacity(.16),
                      ),
                    ),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (val) => model.validateEmail(val),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        labelText: "Email",
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                        ),
                        border: InputBorder.none),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFFB7B7B7).withOpacity(.16),
                      ),
                    ),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: model.showPassword,
                    validator: (val) => model.validatePassword(val),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: "Password",
                        suffixIcon: IconButton(
                          icon: model.showPassword
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                          onPressed: () {
                            model.togglePassword();
                          },
                        ),
                        hintStyle: TextStyle(
                          color: Color(0xFFB7B7B7),
                        ),
                        border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Forgot password?",
            style: TextStyle(
                fontWeight: FontWeight.w300, fontSize: 14, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              model.signIn(_emailController.text, _passwordController.text);
            },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[main_color1, main_color2],
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
