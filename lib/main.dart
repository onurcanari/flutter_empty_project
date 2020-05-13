import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_project/models/theme_model.dart';
import 'package:skeleton_project/service_locator.dart';
import 'router_service/router.dart';
import 'router_service/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await setupLocator();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeModel>(
          create: (_) => ThemeModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: sl<ThemeModel>(),
      child:
          Consumer<ThemeModel>(builder: (context, ThemeModel themeModel, ___) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          /* title: 'Flutter Demo', */
          theme: themeModel.currentTheme,
          onGenerateRoute: Router.generateRoute,
          initialRoute: Routes.homePage,
        );
      }),
    );
  }
}
