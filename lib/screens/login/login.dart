import 'package:flutter/material.dart';
import 'package:karkarapp/components/divider.dart';
import 'package:karkarapp/components/round_button.dart';
import 'package:karkarapp/components/round_input.dart';
import 'package:karkarapp/screens/login/components/account_check.dart';
import 'package:karkarapp/screens/login/components/social_button.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              child: Image.asset("assets/images/top_left_2.png"),
              top: 0,
              left: 0,
              width: size.width,
            ),
            Positioned(
              child: Image.asset("assets/images/button_left.png"),
              bottom: 0,
              left: 0,
              width: size.width * 0.85,
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "LOG IN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    "assets/logo/login_logo.png",
                    height: size.height * 0.37,
                  ),
                  RoundInput(
                      text: 'email',
                      icon: Icons.person,
                      controller: _emailController,
                      onChanged: (value) {}),
                  RoundInput(
                      text: 'password',
                      controller: _passwordController,
                      obscureText: true,
                      onChanged: (value) {}),
                  RoundedButton(
                      text: 'LOGIN',
                      onPressed: () {
                        // print(_emailController.text.toString());
                        // print(_passwordController.text.toString());
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'Sorry .·´¯`(>▂<)´¯`·.  Login is under developing')));
                      }),
                  const XDivider(text: 'OR'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SocialIcon(
                        iconPath: "assets/icons/facebook.png",
                        onTap: () {},
                      ),
                      SocialIcon(
                        iconPath: "assets/icons/google.png",
                        onTap: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  AccountCheck(loginPage: false, onTap: (){print('ok');})
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
