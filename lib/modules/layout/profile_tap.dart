import 'dart:developer';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:evently_app/core/extensions/Padding.dart';
import 'package:evently_app/modules/layout/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/themes/color_pallete.dart';


class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    var theme= Theme.of(context);
    var provider=Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: mediaQuery.size.height * 0.25,
            width: double.infinity,
            padding: EdgeInsets.only(top: 60, bottom: 20, left: 20,right: 20),
            decoration: BoxDecoration(
                color: ColorPalette.primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(64),
                )
            ),
            child: Row(
              children: [
                Container(
                  height: 124,
                  width: 124,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorPalette.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(1000),
                      bottomRight: Radius.circular(1000),
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(1000),
                    )
                  ),
                  child: Image.asset("assets/images/rot logo.png"),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Munir Osama",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: ColorPalette.white,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      Text("munir.osama.@gmail.com",
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: ColorPalette.white,
                        fontWeight: FontWeight.bold
                      ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 16,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Language",
                style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8,),
              CustomDropdown<String>(
                hintText: provider.currentLanguage == "en"? "ُEnglish" : "عربي",
                items: provider.LanguageList,
                onChanged: (value) {
                  if(value =="English") provider.setCurrentLanguage("en");
                  if(value !="English") provider.setCurrentLanguage("ar");
                },
                decoration: CustomDropdownDecoration(
                    closedBorder: Border.all(
                        color: ColorPalette.primaryColor,
                      width: 2
                    ),
                  closedBorderRadius: BorderRadius.circular(18),
                  closedSuffixIcon: Icon(Icons.arrow_drop_down_rounded,
                  size: 28,
                    color: ColorPalette.primaryColor,
                  )
                ),
              ),
              SizedBox(height: 16,),
              Text("Theme",
                style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 8,),
              CustomDropdown<String>(
                hintText: provider.isDark()?"Dark": "light",
                items: provider.ThemeList,
                onChanged: (value) {
                  if(value =="Dark") provider.setCurrentTheme(ThemeMode.dark);
                  if(value !="Dark") provider.setCurrentTheme(ThemeMode.light);
                },
                decoration: CustomDropdownDecoration(
                  closedBorder: Border.all(
                    color: ColorPalette.primaryColor,
                    width: 2
                  ),
                    closedBorderRadius: BorderRadius.circular(18),
                    closedSuffixIcon: Icon(Icons.arrow_drop_down_rounded,
                      size: 28,
                      color: ColorPalette.primaryColor,
                    )
                ),
              ),
            ],
          ).setHorizontalPadding(context,0.035)
        ],
      ),
    );
  }
}


