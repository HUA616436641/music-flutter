import 'package:cloud_music/pages/daily_recommond/bindings/daily_rec_bingding.dart';
import 'package:cloud_music/pages/daily_recommond/views/daily_rec_page.dart';
import 'package:cloud_music/pages/home/views/home_page.dart';
import 'package:cloud_music/pages/login/bindings/login_binding.dart';
import 'package:cloud_music/pages/login/views/login_page.dart';
import 'package:cloud_music/pages/player/bindings/player_bingding.dart';
import 'package:cloud_music/pages/player/views/player_page.dart';
import 'package:cloud_music/pages/splash/views/splash.dart';
import 'package:get/get.dart';

import '../pages/home/bindings/home_binding.dart';

part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(name: Routes.SPLASH, page: () => SplashPage(),
        // binding: MainBinding(),
        children: []),
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding(),
        children: []),
    GetPage(
        name: Routes.HOME,
        page: () => HomePage(),
        binding: HomeBinding(),
        children: []),
    GetPage(
      name: Routes.DailyRec,
      page: () => DailyRecPage(),
      binding: DailyRecBinding(),
    ),
    GetPage(
      name: Routes.PLAYER,
      page: () => PlayerPage(),
      binding: PlayerBinding(),
    ),
  ];
}
