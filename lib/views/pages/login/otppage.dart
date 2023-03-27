import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:training/views/widgets/login_text.dart';

import '../../widgets/app_button.dart';
import 'enquirypage.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({Key? key}) : super(key: key);

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'OTP verification',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                  ),
                  const Text(
                    'We have just send you an SMS with \n verification code to the number ',
                    style: TextStyle(
                        fontWeight: FontWeight.w100, color: Colors.black54),
                  ),
                  Row(
                    children: [
                      const Text(
                        '+971 123 456 786',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: () => showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5.0)), //this right here
                                    child: SizedBox(
                                      height: 250,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Text('Update your number'),
                                            const TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText:
                                                      'ENTER YOUR MOBILE NUMBER'),
                                            ),
                                            SizedBox(
                                              width: 320.0,
                                              child: defaulButton(
                                                  text: 'VERIFY CODE',
                                                  onTap: () =>
                                                      Navigator.pop(context)),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                            child: SvgPicture.asset('assets/bx_edit.svg')),
                      ),
                    ],
                  ),
                ],
              ),
            ),

//##################################################################

            /// pinput package we will use here
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: double.infinity,
                child: Pinput(
                  length: 5,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: Colors.black12,
                        width: 1.0,
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: const Color.fromARGB(255, 11, 212, 212),
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),

//#########################################################################################

            defaulButton(
                text: 'VERIFY CODE',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const EnquiryPage())))),
            loginText(
                question: 'Didn’t get the OTP?',
                solution: ' Resend now',
                onTap: () {})
          ],
        ),
      ),
    );
  }
}
