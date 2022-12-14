import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LevelController extends GetxController{

  List<String> levelList = ['','easy', 'medium', 'hard'];

  List<Color?> colorList = [Colors.blue, Colors.yellow, Colors.orange ];

  String difficultyName = 'easy';

  double difficultyNum = 1;

  String getLevel(int number) {
    String levelName = levelList[difficultyNum.toInt()];
    difficultyName = levelName;
    // update();
    return levelName;
  }

  void changeLevel (double level) {
    difficultyNum = level;
    update();
    // print(difficultyNum);
  }

}