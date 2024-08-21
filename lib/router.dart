import 'package:basic/pages/home/page.dart';
import 'package:basic/pages/profile/page.dart';
import 'package:basic/pages/start/page.dart';
import 'package:basic/router_constants.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

final routes = [
  GetPage(
    name: RouterConstants.root,
    page: () => const StartPage(),
  ),
  GetPage(
    name: RouterConstants.home,
    page: () => const HomePage(),
  ),
  GetPage(
    name: RouterConstants.profile,
    page: () => const ProfilePage(),
  ),
];
