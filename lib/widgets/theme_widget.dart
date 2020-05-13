import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_project/models/theme_model.dart';

import '../service_locator.dart';

class ThemeWidget extends StatefulWidget {
  final Widget child;
  const ThemeWidget({Key key, this.child}) : super(key: key);

  @override
  _ThemeWidgetState createState() => _ThemeWidgetState();
}

class _ThemeWidgetState extends State<ThemeWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: sl<ThemeModel>(),
        child: Consumer<ThemeModel>(
            builder: (context, ThemeModel themeModel, ___) {
          print(themeModel.themeType.toString());
          return widget.child;
        }));
  }
}
