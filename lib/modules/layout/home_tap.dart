import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:evently_app/core/widgets/custom_elevated_button.dart';
import 'package:evently_app/modules/layout/settings_provider.dart';
import 'package:evently_app/modules/layout/widgets/HomeTabWidget.dart';
import 'package:evently_app/modules/layout/widgets/EventCardWidget.dart';
import 'package:evently_app/modules/layout/widgets/category_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/FirebaseFirestoreService.dart';
import '../../models/EventCategory.dart';
import '../../models/event_model.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {

  int selectedTapIndex = 0;
  List<EventCategory> eventCategories = [
    EventCategory(
      eventCategoryName: "Book Club",
      eventCategoryIcon: Icons.menu_book_outlined,
      eventCategoryImg: "assets/images/Frame 69 (1).png",
    ),
    EventCategory(
        eventCategoryName: "Sport",
        eventCategoryIcon: Icons.directions_bike,
        eventCategoryImg: "assets/images/Rectangle 977.png"),
    EventCategory(
        eventCategoryName: "BirthDay",
        eventCategoryIcon: Icons.cake_outlined,
        eventCategoryImg: "assets/images/bdimg.png"),
    EventCategory(
        eventCategoryName: "Meeting",
        eventCategoryIcon: Icons.meeting_room_outlined,
        eventCategoryImg: "assets/images/meeting.png"),
    EventCategory(
        eventCategoryName: "Holiday",
        eventCategoryIcon: Icons.holiday_village_outlined,
        eventCategoryImg: "assets/images/Frame 16 (2).png"),
  ];

  @override
  Widget build(BuildContext context) {

    var mediaQuery= MediaQuery.of(context);
    var provider=Provider.of<SettingsProvider>(context);
    var theme = Theme.of(context);

    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 20,),
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
              )
            ),
            width: mediaQuery.size.width *1,
            height: mediaQuery.size.height * 0.25,
                child: Column(
                  children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Back ✨",
                    style: theme.textTheme.titleSmall
                        ?.copyWith(color: ColorPalette.white),
                  ),
                  Text(
                    "Munir Osama",
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
                        Spacer(),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: (){
                                if (provider.isDark()){
                                  provider.setCurrentTheme(ThemeMode.light);
                                }
                                else{
                                  provider.setCurrentTheme(ThemeMode.dark);
                                }
                              },
                              child: Icon(
                                Icons.wb_sunny_outlined,
                                size: 28,
                                color: ColorPalette.white,
                              ),
                            ),
                            SizedBox(width: 10,),

                            GestureDetector(
                              onTap: (){
                                if(provider.currentLanguage== "en"){
                                  provider.setCurrentLanguage("ar");
                                }
                                if(provider.currentLanguage=="ar") {
                                  provider.setCurrentLanguage("en");
                                };
                              },
                              child: CustomElevatedButton(
                                text: "EN",
                                borderRadius: 8,
                                textColor: ColorPalette.primaryColor,
                                bgColor: Colors.white,
                                onTap:(){},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 6,),

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
                    SizedBox(height: 8,),
          DefaultTabController(
            length: 5,
            child: TabBar(
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                indicatorPadding: EdgeInsets.zero,
                indicatorColor: Colors.transparent,
                labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 0),
                indicator: const BoxDecoration(),
                onTap: (value) {
                  setState(() {
                    selectedTapIndex = value;
                  });
                },
                tabs: eventCategories.map(
                      (element) {
                    return HomeTabWidget(
                      eventCategory: element,
                      isSelected: selectedTapIndex ==
                          eventCategories.indexOf(element),
                    );
                  },
                ).toList()),
          ),
                  ],
                ),
              ),

          SizedBox(height: 16),

          // Expanded(
          //   child: ListView.separated(
          //     padding: EdgeInsets.symmetric(horizontal: 16),
          //     itemCount: 10,
          //     itemBuilder: (context, index) {
          //       return ;
          //
          //     },
          //     separatorBuilder: (context, index) {
          //       return SizedBox(height: 16,);
          //     },
          //   ),
          // ),
          StreamBuilder<QuerySnapshot<EventDataModel>>(
            stream: FirebaseFirestoreService.getStreamData(
              eventCategories[selectedTapIndex].eventCategoryName,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text(
                      "Something went wrong",
                    ),
                    const SizedBox(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.refresh_outlined,
                        color: ColorPalette.primaryColor,
                      ),
                    )
                  ],
                );
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: ColorPalette.primaryColor,
                  ),
                );
              }

              List<EventDataModel> eventDataList = snapshot.data!.docs.map(
                    (element) {
                  return element.data();
                },
              ).toList();

              return eventDataList.isNotEmpty
                  ? ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemBuilder: (context, index) => EventCardWidget(
                  eventDataModel: eventDataList[index],
                ),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: eventDataList.length,
              )
                  : Text(
                "No Event Created Yet..!",
                style: theme.textTheme.titleLarge,
              );
            },
          ),
        ],
      ),
    );

  }
}
