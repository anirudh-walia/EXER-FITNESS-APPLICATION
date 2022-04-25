import 'package:flutter/material.dart';
import 'package:flutter_app_learning/screens/authenticate/register.dart';
import 'package:flutter_app_learning/screens/authenticate/sign_in.dart';
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView(){
    if(!mounted) return;// basically toggles the state.
    setState(() => showSignIn = !showSignIn);
  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    } else {
        return Register(toggleView: toggleView);
    }
  }
}
