
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'PAGES/Favorite/Fav_page.dart';
import 'PAGES/Chat_Page/Chat_page.dart';
import 'PAGES/Home_Page/HomePage.dart';
import 'PAGES/Profile_Page/ProfilePage.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> pages = [
    const Homepage(),
    const Chat_Page(),
    const Fav_Page(),
    const ProfilePage()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],

      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        selectedItemColor: Colors.redAccent.shade700,
        unselectedItemColor: Colors.black54,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: const Icon(Icons.home,weight: 500,),
            title: const Text("Home"),
            selectedColor: Colors.redAccent.shade700,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.chat_bubble_outline),
            activeIcon: const Icon(Icons.chat_bubble,weight: 200,),
            title: const Text("Chat"),
            selectedColor: Colors.redAccent.shade700,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.favorite_border),
            activeIcon: const Icon(Icons.favorite),
            title: const Text("Favorite"),
            selectedColor: Colors.redAccent.shade700,
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person_outline),
            activeIcon: const Icon(Icons.person,),
            title: const Text("Profile"),
            selectedColor: Colors.redAccent.shade700,
          ),
        ],
      ),
    );
  }
}
