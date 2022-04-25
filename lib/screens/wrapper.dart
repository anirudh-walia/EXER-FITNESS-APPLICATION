import 'package:flutter/material.dart';
import 'package:flutter_app_learning/screens/authenticate/authenticate.dart';
import 'package:flutter_app_learning/screens/home/home.dart';
import 'package:flutter_app_learning/models/user.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    //return either home or authenticate.
    if(user==null){
      return Authenticate();
    } else{
      return Home();
    }
  }
}
