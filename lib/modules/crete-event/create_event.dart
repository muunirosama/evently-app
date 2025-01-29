import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/routes/pages_routes_name.dart';
import '../../core/widgets/btn_NavBar_Item.dart';
class CreateEvent extends StatelessWidget {
  const CreateEvent({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    return  SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Create Event",
            style:TextStyle(
              color: ColorPalette.primaryColor
            )
              ),
          ),
        body: SizedBox(
          width:mediaQuery.size.width*1,
          child: DefaultTabController(
            length: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                     borderRadius:BorderRadius.circular(16),
                    child: Image.asset("assets/images/creteevent.png",
                    height: mediaQuery.size.height*0.20,
                      width: mediaQuery.size.width*0.9,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16,),
                  const SizedBox(
                    child: TabBar(
                        tabAlignment: TabAlignment.start,
                        indicatorColor: Colors.transparent,
                        dividerColor: Colors.transparent,
                        isScrollable: true,
                        tabs:[
                          crete_event_tapbarItem(
                              text:"Book club"
                              , isSelected: false
                              , icon: Icons.menu_book_outlined,
                          ),
                          crete_event_tapbarItem(
                            text:"Sport"
                            , isSelected: false
                            , icon: Icons.directions_bike_rounded,
                          ),
                          crete_event_tapbarItem(
                            text:"Birthday"
                            , isSelected: false
                            , icon: Icons.cake,
                          ),
                          crete_event_tapbarItem(
                            text:"Book club"
                            , isSelected: true
                            , icon: Icons.compass_calibration,
                          ),
                          crete_event_tapbarItem(
                            text:"Book club"
                            , isSelected: true
                            , icon: Icons.compass_calibration,
                          ),
                          crete_event_tapbarItem(
                            text:"Book club"
                            , isSelected: true
                            , icon: Icons.compass_calibration,
                          ),
                        ]
                    ),
                  ),
                  SizedBox(height: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title",style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 6,),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Event title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon:const ImageIcon(AssetImage("assets/images/Note_Edit.png")
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Text("Describtion",style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 6,),
                      TextField(
                        decoration: InputDecoration(
                          labelText: "Event describtion",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon:const ImageIcon(AssetImage("assets/images/Note_Edit.png")
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Icon(Icons.calendar_month_rounded),
                          SizedBox(width: 12,),
                          Text("Event date"),
                          Spacer(),
                          GestureDetector(
                              onTap: (){},
                              child:
                          Text("choose date",
                            style: TextStyle(
                                color: ColorPalette.primaryColor,fontWeight: FontWeight.bold),))
                        ],
                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          Icon(Icons.punch_clock_sharp),
                          SizedBox(width: 12,),
                          Text("Event time"),
                          Spacer(),
                          GestureDetector(
                              onTap: (){},
                              child:
                          Text("choose time",style:
                          TextStyle(color: ColorPalette.primaryColor, fontWeight: FontWeight.bold),))
                        ],
                      ),
                      SizedBox(height: 16,),
                      Text("Location",style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                      SizedBox(height: 6,),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border:Border.all(
                            color: ColorPalette.primaryColor
                          )
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: ColorPalette.primaryColor,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              padding: EdgeInsets.all(16),
                              child: Icon(
                                Icons.location_on,
                                color: ColorPalette.white,
                              ),
                            ),
                            SizedBox(width: 12,),
                            Text("Choose event location",
                            style: TextStyle(
                              color: ColorPalette.primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            Spacer(),
                            Icon(Icons.arrow_forward,
                            color: ColorPalette.primaryColor,)
                          ],
                        ),
                      ),
                      SizedBox(height: 16,),

                      Center(
                         child: ElevatedButton(
                            onPressed: () {
                            //  var data= EventDataModel(
                              //     id: id,
                              //     eventTitle: title,
                              //     eventDescription: eventDescription,
                              //     eventCategory: eventCategory,
                              //     eventImage: eventImage,
                              //     eventDate: eventDate,
                              //     eventTime: eventTime
                              // )
                            },
                          style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPalette.primaryColor,
                                             shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                           ),
                               child: Text(
                                     "Add Event",
                                    style: TextStyle(
                                color: Colors.white,
                                  fontSize: 16,
                                  ),
                                 ),
                            ),
                      ),
                    ],
                  ),
                 ]
                  ),
            )
                )
            ),
          ),
        );
  }
}
