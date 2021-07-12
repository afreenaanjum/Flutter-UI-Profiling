import 'package:flutter/material.dart';

String getImage(int index) {
  switch (index % 5) {
    case 0:
      return "user_1.jpeg";
      break;
    case 1:
      return "user_2.jpeg";
      break;
    case 2:
      return "user_3.jpeg";
      break;
    case 3:
      return "user_4.jpeg";
      break;
    case 4:
      return "user_5.jpeg";
      break;
  }
  return "";
}

String getUserName(int index) {
  switch (index % 5) {
    case 0:
      return "Isabella Hudson";
      break;
    case 1:
      return "Marc Oliver";
      break;
    case 2:
      return "Noah Maverick";
      break;
    case 3:
      return "James Smith";
      break;
    case 4:
      return "Emma Mateo";
      break;
  }
  return "";
}

AnimationController initialiseController(Duration duration, var that) {
  return AnimationController(
    duration: duration,
    vsync: that,
  )..forward();
}

Animation<Offset> setAnimation(AnimationController controller) {
  return Tween<Offset>(
    begin: const Offset(1.5, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  ));
}
