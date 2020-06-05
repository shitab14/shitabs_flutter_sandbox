import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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




}