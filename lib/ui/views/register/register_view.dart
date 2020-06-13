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
                        child: ListView(
                          children: <Widget>[
                            AppBar(
                              backgroundColor: Colors.transparent,
                            ),
                            Register(),
                          ],
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
                        controller: model.firstNameController,
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
                        controller: model.lastNameController,
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
                        controller: model.emailController,
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
                        controller: model.passwordController,
                        obscureText: true,
                        validator: (val) => model.validatePassword(val),
                        decoration: InputDecoration(
                            labelText: "Password", border: InputBorder.none),
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
                        controller: model.passwordConfirmController,
                        obscureText: true,
                        validator: (val) => model.validatePassword(val),
                        decoration: InputDecoration(
                            labelText: "Confirm Password",
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
                onTap: () {
                  model.signUp(
                    email: model.emailController.text,
                    password: model.passwordController.text,
                    fistName: model.firstNameController.text,
                    lastName: model.lastNameController.text,
                  );
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (model.isBusy)
                        SizedBox(
                          height: 30.0,
                          width: 30.0,
                          child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                              strokeWidth: 3.0),
                        ),
                    ],
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
