import 'package:get_it/get_it.dart';
import 'package:skeleton_project/models/theme_model.dart';

var sl = GetIt.I;

Future setupLocator() async {
  sl.registerSingleton<ThemeModel>(ThemeModel());
  await sl<ThemeModel>().getTheme();
}
