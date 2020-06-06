import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lamp/lamp.dart';
import 'package:toast/toast.dart';

class UtilClass {

  // -------------- Device -----------------------
  static void setOrientationPortraitUpOnly() {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp]
    );
  }
  static setOrientationPortraitDownOnly() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown]
    );
  }
  static setOrientationLandscapeLeftOnly() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft]
      );
  }
  static setOrientationLandscapeRightOnly() {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeRight]
        );
      }
  static setOrientationLandscapeLeftPortraitUp() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft]
    );
  }
  static setOrientationAllSupported() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]
    );
  }

  static double getScreenHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }

  static double getScreenWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }

  // ------------ Page --------------------
  static void setNotificationBarColorOnly(Color color, Brightness iconBrightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: iconBrightness,
    ));
  }
  static void setNavigationBarColorOnly(Color color, Brightness navBrightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      systemNavigationBarIconBrightness: navBrightness,
    ));
  }
  static void setSystemStyle(Color statusBarColor, Color navigationBarColor, Brightness iconBrightness, Brightness navBrightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: statusBarColor,
      systemNavigationBarColor: navigationBarColor,
      statusBarIconBrightness: iconBrightness,
      systemNavigationBarIconBrightness: navBrightness,
    ));
  }


  static Draggable<Object> wingardiumLeviosa(Object object) {
    return Draggable<Object> (
      data: object,
      child: object,
      childWhenDragging: Container(
        child: null,
      ),
      feedback: object
    );
  }

  //add to dependency to pubspec.yaml
  // lamp: ^0.0.6
  // toast: ^0.1.5
  // add to AndroidManifest.xml file
  //    <uses-permission android:name="android.permission.CAMERA" />
  //    <uses-permission android:name="android.permission.FLASHLIGHT" />
  //    <uses-feature android:name="android.hardware.camera" />
  //    <uses-feature android:name="android.hardware.camera.autofocus" />
  //    <uses-feature android:name="android.hardware.camera.flash" />
  static void lumos(BuildContext context) async {
    try {
      bool hasLamp = await Lamp.hasLamp;
      if(hasLamp) {
            Lamp.turnOn();
            Toast.show("Lumos!", context);
          } else {
            Toast.show("Didn't work", context);
          }
    } catch (e) {
      print(e);
    }
  }
  static void nox(BuildContext context) async {
    try {
      bool hasLamp = await Lamp.hasLamp;
      if(hasLamp) {
        Lamp.turnOff();
        Toast.show("Nox!", context);
      } else {
        Toast.show("Didn't work", context);
      }
    } catch (e) {
      print(e);
    }
  }

  static void printLog(String msg) {
    log(msg);
  }

  static void showToast(String msg, BuildContext context) {
    Toast.show(msg, context);
  }




}