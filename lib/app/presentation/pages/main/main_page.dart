import 'package:flutter/material.dart';
import 'package:flutter_weatherapp/app/presentation/pages/home/home_page.dart';
import 'package:flutter_weatherapp/app/presentation/pages/main/main_controller.dart';

import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  final List<Widget> _screens = [HomePage(), HomePage()];

  void _onItemTapped(int index) {
    controller.bottomSelectedIndex.value = index;
  }

  @override
  Widget build(BuildContext context) {
    final items = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        )
      ],
      currentIndex: controller.bottomSelectedIndex.value,
      selectedItemColor: Colors.red,
      onTap: _onItemTapped,
    );

    return Obx(() => Scaffold(
          body: _screens.elementAt(controller.bottomSelectedIndex.value),
          bottomNavigationBar: items,
        ));
  }
}
