import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_learning/models/userss.dart';
import 'package:flutter_app_learning/screens/home/settings_form.dart';
import 'package:flutter_app_learning/services/auth.dart';
import 'package:flutter_app_learning/services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_learning/screens/home/user_list.dart ';
class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blueGrey[100],
            title: const Text(
                'LOG OUT',
              style: TextStyle(
                // fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.indigoAccent,
              ),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Hey User!!'),
                  Text('Do you want to Log Out?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Yes'),
                onPressed: () {
                  _auth.signOut();
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    void _showSettingsPanel(){
      showModalBottomSheet(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.green[100],
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Userss>>.value(
      value: DatabaseService().usersdata,
      child: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          title: Text(
              'UNDOFY HOME',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
            ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.blue[100],
          actions: <Widget>[
            SizedBox(
              width: 40.0,
              height: 80.0,
              child: FlatButton(
                  child : Icon(Icons.login_outlined),
                  onPressed: () async {
                    // await _auth.signOut();
                    _showMyDialog();
                  },
              ),
            ),
            SizedBox(
              width: 50.0,
              height: 80.0,
              child: FlatButton(
                  onPressed: () => _showSettingsPanel(),
                  child : Icon(Icons.settings),
              ),
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/backk2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
              child: UserList(),
          ),
        ),
      ),
    );
  }
}
