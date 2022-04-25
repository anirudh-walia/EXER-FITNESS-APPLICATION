import 'package:flutter/material.dart';
import 'package:flutter_app_learning/models/user.dart';
import 'package:flutter_app_learning/models/userss.dart';
import 'package:flutter_app_learning/services/database.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final Userss user;
  UserTile({this.user});
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child:Card(
              child:Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        // child: Expanded(
                        //   child:Image.asset("assets/images/shape_of_you.png"),
                        //   flex:2 ,
                        // ),
                      ),
                    ),
                    Expanded(
                      child:Container(
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 5,
                              child: ListTile(
                                title: Text("Shape Of You"),
                                subtitle: Text("Ed Sheeran"),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    child:Text("PLAY"),
                                    onPressed: ()
                                    {},
                                  ),
                                  SizedBox(width: 8,),
                                  TextButton(
                                    child: Text("ADD TO QUEUE"),
                                    onPressed: (){},
                                  ),
                                  SizedBox(width: 8,)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      flex:8 ,
                    ),
                  ],
                ),
              ),
              elevation: 8,
              margin: EdgeInsets.all(10),
            ),
          ),
        );
      }
    );
  }
}
