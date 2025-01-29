import 'dart:convert';

import 'package:flutter/material.dart';

class EventDataModel{
  static const String collectionName = "EventDataCollection";
  String id;
  final String eventTitle;
  final String eventDescribtion;
  final String eventCategory;
  final String eventImage;
  final DateTime eventDate;
  final TimeOfDay eventTime;
  final bool isFavourite;

  EventDataModel({
      required this.id,
      required this.eventTitle,
      required this.eventDescribtion,
      required this.eventCategory,
      required this.eventImage,
      required this.eventDate,
      required this.eventTime,
      this.isFavourite= false
  });

  // json to object
  factory EventDataModel.fromFirestore(Map<String,dynamic>json)=> EventDataModel(
  id: json["id"],
  eventTitle: json["eventTitle"],
  eventDescribtion: json["eventDescription"],
  eventCategory: json["eventCategory"],
  eventImage: json["eventImage"],
  eventDate: json["eventDate"],
  eventTime: json["eventTime"],
  isFavourite: json["isFavourite"]
  );

  //object to json
  Map<String,dynamic> toFirestore(){
    return{
      "eventId": id,
      "eventTitle":eventTitle,
      "eventDescribtion":eventDescribtion,
      "eventCategory": eventCategory,
      "eventImage": eventImage,
      "eventDate": eventDate,
      "eventTime": eventTime,
      "isFavourite": isFavourite
    };
  }
}