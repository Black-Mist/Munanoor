import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:training/views/pages/login/otppage.dart';
import 'package:training/views/widgets/app_button.dart';

import '../../widgets/login_text.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final name = TextEditingController();
  final userid = TextEditingController();
  final useridFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset('assets/logo_login_page.png'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Signup',
                        style: TextStyle(fontSize: 33),
                      ),
                      Text(
                        'Sign up with name & phone number',
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.w200),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          controller: name,
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              hintText: 'YOUR NAME',
                              border: OutlineInputBorder()),
                          onSubmitted: (value) =>
                              useridFocusNode.requestFocus(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText:
                                    'Enter valide Mobile Number or Email ID'),
                          ]),
                          controller: userid,
                          autofocus: true,
                          focusNode: useridFocusNode,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              hintText: 'MOBILE NUMBER/ EMAIL ID',
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 80),
                child: SizedBox(
                  child: Column(
                    children: [
                      defaulButton(
                          text: 'SUBMIT NOW',
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTPPage()))),
                      loginText(
                          question: 'Already have an account?',
                          solution: ' Login',
                          onTap: () => Navigator.pop(context)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
