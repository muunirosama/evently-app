import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:evently_app/modules/layout/home_tap.dart';
import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int selectedIndex=0;
  List<Widget> taps =[
    homeTap(),
    Scaffold(),
    SizedBox.shrink(),
    Scaffold(),
    Scaffold()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
          side: BorderSide(
            color: ColorPalette.white,
            width: 5
          )
        ),
        backgroundColor: ColorPalette.primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
        size: 30,
        color: ColorPalette.white,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onbtnNavTapped,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.primaryColor,
        selectedItemColor: ColorPalette.white,
        unselectedItemColor: ColorPalette.white,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon (Icons.home_outlined),
            activeIcon: Icon (Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.location_on_outlined),
              activeIcon: Icon (Icons.location_on),
              label: "Map"
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.location_on_outlined),
              activeIcon: SizedBox.shrink(),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.favorite_border_outlined),
              activeIcon: Icon (Icons.favorite),
              label: "Favourites"
          ),
          BottomNavigationBarItem(
              icon: Icon (Icons.person_outline_rounded),
              activeIcon: Icon (Icons.person),
              label: "Profile"
          )
      ],
      ),
      body: taps[selectedIndex],
    );
  }
  onbtnNavTapped(int index){
    selectedIndex=index;
    setState(() {});
  }
}
