import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_app_learning/models/user.dart';
import 'package:flutter_app_learning/models/userss.dart';
import 'package:flutter_app_learning/screens/home/undofyfeature.dart';
import 'package:flutter_app_learning/services/database.dart';
import 'package:flutter_app_learning/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_learning/screens/home/user_tile.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    void _showundofeature() {
      showModalBottomSheet(
        backgroundColor: Colors.lime[100],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),
          context: context,
          builder: (context){
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
              child: UndofyFeature(),
            );
          });
    }


    final usersdata = Provider.of<List<Userss>>(context) ?? [];
    usersdata.forEach((userss) {
      // print(userss.name);
      // print(userss.gender);
      // print(userss.age);
      // // print(userss.height);
      // print(userss.weight);
    });
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            UserData userData = snapshot.data;
            int _userage = userData.age;
            int _userweight = userData.weight;
            int _userheight_f = userData.height_feet;
            int _userheight_i = userData.height_inches;
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Card(
                      margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/bggg.jpg'),
                                fit: BoxFit.cover,
                              )),
                          height: 400,
                          // color: Colors.white,
                          child: Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  // child: Expanded(
                                  //   child:Image.asset("assets/images/shape_of_you.png"),
                                  //   flex:2 ,
                                  // ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // alignment: Alignment.topLeft,
                                  child: Column(
                                    textDirection: TextDirection.ltr,
                                    children: [
                                      Expanded(
                                        flex: 10,
                                        child: Column(
                                          children: <Widget>[
                                            ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon( // <-- Icon
                                                Icons.person,
                                                size: 24.0,
                                              ),
                                              label: Text(userData.name), // <-- Text
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon( // <-- Icon
                                                Icons.flag_outlined,
                                                size: 24.0,
                                              ),
                                              label: Text(userData.gender), // <-- Text
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon( // <-- Icon
                                                Icons.timeline,
                                                size: 24.0,
                                              ),
                                              label: Text('Age $_userage'), // <-- Text
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon( // <-- Icon
                                                Icons.accessibility_new_outlined,
                                                size: 24.0,
                                              ),
                                              label: Text('Weight $_userweight kg'), // <-- Text
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () {},
                                              icon: Icon( // <-- Icon
                                                Icons.height_outlined,
                                                size: 24.0,
                                              ),
                                              label: Text('Height $_userheight_f ft $_userheight_i in'), // <-- Text
                                            ),
                                          ],
                                        ),

                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox.fromSize(
                                              size: Size(56, 56),
                                              child: ClipOval(
                                                child: Material(
                                                  color: Colors.green,
                                                  child: InkWell(
                                                    splashColor: Colors.greenAccent,
                                                    onTap: () => _showundofeature(),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Icon(Icons.undo_rounded), // <-- Icon
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              'UNDOFY',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.indigo,
                                              ),

                                            ),
                                            SizedBox(width: 8,)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                flex: 8,
                              ),
                            ],
                          ),
                        ),
                        elevation: 8,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
              SizedBox(width: 8,),
              ],

            );
          } else {
            return Loading();
          }
        }
    );
  }
}

