import 'package:flutter/material.dart';
import 'package:flutter_app_learning/models/user.dart';
import 'package:flutter_app_learning/services/database.dart';
import 'package:flutter_app_learning/shared/constants.dart';
import 'package:flutter_app_learning/screens/authenticate/register.dart';
import 'package:flutter_app_learning/shared/loading.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formKey = GlobalKey<FormState>();
  final List<int> ages = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149];
  final List<String> Gender = ['FEMALE', 'MALE', 'OTHER','XX'];
  String _currentName;
  int _currentAge;
  String _currentGen;
  int _currentWeight;
  int _currentFeet;
  int _currentInches;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        if(snapshot.hasData) {
          UserData userData = snapshot.data;
          return Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Text(
                  'Update Your Brew Settings',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userData.name,
                  decoration: textInputDecoration,
                  validator: (val) =>
                  val.isEmpty
                      ? 'Please Enter a Name'
                      : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),

                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentGen ?? userData.gender,
                  items: Gender.map((gen) {
                    return DropdownMenuItem(
                      value: gen,
                      child: Text('$gen'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentGen = val),
                ),

                SizedBox(height: 20.0),
                DropdownButtonFormField(
                  decoration: textInputDecoration,
                  value: _currentAge ?? userData.age,
                  items: ages.map((agee) {
                    return DropdownMenuItem(
                      value: agee,
                      child: Text('$agee years'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentAge = val),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Update Your Weight',
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
                Slider(
                  min: 0,
                  max: 200,
                  divisions: 200,
                  onChanged: (val) =>
                      setState(() => _currentWeight = val.round()),
                  value: (_currentWeight ?? userData.weight).toDouble(),
                  label: "$_currentWeight Kg",
                ),
                SizedBox(height: 20.0),
                Text(
                  'Update Your Height',
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.center,
                ),
                Slider(
                  min: 0,
                  max: 7,
                  divisions: 6,
                  onChanged: (val) =>
                      setState(() => _currentFeet = val.round()),
                  value: (_currentFeet ?? userData.height_feet).toDouble(),
                  label: "$_currentFeet ft",
                ),
                Slider(
                  min: 0,
                  max: 11,
                  divisions: 11,
                  onChanged: (val) =>
                      setState(() => _currentInches = val.round()),
                  value: (_currentInches ?? userData.height_inches).toDouble(),
                  label: "$_currentInches in",
                ),
                RaisedButton(
                    color: Colors.lightBlueAccent[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if(_formKey.currentState.validate()){
                        await DatabaseService(uid: user.uid).updateUserData
                          (_currentName ?? userData.name,
                            _currentGen ?? userData.gender,
                            _currentAge ?? userData.age,
                            _currentFeet ?? userData.height_feet,
                            _currentInches ?? userData.height_inches,
                            _currentWeight ?? userData.weight,);
                        Navigator.pop(context);
                      }
                    }
                ),
              ],
            )
        );
        } else {
          return Loading();
        }
      }
    );
  }
}
