import 'package:flutter/material.dart';
import 'package:gizera_club/commons/widgets/buttom_nav_bar.dart';
import 'package:gizera_club/commons/widgets/custom_button.dart';
import 'package:gizera_club/commons/widgets/custom_textfield.dart';
import 'package:gizera_club/constants/global_variables.dart';
import 'package:gizera_club/features/authorization/authorization_screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _signInFromKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _signInFromKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/gsc_logo.png"),
                  CustomTextField(
                    fieldName: 'Email',
                    textInputType: TextInputType.emailAddress,
                    controller: _emailController,
                  ),
                  CustomTextField(
                    hideText: true,
                    fieldName: 'Password',
                    controller: _passwordController,
                  ),
                  CustomButton(
                      pressed: () {
                        if (_signInFromKey.currentState!.validate()) {
                          // signInUser();
                          Navigator.pushNamedAndRemoveUntil(context, ButtonNavBar.routeName, (route) => false);
                        }
                      },
                      buttonText: 'Login'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account '),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                          minimumSize: Size.zero,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.routeName);
                        },
                        child: const Text(
                          'register',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: GlobalVariables.mainColor),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
