import 'package:flutter/material.dart';

class Constants {
  //Primary color
  static var primaryColor = const Color.fromRGBO(209, 209, 239, 1);
  static var secondaryColor = const Color.fromRGBO(255, 218, 240, 1);
  static var blackColor = Colors.black54;

  //Onboarding texts
  static var titleOne = "Learn more about plants";
  static var descriptionOne =
      "Read how to care for plants in our rich plants guide.";
  static var titleTwo = "Find a plant lover friend";
  static var descriptionTwo =
      "Are you a plant lover? Connect with other plant lovers.";
  static var titleThree = "Plant a tree, green the Earth";
  static var descriptionThree =
      "Find almost all types of plants that you like here.";
}

// constants.dart
String getGreeting() {
  final hour = DateTime.now().hour;

  if (hour < 12) {
    return 'Good Morning';
  } else if (hour < 15) {
    return 'Good Afternoon';
  } else if (hour < 18) {
    return 'Good Evening';
  } else {
    return 'Good Night';
  }
}
