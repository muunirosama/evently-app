import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_app/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class FirebaseServices{

 // static Future<bool> createAccount({
  static  createAccount(
    String emailAddress,
     String password,
  )async{
    EasyLoading.show();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
     // SnackBarService.showSuccessMessage("account created successfully");
      return Future.value(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        //SnackBarService.showErrorMessage(
          //  e.message?? "The password provided is too weak.");
        return Future.value(false);

      } else if (e.code == 'email-already-in-use') {
        //SnackBarService.showErrorMessage(
          //  e.message?? "The account already exists for that email.");
        return Future.value(false);

      }
      return Future.value(false);
    } catch (e) {
      print(e);
    }
    }

  //fireStore
  CollectionReference<EventDataModel>getCollectionRef(){
    //getInstance
  return FirebaseFirestore.instance
      .collection(EventDataModel.collectionName)
      .withConverter<EventDataModel>(
        fromFirestore: (snapshot,_)=> EventDataModel.fromFirestore(snapshot.data()!),
        toFirestore: (eventModel, _) => eventModel.toFirestore()
    );
  }

  Future<void>createNewEvent(EventDataModel eventData)async{
    final collectionRef=getCollectionRef();

    var docRef = collectionRef.doc();
    eventData.id= docRef.id;

    return docRef.set(eventData);
  }

  readEvents(){
    final collectionRef = getCollectionRef();
  }
}

