import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizly_app/providers/game_page_provider.dart';
import 'game_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late double _deviceHeight, _deviceWidth;
  double level = 1;

  final List<String> _difficultyTexts = ['easy', 'medium', 'hard'];

  //Injected the provider here:
  // GamePageProvider? _gameProvider;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return welcomePageUI();
  }

  Widget welcomePageUI() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: _deviceHeight * 0.05,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    logo(),
                    const SizedBox(height: 15),
                    difficultyLevel(),
                  ],
                ),
                levelSlider(),
                startButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget logo() {
    return const Text(
      "Frivia",
      style: TextStyle(
        fontSize: 60,
        color: Colors.white,
      ),
    );
  }

  Widget difficultyLevel() {
    return Text(
      _difficultyTexts[level.toInt() - 1],
      style: TextStyle(
        fontSize: 40,
        color: Colors.white,
      ),
    );
  }

  Widget levelSlider() {
    return Slider(
      min: 1,
      max: 3,
      value: level,
      onChanged: (newValue) {
        setState(
          () {
            level = newValue;
          },
        );
      },
      divisions: 2,
      label: _difficultyTexts[level.toInt() - 1],
    );
  }

  Widget startButton() {
    return MaterialButton(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      onPressed: () {
        //Start the game here:
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return GamePage(difficultyLevel: _difficultyTexts[level.toInt() - 1]);
            },
          ),
        );
      },
      color: Colors.blue,
      minWidth: _deviceWidth * 0.80,
      height: _deviceHeight * 0.10,
      child: const Text(
        "Start",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
      ),
    );
  }
}
