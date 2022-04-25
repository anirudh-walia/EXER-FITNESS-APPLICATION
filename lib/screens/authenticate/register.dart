import 'package:flutter/material.dart';
import 'package:flutter_app_learning/services/auth.dart';
import 'package:flutter_app_learning/shared/constants.dart';
import 'package:flutter_app_learning/shared/loading.dart';
String name = '';
class Register extends StatefulWidget {

  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        elevation: 0.0,
        title: Text('Sign Up to "UNDOFY" your life'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.login_sharp),
            label: Text('Sign in'),
            onPressed: () {
              widget.toggleView();
            },
          ),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "NAME"),
                    validator: (val) => val.isEmpty ? "Enter a Name" : null,
                    onChanged: (val){
                      if(!mounted) return;
                      setState(() => name = val);
                    }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Email"),
                    validator: (val) => val.isEmpty ? "Enter an Email" : null,
                    onChanged: (val){
                      if(!mounted) return;
                      setState(() => email = val);
                    }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: "Password"),
                  obscureText: true,
                  validator: (val) => val.length < 6 ? "Enter a password of 6+ characters" : null,
                  onChanged: (val){
                    if(!mounted) return;
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.lightGreen[300],
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white,
                          fontFamily: 'Roboto'),
                    ),
                    onPressed: () async{
                      if(_formKey.currentState.validate()){
                        if(!mounted) return;
                        setState(() => loading = true);
                        dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                        if(result == null){
                          if(!mounted) return;
                          setState(() { error = "Please add a valid email";
                          loading = false;});
                        }
                      }
                    }
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )

              ],
            ),
          )
      ),
    );
  }
}
