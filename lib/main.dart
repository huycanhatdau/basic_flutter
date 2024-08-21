import 'package:basic/import.dart';
import 'package:basic/router.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_theme.dart';
import 'factories.dart';

void main() async {
  factoriesInit();
  runApp(const CloneApp());
}

class CloneApp extends StatelessWidget {
  const CloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      title: 'Clone App Clb',
      theme: AppTheme.lightTheme,
      initialRoute: '/initStart',
      getPages: routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'),
      ],
      locale: const Locale('vi', 'VN'),
    );
  }
}
