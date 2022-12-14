import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:quizly_app/providers/level_controller.dart';
import 'package:get/get.dart';

class GamePageProvider extends ChangeNotifier {
  final Dio _dio = Dio();
  final int _maxQuestions = 10;
  List? questions;

  int _currentQuestionCount = 0;
  int _correctAnswers = 0;


  LevelController controller = Get.find();

  BuildContext context;

  // final String difficultyLevel;

  GamePageProvider({required this.context}) {
    _dio.options.baseUrl = 'http://opentdb.com/api.php';
    _getQuestionFromAPI();
  }

  Future<void> _getQuestionFromAPI() async {
    var _response = await _dio.get(
      '',
      queryParameters: {
        // 'category': 10,
        'amount': 10,
        'type': 'boolean',
        'difficulty': controller.getLevel(controller.difficultyNum.toInt()),
      },
    );

    var _data = jsonDecode(
      _response.toString(),
    );

    print(_data);

    questions = _data["results"];

    notifyListeners();
  }

  String getCurrentQuestionText() {
    return questions![_currentQuestionCount]["question"];
  }

  void answerQuestion(String _answer) async {
    bool isCorrect =
        questions![_currentQuestionCount]["correct_answer"] == _answer;
    _currentQuestionCount++;


    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          backgroundColor: isCorrect ? Colors.blue : Colors.blueGrey,
          title: Icon(
            isCorrect ? Icons.check_circle : Icons.cancel_sharp,
            color: Colors.white,
            size: 40,
          ),
          // title:
        );
      },
    );

    await Future.delayed(
      const Duration(milliseconds: 500),
    );

    Navigator.pop(context);

    if (isCorrect == true ) {
      _correctAnswers ++;
    }

    if (_currentQuestionCount == _maxQuestions) {
      endGame();
    } else {
      notifyListeners();
    }
  }

  void endGame() {

    showDialog(

      barrierDismissible: false,
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          actions: [
            MaterialButton(
              elevation: 10,
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                _correctAnswers = 0;
                _currentQuestionCount = 0;
              },
            ),
            MaterialButton(
              child: const Text(
                'Play again',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                Navigator.pop(context);
                _correctAnswers = 0;
                _currentQuestionCount = 0;
                await _getQuestionFromAPI();
              },
            ),
          ],
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              'The End !',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          content: Text(
            "Score: $_correctAnswers / $_maxQuestions",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
    _currentQuestionCount = 0;
  }

}
