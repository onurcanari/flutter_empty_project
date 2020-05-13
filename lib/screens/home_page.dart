import 'package:flutter/material.dart';
import 'package:skeleton_project/models/theme_model.dart';

import '../service_locator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var themeModel = sl<ThemeModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: IconButton(
              icon: Icon(Icons.track_changes),
              color: themeModel.themeType == ThemeType.Light
                  ? Colors.amber
                  : Colors.blue,
              onPressed: () {
                themeModel.changeTheme();
              }),
        ));
  }
}
