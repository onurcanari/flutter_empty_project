import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:skeleton_project/themes/theme.dart';

enum ThemeType { Light, Dark }

class ThemeModel extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeType themeType;
  
  changeTheme() async {
    var themeBox = Hive.box('themeBox');
    if (themeType == ThemeType.Dark) {
      currentTheme = lightTheme;
      themeType = ThemeType.Light;
      await themeBox.put('isLight', true);
    } else if (themeType == ThemeType.Light) {
      currentTheme = darkTheme;
      themeType = ThemeType.Dark;
      await themeBox.put('isLight', false);
    }
    notifyListeners();
  }

  getTheme() async {
    var box = await Hive.openBox('themeBox');
    var isLight = box.get('isLight') ?? true;
    currentTheme = isLight ? lightTheme : darkTheme;
    themeType = isLight ? ThemeType.Light : ThemeType.Dark;
    return true;
  }
}
