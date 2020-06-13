import 'package:LIFFT/ui/views/auth/auth_viewmodel.dart';
import 'package:LIFFT/ui/views/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../style/theme.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        builder: (context, model, child) {
          return SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: background_gradient,
                        child: Container(
                          child: Register(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
        viewModelBuilder: () => RegisterViewModel());
  }
}

class Register extends ViewModelWidget<RegisterViewModel> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context, RegisterViewModel model) {
    return Form(
      key: model.formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "Register as new user",
                style: TextStyle(
                    fontSize: 18,
                    color: white_color,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
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
                            labelText: "First name", border: InputBorder.none),
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
                        controller: _emailController,
                        validator: (val) => model.validateEmail(val),
                        decoration: InputDecoration(
                            labelText: "Last name", border: InputBorder.none),
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
                        controller: _emailController,
                        validator: (val) => model.validateEmail(val),
                        decoration: InputDecoration(
                            labelText: "Email", border: InputBorder.none),
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
                        controller: _passwordConfirmController,
                        obscureText: model.showPassword,
                        validator: (val) => model.validatePassword(val),
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
                            suffixIcon: IconButton(
                              icon: model.showPassword
                                  ? Icon(Icons.visibility)
                                  : Icon(Icons.visibility_off),
                              onPressed: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                model.togglePassword();
                              },
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
              GestureDetector(
                onTap: () {},
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
                      "Register",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
