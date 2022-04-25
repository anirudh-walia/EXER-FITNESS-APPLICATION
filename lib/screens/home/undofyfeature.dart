import 'package:flutter/material.dart';
import 'package:flutter_app_learning/models/user.dart';
import 'package:flutter_app_learning/services/database.dart';
import 'package:flutter_app_learning/shared/constants.dart';
import 'package:flutter_app_learning/screens/authenticate/register.dart';
import 'package:flutter_app_learning/shared/loading.dart';
import 'package:provider/provider.dart';

class UndofyFeature extends StatefulWidget {
  @override
  State<UndofyFeature> createState() => _UndofyFeatureState();
}

class _UndofyFeatureState extends State<UndofyFeature> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Search the food item');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lime[100],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: customSearchBar,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (customIcon.icon == Icons.search) {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                    leading: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 28,
                    ),
                    title: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search what you had...',
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  );
                }  else {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('Search the food item');
                }
              });
            },
            icon: customIcon,
          )
        ],
        centerTitle: true,
      ),
    );
  }
}
