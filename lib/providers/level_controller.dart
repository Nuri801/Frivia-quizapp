import 'package:get/get.dart';

class LevelController extends GetxController{

  List<String> levelList = ['','easy', 'medium', 'hard'];

  double difficultyNum = 1;

  String getLevel(int number) {
    String levelName = levelList[difficultyNum.toInt()];
    print(levelName);
    return levelName;
  }

  void changeLevel (double level) {
    difficultyNum = level;
    update();
    // print(difficultyNum);
  }

}