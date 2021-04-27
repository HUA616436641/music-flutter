import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:cloud_music/pages/home/domain/entity/home_model.dart';
import 'package:cloud_music/pages/home/domain/entity/menu_item.dart';

import '../domain/adapters/repository_adapter.dart';

// ignore: lines_longer_than_80_chars
class HomeController extends SuperController<HomeState>
    with SingleGetTickerProviderMixin {
  HomeController({required this.homeRepository});
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final IHomeRepository homeRepository;
  late TabController _tabController;
  late SwiperController _swiperController;
  SwiperController get swiperController => _swiperController;
  TabController get tabController => _tabController;
  HomeState homeState = HomeState();

  @override
  void onInit() {
    super.onInit();
    // state = HomeState();
    //Loading, Success, Error handle with 1 line of code
    // append(() => state);
    init();
  }

  void init() async {
    _swiperController = SwiperController();
    _tabController = TabController(length: menus.length, vsync: this);
    final banners = await homeRepository.getBanner();
    homeState.banners = banners;
    final songList = await homeRepository.getSongList();
    homeState.banners = banners;
    homeState.songList = songList;
    update(['banner', '']);
    change(homeState, status: RxStatus.success());
  }

  @override
  void onReady() {
    print('The build method is done. '
        'Your controller is ready to call dialogs and snackbars');
    super.onReady();
  }

  @override
  void onClose() {
    print('onClose called');
    super.onClose();
  }

  @override
  void didChangeMetrics() {
    print('the window size did change');
    super.didChangeMetrics();
  }

  @override
  void didChangePlatformBrightness() {
    print('platform change ThemeMode');
    super.didChangePlatformBrightness();
  }

  @override
  Future<bool> didPushRoute(String route) {
    print('the route $route will be open');
    return super.didPushRoute(route);
  }

  @override
  Future<bool> didPopRoute() {
    print('the current route will be closed');
    return super.didPopRoute();
  }

  @override
  void onDetached() {
    print('onDetached called');
  }

  @override
  void onInactive() {
    print('onInative called');
  }

  @override
  void onPaused() {
    print('onPaused called');
  }

  @override
  void onResumed() {
    print('onResumed called');
  }

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  final List<MenuItem> menus = [
    MenuItem(title: '发现', icon: Icons.title),
    MenuItem(title: '播客', icon: Icons.title),
    MenuItem(title: '我的', icon: Icons.title),
    MenuItem(title: 'k歌', icon: Icons.title),
    MenuItem(title: '云村', icon: Icons.title),
  ];
}
