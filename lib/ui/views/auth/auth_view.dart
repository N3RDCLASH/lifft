import 'package:LIFFT/ui/views/auth/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../screens/account/authentication/register_screen.dart';
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
  @override
  Widget build(BuildContext context, AuthViewModel model) {
    return MaterialButton(
      color: Colors.blue,
      onPressed: () {
        model.navigateToHome();
      },
      child: Text("login"),
    );
  }
}
