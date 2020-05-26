import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:viewramadany/API/api.dart';
import 'package:viewramadany/API/auth.dart';
import 'package:viewramadany/Utils/States.dart';
import 'package:viewramadany/Utils/button.dart';
import 'package:viewramadany/Utils/modal_progress_hud.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showSpinner = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
  final _formKey = new GlobalKey<FormState>();
  String _userId = "";

  bool _secureText = true;
  String _errorMessage;

  bool _isLoginForm;

  void resetForm() {
    _formKey.currentState.reset();
    _errorMessage = "";
  }

  void toggleFormMode() {
    resetForm();
    setState(() {
      _isLoginForm = !_isLoginForm;
    });
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

  // Perform login or signup
  void validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _showSpinner = true;
    });
    if (validateAndSave()) {
      try {
        _userId = await signIn(this.email, this.password);
        print('Signed in: $_userId');

        setState(() {
          _showSpinner = false;
        });

        loginToast("Logged In Successfully");

        if (_userId.length > 0 && _userId != null) {
          loginCallback();
        }
        Navigator.of(context).push(CupertinoPageRoute<void>(
          builder: (BuildContext context) => HomePage(
            userId: _userId,
          ),
        ));
      } catch (e) {
        print('Error: $e');
        setState(() {
          _showSpinner = false;
          _formKey.currentState.reset();
        });
      }
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  void loginCallback() {
    getCurrentUser().then((user) {
      setState(() {
        _userId = user.uid.toString();
      });
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
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
        break;
      case LoginStatus.signIn:
        return HomePage();
//        return ProfilePage(signOut);
        break;
    }
  }

  Widget _buildBody() {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

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

    final loginButton = Button(
      text: "Login",
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
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                Hero(tag: "register", child: loginButton),
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

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  loginToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  Future<String> signIn(String email, String password) async {
    AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = result.user;
    return user.uid;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
