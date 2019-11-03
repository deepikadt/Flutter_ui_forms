import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:flutter_form/model/signup.dart';
import 'package:flutter_form/ui/login.dart';
import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import "./home.dart";

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  static final _formKey = GlobalKey<FormState>();
  final _focusEmail = FocusNode();
  final _focusPhone = FocusNode();
  var userDetail = UserDetail(name: " ", email: "", number: 0);
  File _storedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //This is used to prevent the overflow due to keyboard when writing text on text fields.
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: _signupScreenBody(context),
    );
  }

  Widget _signupScreenBody(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: ClipOval(
                    child: _storedImage == null
                        ? Image.asset("assets/ic_signup_profile_ph.png")
                        : Image.file(
                            _storedImage,
                            fit: BoxFit.cover,
                            width: 90,
                            height: 90,
                          )),
                radius: 45,
              ),
            ),
            onTap: () {
              _openModalBottomSheet(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextFormField(
                        maxLines: 1,
                        cursorColor: const Color(0xff8f57ff),
                        decoration: InputDecoration(
                          labelText: 'Name',
                          contentPadding: const EdgeInsets.only(bottom: 0),
                        ),
                        keyboardType: TextInputType.text,
                        validator: (value) => value.isEmpty
                            ? "Name can not be empty"
                            : (value.length < 3
                                ? "Name should be atleast 3 character long."
                                : null),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          
                          FocusScope.of(context).requestFocus(_focusEmail);
                        },
                        onSaved: (value) {
                          userDetail = UserDetail(
                            name: value,
                            email: userDetail.email,
                            number: userDetail.number,
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          maxLines: 1,
                          cursorColor: const Color(0xff8f57ff),
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            contentPadding: const EdgeInsets.only(bottom: 0),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            return validateEmail(value);
                          },
                          textInputAction: TextInputAction.next,
                          focusNode: _focusEmail,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context).requestFocus(_focusPhone);
                          },
                          onSaved: (value) {
                            userDetail = UserDetail(
                              name: userDetail.name,
                              email: value,
                              number: userDetail.number,
                            );
                          },
                        ),
                      ),
                      TextFormField(
                        maxLines: 1,
                        cursorColor: const Color(0xff8f57ff),
                        decoration: InputDecoration(
                          labelText: 'Mobile Number',
                          contentPadding: const EdgeInsets.only(bottom: 0),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          return validateMobile(value);
                        },
                        textInputAction: TextInputAction.done,
                        focusNode: _focusPhone,
                        onFieldSubmitted: (_) {
                          //submit the form or we can say sign in when the user has pressed done button
                          _submitForm();
                        },
                        onSaved: (value) {
                          userDetail = UserDetail(
                            name: userDetail.name,
                            email: userDetail.email,
                            number: double.parse(value),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SizedBox(
                          width: double.infinity,
                          child: RaisedButton(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              _submitForm();
                            },
                            color: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 50),
          //   child: Row(
          //     children: <Widget>[
          //       Image.asset('assets/ic_facebook.png'),
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 15),
          //         child: Image.asset('assets/ic_instagram.png'),
          //       ),
          //       Image.asset('assets/ic_google.png')
          //     ],
          //     mainAxisSize: MainAxisSize.min,
          //     mainAxisAlignment: MainAxisAlignment.center,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Row(
              children: <Widget>[
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: Padding(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.lightBlue,
                            fontWeight: FontWeight.bold),
                      ),
                      padding: const EdgeInsets.only(left: 2)),
                )
              ],
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),

          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Center(
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              )),
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState.validate())
      _formKey.currentState
          .save(); //when this executes , a call to onSave occur.

    print('${userDetail.email}');
    print('${userDetail.name}');
    print('${userDetail.number}');
  }

  void _openModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  title: new Text(
                    "Please select an option.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new ListTile(
                  leading: Image.asset("assets/ic_camera.png"),
                  title: new Text('Camera'),
                  onTap: _takePicture,
                ),
                new ListTile(
                  leading: Image.asset("assets/ic_gallery.png"),
                  title: new Text('Gallery'),
                  onTap: _chooseFromGallery,
                ),
              ],
            ),
          );
        });
  }

  String validateEmail(String email) {
    const String _emailRule = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    final RegExp emailExp = RegExp(_emailRule);

    if (email.isEmpty) {
      return "Email can not be empty";
    } else if (email.isNotEmpty && !emailExp.hasMatch(email)) {
      return "Please enter valid email address";
    }

    return null;
  }

  String validateMobile(String mobile) {
    if (mobile.isEmpty) {
      return "Mobile number can not be empty";
    } else if ((double.tryParse(mobile) == null) || mobile.length < 6) {
      return "Mobile number should be atleast 6 digits long.";
    } else {
      return null;
    }
  }

  Future<void> _takePicture() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 500,
      maxWidth: 500,
    );

    setState(() {
      _storedImage = image;
    });
  }

  Future<void> _chooseFromGallery() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
    );

    setState(() {
      _storedImage = image;
    });
  }
}
