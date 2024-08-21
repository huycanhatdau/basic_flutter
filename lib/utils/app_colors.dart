import 'package:basic/import.dart';

class AppColors {
  // private constructor
  AppColors._privateConstructor();

  // static instance
  static final AppColors _instance = AppColors._privateConstructor();

  // factory constructor let process instance
  factory AppColors() {
    return _instance;
  }

  // define the colors
  static  const Color primaryColor = Color(0xba064681);
  static  const Color secondaryColor = Color(0xff2f2e2e);

  static const Color error = Color(0xffD92D20);
  static const Color success = Color(0xff039855);
  static const Color warning = Color(0xffFFAB27);
  static const Color waiting = Color(0xff0098C3);

  static const Color grey30 = Color(0xffF2F4F7);
  static const Color grey50 = Color(0xffD0D5DD);
  static const Color grey90 = Color(0xff98A2B3);
}