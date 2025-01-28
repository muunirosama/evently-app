import 'package:evently_app/core/constants/category_data.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/modules/layout/widgets/btn_NavBar_Item.dart';
import 'package:evently_app/modules/layout/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class homeTap extends StatelessWidget {
  const homeTap({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: ColorPalette.primaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)
            )
          ),
          width: mediaQuery.size.width *1,
          height: mediaQuery.size.height * 0.25,
          child: SafeArea(
            child: DefaultTabController(
              length: 10,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Column(
                        children: [
                          Text("Welcome back",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                          ),
                          Text("Munir",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      SvgPicture.asset(
                          "assets/icons/Vector.svg",
                      ),
                      CustomElevatedButton(
                          text: "EN",
                          borderRadius: 8,
                          textColor: ColorPalette.primaryColor,
                          bgColor: Colors.white,
                        onTap:(){},
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8,),
                      Text("Cairo, Egypt",
                      style: TextStyle(
                        color: ColorPalette.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(height: 16,),
                  const TabBar(
                    tabAlignment: TabAlignment.start,
                    indicatorColor: Colors.transparent,
                    dividerColor: Colors.transparent,
                    isScrollable: true,
                      tabs:[
                        Tab(
                          child:tapbarItem(
                            text:"all",
                            icon: Icons.compass_calibration,
                            isSelected: true,
                          ),
                        ),
                        Tab(
                          child:tapbarItem(
                            text:"all",
                            icon: Icons.compass_calibration,
                            isSelected: false,
                          ),
                        ),
                        Tab(
                          child:tapbarItem(
                            text:"all",
                            icon: Icons.compass_calibration,
                            isSelected: false,
                          ),
                        ),
                        Tab(
                          child:tapbarItem(
                            text:"all",
                            icon: Icons.compass_calibration,
                            isSelected: false,
                          ),
                        ),
                        Tab(
                          child:tapbarItem(
                            text:"all",
                            icon: Icons.compass_calibration,
                            isSelected: false,
                          ),
                        ),
                  ]
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 1),
        Expanded(
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return CategoryCard();
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 16,);
            },
          ),
        )
      ],
    );

  }
}
