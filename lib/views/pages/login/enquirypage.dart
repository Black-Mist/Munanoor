import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';

import 'package:training/views/widgets/app_button.dart';

import '../home_page.dart';

class EnquiryPage extends StatefulWidget {
  const EnquiryPage({Key? key}) : super(key: key);

  @override
  State<EnquiryPage> createState() => _EnquiryPageState();
}

class _EnquiryPageState extends State<EnquiryPage> {
  final formKey = GlobalKey<FormState>();
  String locationPoint = 'YOUR LOCATION';
  String imagepicker = 'UPLOAD PHOTOS';
  @override
  void initState() {
    super.initState();

    permissionGrand();
  }

  Future<void> permissionGrand() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // print('Location permissions are denied');
      } else if (permission == LocationPermission.deniedForever) {
        // print("'Location permissions are permanently denied");
      } else {
        // print("GPS Location service is granted");
        getLocation();
      }
    } else {
      // print("GPS Location permission granted.");
      getLocation();
    }
  }

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      locationPoint =
          'Longitude ${position.longitude}, Latitude ${position.latitude}';
    });
  }

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imagepicker = image!.name.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Quick enquiry',
                        style: TextStyle(fontSize: 35),
                      ),
                      Text('Welcome to Freshpikk!'),
                    ],
                  ),
                ),
                SizedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                              return 'Enter currect name';
                            } else {
                              return null;
                            }
                          },
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                              hintText: 'NAME', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: 'Please enter a valid email'),
                            EmailValidator(
                                errorText: 'Enter a valid email address')
                          ]),
                          // autofocus: true,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              hintText: 'EMAIL', border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r'^([0-9]{10})+$').hasMatch(value)) {
                              return 'Enter a valid Mobile number';
                            } else {
                              return null;
                            }
                          },

                          // autofocus: true,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              hintText: 'MOBILE NUMBER',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          // autofocus: true,
                          minLines: 3,
                          maxLines: 3,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'PEST PROBLEM',
                              border: OutlineInputBorder()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 12),
                            child: Text(
                              locationPoint,
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(.65)),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: pickImage,
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 12),
                              child: Text(
                                imagepicker,
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(.65)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                defaulButton(
                    text: 'SUBMIT NOW',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
