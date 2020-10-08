import 'dart:developer';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lamp/lamp.dart';
import 'package:speech_recognition/speech_recognition.dart';
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
  static void setNoNotificationBar() {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

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

  // add to the class
  //  import 'package:http/http.dart' as http;
  //  import 'dart:convert';
  // add to dependency to pubspec.yaml
  //   http: ^0.12.1
  static Future<Object> accio(String api) async {
    http.Response response = await http.get(
        Uri.encodeFull(api),
        headers: {
          "Accept": "application/json"
        }
    );
    print(response.body);
    return response;
  }

  static void printLog(String msg) {
//    log(msg);
  }

  static void showToast(String msg, BuildContext context) {
    Toast.show(msg, context);
  }

  static void swipeDetector() { //todo
    GestureDetector(onPanUpdate: (details) {
      if (details.delta.dx > 0) {
        // swiping in right direction
      }

      if (details.delta.dx < 0) {
        // swiping in left direction
      }
    });
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }


  // add to dependency to pubspec.yaml
  //  speech_recognition: ^0.3.0+1
  // add to AndroidManifest.xml file
  //  <uses-permission android:name="android.permission.RECORD_AUDIO" />
  // add to info.plist
  //  <key>NSMicrophoneUsageDescription</key>
  //  <string>This application needs to access your microphone</string>
  //  <key>NSSpeechRecognitionUsageDescription</key>
  //  <string>This application needs the speech recognition permission</string>





}