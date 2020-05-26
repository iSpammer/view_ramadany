import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viewramadany/API/api.dart';
import 'package:viewramadany/API/auth.dart';
import 'package:viewramadany/Utils/button.dart';
import 'package:viewramadany/Utils/modal_progress_hud.dart';

import 'HomePage.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name, email, confirmPassword, password;
  final _formKey = new GlobalKey<FormState>();
  bool _showSpinner = false;
  bool _secureText = true;
  String _errorMessage;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  registerToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _showSpinner,
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
//            color: Colors.grey.withAlpha(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      _buildBody(),
                      Padding(
                        padding: EdgeInsets.all(14.0),
                      ),
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

  Widget _buildBody() {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final nameField = TextFormField(
      validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
      onSaved: (value) => this.name = value.trim(),
      maxLines: 1,
      keyboardType: TextInputType.text,
      autofocus: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailField = TextFormField(
      validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
      onSaved: (value) => this.email = value.trim(),
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => this.password = value.trim(),
      maxLines: 1,
      obscureText: true,
      autofocus: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final confirmPasswordField = TextField(
      onChanged: (password) => this.confirmPassword = password,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final registerButton = Button(
      text: "Register",
      fn: validateAndSubmit,
    );
    return Center(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: SizedBox(
                    height: 155.0,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 45.0),
                nameField,
                SizedBox(height: 25.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(height: 25.0),
                confirmPasswordField,
                SizedBox(
                  height: 35.0,
                ),
                Hero(tag: "register", child: registerButton),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Check if form is valid before perform login or signup
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<String> signUp(String email, String password) async {
    AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _showSpinner = true;
    });
    if (validateAndSave()) {
      String userId = "";
      try {
        userId = await signUp(this.email, this.password);
        //widget.auth.sendEmailVerification();
        //_showVerifyEmailSentDialog();
        print('Signed up user: $userId');

        setState(() {
          _showSpinner = false;
        });
        registerToast("Registered Successfully Please LogIn");
        Navigator.of(context).pop();
      } catch (e) {
        print('Error: $e');
        setState(() {
          _showSpinner = false;
          _formKey.currentState.reset();
        });
      }
    }
  }
}
