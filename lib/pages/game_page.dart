import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizly_app/providers/game_page_provider.dart';

class GamePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  final String difficultyLevel;

  //Injected the provider here:
  GamePageProvider? _gameProvider;

  GamePage({required this.difficultyLevel});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (_context) => GamePageProvider(context: context, difficultyLevel: difficultyLevel),
      child: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Builder(
      builder: (_context) {
        _gameProvider = _context.watch<GamePageProvider>();
        if (_gameProvider!.questions != null) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: _deviceHeight * 0.05,
                ),
                child: _gameUI(),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      },
    );
  }

  Widget _gameUI() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _questionText(),
        Column(
          children: [
            _trueButton(),
            const SizedBox(height: 20),
            _falseButton(),
          ],
        ),
      ],
    );
  }

  Widget _questionText() {
    return Container(
      height: _deviceHeight * 0.5,
      width: _deviceWidth * 0.8,
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            _gameProvider!.getCurrentQuestionText(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _trueButton() {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onPressed: () {
        _gameProvider?.answerQuestion("True");
      },
      color: Colors.green,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "True",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _falseButton() {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onPressed: () {
        _gameProvider?.answerQuestion("False");
      },
      color: Colors.red,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "False",
        style: TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
    );
  }
}
