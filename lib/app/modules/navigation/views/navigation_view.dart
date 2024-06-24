import 'package:cosplay_rental/app/modules/favorite/views/favorite_view.dart';
import 'package:cosplay_rental/app/modules/home/controllers/home_controller.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../sewa/views/sewa_view.dart';
import '../controllers/navigation_controller.dart';

class NavigationView extends GetView<NavigationController> {
  NavigationView({Key? key}) : super(key: key);
  DateTime? currentBackPressTime;
  final NavigationController nav = Get.put(NavigationController());
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationController>(
      builder: (_) {
        return Scaffold(
          body: Center(
            child: IndexedStack(
              index: nav.selectedIndex.value,
              children: [
                HomeView(),
                SewaView(),
                FavoriteView(),
                ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: FlashyTabBar(
            animationCurve: Curves.linear,
            selectedIndex: controller.selectedIndex.value,
            iconSize: 30,
            showElevation: false,
            onItemSelected: (index) => nav.changeTab(index),
            items: [
              FlashyTabBarItem(
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                icon: Icon(Icons.home_filled),
                title: Text('Home'),
              ),
              FlashyTabBarItem(
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                icon: Icon(Icons.shopping_bag),
                title: Text('Sewa'),
              ),
              FlashyTabBarItem(
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                icon: Icon(Icons.favorite),
                title: Text('Favorite'),
              ),
              FlashyTabBarItem(
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                icon: Icon(Icons.person_2_sharp),
                title: Text('Profile'),
              ),
            ],
          ),
        );
      },
    );
  }
}
