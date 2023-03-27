import 'package:flutter/material.dart';

import '../../widgets/app_button.dart';
import 'signuppage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final number = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/logo_login_page.png'),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: number,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: 'ENTER YOUR MOBILE NUMBER',
                        border: OutlineInputBorder()),
                    onSubmitted: (value) => number.text.length == 10
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => const SignupPage())))
                        : null,
                  ),
                  defaulButton(text: 'login', onTap: () {})
                ],
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don’t have an account ?',
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 13,
                        color: Color.fromARGB(255, 38, 90, 117)),
                  ),
                  signupButton(
                      text: 'signup',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignupPage())))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
