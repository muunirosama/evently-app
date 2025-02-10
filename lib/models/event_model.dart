import 'dart:convert';

import 'package:flutter/material.dart';

class EventDataModel{
  static const String collectionName = "EventDataCollection";
  String id;
   String eventTitle;
   String eventDescription;
   String eventCategory;
   String eventImage;
  DateTime eventDate;

   bool isFavourite;

  EventDataModel({
      this.id = "",
      required this.eventTitle,
      required this.eventDescription,
      required this.eventCategory,
      required this.eventImage,
      required this.eventDate,
      this.isFavourite= false,
  });

  // json to object
  factory EventDataModel.fromFireStore(Map<String,dynamic>json)=> EventDataModel(
  id: json["id"],
  eventTitle: json["eventTitle"],
    eventDescription: json["eventDescription"],
  eventCategory: json["eventCategory"],
  eventImage: json["eventImage"],
  eventDate: json["eventDate"],
  isFavourite: json["isFavourite"],

  );

  //object to json
  Map<String,dynamic> toFireStore(){
    return{
      "eventId": id,
      "eventTitle":eventTitle,
      "eventDescription":eventDescription,
      "eventCategory": eventCategory,
      "eventImage": eventImage,
      "eventDate": eventDate,
      "isFavourite": isFavourite
    };
  }
}