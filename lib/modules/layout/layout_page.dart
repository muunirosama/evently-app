import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:evently_app/modules/layout/favourites_tap.dart';
import 'package:evently_app/modules/layout/home_tap.dart';
import 'package:evently_app/modules/layout/map_tap.dart';
import 'package:evently_app/modules/layout/profile_tap.dart';
import 'package:flutter/material.dart';

import '../../core/routes/pages_routes_name.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LayoutPage extends StatefulWidget {
  const LayoutPage({super.key});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {

  int selectedIndex=0;
  List<Widget> taps =[
    const HomeTap(),
    MapView(),
    SizedBox.shrink(),
    FavoritesView(),
    ProfileTap(),
  ];
  @override
  Widget build(BuildContext context) {
    var locale= AppLocalizations.of(context)!;
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
        onPressed: () {
    Navigator.pushNamed(context,
    PagesRouteName.createEvent
    );
    },

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
        items: [
          BottomNavigationBarItem(
              icon: const Icon (Icons.home_outlined),
            activeIcon: const Icon (Icons.home),
            label: locale.home
          ),
           BottomNavigationBarItem(
              icon: Icon (Icons.location_on_outlined),
              activeIcon: Icon (Icons.location_on),
              label: locale.map
          ),
          const BottomNavigationBarItem(
              icon: Icon (Icons.location_on_outlined),
              activeIcon: SizedBox.shrink(),
              label: ""
          ),
           BottomNavigationBarItem(
              icon: Icon (Icons.favorite_border_outlined),
              activeIcon: Icon (Icons.favorite),
              label: locale.favourites
          ),
           BottomNavigationBarItem(
              icon: Icon (Icons.person_outline_rounded),
              activeIcon: Icon (Icons.person),
              label: locale.profile
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
