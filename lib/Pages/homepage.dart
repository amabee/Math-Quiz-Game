import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:math_game/utils/alertbox.dart';
import 'package:math_game/utils/confetti.dart';
import 'package:math_game/utils/const.dart';
import 'package:math_game/utils/numpad.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> numPad = [
    '7',
    '8',
    '9',
    'C',
    '4',
    '5',
    '6',
    'DEL',
    '1',
    '2',
    '3',
    '=',
    '0',
    '-',
  ];

  String answer = '';
  var random = Random();

  late int firstNum = random.nextInt(10);
  late int secondNum = random.nextInt(10);
  late int thirdNum = 0;

  late int startingQuestioNum = 0;
  late int questionLimitNum = 1;

  String mathQuestion = "";

  int levelStage = 1;
  int maxLevelStage = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startPoint();
  }

  void startPoint() {
    setState(() {
      mathQuestion = "$firstNum + $secondNum = ";
    });
  }

  void customSnackBar(String title, String message, ContentType contentType) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void buttonTapped(String button) {
    setState(() {
      if (button == "=") {
        if (answer.isEmpty) {
          customSnackBar(
              "Uh oh!",
              "Looks like you have an empty answer. Try inputting an answer first before submitting it.",
              ContentType.failure);
        } else {
          answerResult();
        }
      } else if (button == "C") {
        answer = '';
      } else if (button == "DEL") {
        if (answer.isNotEmpty) {
          answer = answer.substring(0, answer.length - 1);
        } else {
          customSnackBar(
              "Bzzzt!",
              "The answer is empty! you can\'t delete empty input",
              ContentType.warning);
        }
      } else if (answer.length < 4) {
        answer += button;
      }
    });
  }

  void answerResult() {
    if (levelStage == 1 || levelStage == 2) {
      if (firstNum + secondNum == int.parse(answer)) {
        MyAlertBox.showCustomDialog(
          onPressed: () {
            nextQuestion();
            Navigator.pop(context);
          },
          buttonMessage: "Next Question",
          context: context,
          customMessage:
              "Well done buddy! you got it right! I knew you would cuz your'e a genius",
          resultMessage: "You got it Right!",
          imageLocation:
              "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
        );
      } else {
        MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Your answer is very wrong my dude!",
          resultMessage: "Wrong Answer",
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          buttonMessage: "Cancel",
          imageLocation:
              "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXFuNzBxZzAybWk0MXN4YXc0OHRna3dmbjA2Z2l5YXc4NnYwM2VubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6vfnV74fKmJK5yoTpt/giphy.gif",
        );
      }
    }
    // Level 3 and 4
    if (levelStage == 3 || levelStage == 4) {
      if (firstNum - secondNum == int.parse(answer)) {
        MyAlertBox.showCustomDialog(
          onPressed: () {
            nextQuestion();
            Navigator.pop(context);
          },
          buttonMessage: "Next Question",
          context: context,
          customMessage:
              "Well done buddy! you got it right! I knew you would cuz your'e a genius",
          resultMessage: "You got it Right!",
          imageLocation:
              "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
        );
      } else {
        MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Your answer is very wrong my dude!",
          resultMessage: "Wrong Answer",
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          buttonMessage: "Cancel",
          imageLocation:
              "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXFuNzBxZzAybWk0MXN4YXc0OHRna3dmbjA2Z2l5YXc4NnYwM2VubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6vfnV74fKmJK5yoTpt/giphy.gif",
        );
      }
    }
    // Level 5 and 6
    if (levelStage == 5 || levelStage == 6) {
      if (firstNum * secondNum == int.parse(answer)) {
        MyAlertBox.showCustomDialog(
          onPressed: () {
            nextQuestion();
            Navigator.pop(context);
          },
          buttonMessage: "Next Question",
          context: context,
          customMessage:
              "Well done buddy! you got it right! I knew you would cuz your'e a genius",
          resultMessage: "You got it Right!",
          imageLocation:
              "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
        );
      } else {
        MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Your answer is very wrong my dude!",
          resultMessage: "Wrong Answer",
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          buttonMessage: "Cancel",
          imageLocation:
              "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXFuNzBxZzAybWk0MXN4YXc0OHRna3dmbjA2Z2l5YXc4NnYwM2VubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6vfnV74fKmJK5yoTpt/giphy.gif",
        );
      }
    }
    // LEVEL 7 and 8
    if (levelStage == 7 || levelStage == 8) {
      double result = firstNum / secondNum;
      int parsedAnswer = int.parse(answer);

      if (result == parsedAnswer && result % 1 == 0) {
        MyAlertBox.showCustomDialog(
          onPressed: () {
            nextQuestion();
            Navigator.pop(context);
          },
          buttonMessage: "Next Question",
          context: context,
          customMessage:
              "Well done buddy! you got it right! I knew you would cuz you're a genius",
          resultMessage: "You got it Right!",
          imageLocation:
              "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
        );
      } else {
        MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Your answer is very wrong my dude!",
          resultMessage: "Wrong Answer",
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          buttonMessage: "Cancel",
          imageLocation:
              "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXFuNzBxZzAybWk0MXN4YXc0OHRna3dmbjA2Z2l5YXc4NnYwM2VubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6vfnV74fKmJK5yoTpt/giphy.gif",
        );
      }
    }

    if (levelStage == 9) {
      print(firstNum + secondNum - thirdNum);
      if (firstNum + secondNum - thirdNum == int.parse(answer)) {
        MyAlertBox.showCustomDialog(
          onPressed: () {
            nextQuestion();
            Navigator.pop(context);
          },
          buttonMessage: "Next Question",
          context: context,
          customMessage:
              "Well done buddy! you got it right! I knew you would cuz your'e a genius",
          resultMessage: "You got it Right!",
          imageLocation:
              "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
        );
      } else {
        MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Your answer is very wrong my dude!",
          resultMessage: "Wrong Answer",
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          buttonMessage: "Cancel",
          imageLocation:
              "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXFuNzBxZzAybWk0MXN4YXc0OHRna3dmbjA2Z2l5YXc4NnYwM2VubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6vfnV74fKmJK5yoTpt/giphy.gif",
        );
      }
    }
    if (levelStage == 10) {
      if (firstNum - secondNum + thirdNum == int.parse(answer)) {
        MyAlertBox.showCustomDialog(
          onPressed: () {
            nextQuestion();
            Navigator.pop(context);
          },
          buttonMessage: "Next Question",
          context: context,
          customMessage:
              "Well done buddy! you got it right! I knew you would cuz your'e a genius",
          resultMessage: "You got it Right!",
          imageLocation:
              "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
        );
      } else {
        MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Your answer is very wrong my dude!",
          resultMessage: "Wrong Answer",
          onPressed: () => Navigator.pop(context, 'CANCEL'),
          buttonMessage: "Cancel",
          imageLocation:
              "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExbXFuNzBxZzAybWk0MXN4YXc0OHRna3dmbjA2Z2l5YXc4NnYwM2VubSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/6vfnV74fKmJK5yoTpt/giphy.gif",
        );
      }
    } else if (levelStage > 10) {
      MyAlertBox.showCustomDialog(
        onPressed: () {
          nextQuestion();
          Navigator.pop(context);
        },
        buttonMessage: "Next Question",
        context: context,
        customMessage:
            "Well done buddy! you got it right! I knew you would cuz your'e a genius",
        resultMessage: "You got it Right!",
        imageLocation:
            "https://media4.giphy.com/media/elh0hvgpliv9jkxpEH/giphy.gif",
      );
    }
  }

  void nextQuestion() {
    setState(() {
      answer = '';
      startingQuestioNum += 1;
    });

    if (startingQuestioNum == questionLimitNum) {
      setState(() {
        startingQuestioNum = 0;
        levelStage += 1;
      });
    }

    if (levelStage == 1) {
      firstNum = random.nextInt(10);
      secondNum = random.nextInt(10);
      setState(() {
        mathQuestion = "$firstNum + $secondNum = ";
      });
    } else if (levelStage == 2) {
      firstNum = random.nextInt(99);
      secondNum = random.nextInt(99);
      setState(() {
        mathQuestion = "$firstNum + $secondNum = ";
      });
    } else if (levelStage == 3) {
      firstNum = random.nextInt(10);
      secondNum = random.nextInt(10);
      setState(() {
        mathQuestion = "$firstNum - $secondNum = ";
      });
    } else if (levelStage == 4) {
      firstNum = random.nextInt(99);
      secondNum = random.nextInt(99);
      setState(() {
        mathQuestion = "$firstNum - $secondNum = ";
      });
    } else if (levelStage == 5) {
      firstNum = random.nextInt(10);
      secondNum = random.nextInt(10);
      setState(() {
        mathQuestion = "$firstNum x $secondNum = ";
      });
    } else if (levelStage == 6) {
      firstNum = random.nextInt(99);
      secondNum = random.nextInt(99);
      setState(() {
        mathQuestion = "$firstNum x $secondNum = ";
      });
    } else if (levelStage == 7) {
      do {
        firstNum = random.nextInt(10);
        secondNum = random.nextInt(10);
      } while (firstNum % secondNum != 0);
      setState(() {
        mathQuestion = "$firstNum ÷ $secondNum = ";
      });
    } else if (levelStage == 8) {
      do {
        firstNum = random.nextInt(99);
        secondNum = random.nextInt(99);
      } while (firstNum % secondNum != 0);
      setState(() {
        mathQuestion = "$firstNum ÷ $secondNum = ";
      });
    } else if (levelStage == 9) {
      firstNum = random.nextInt(10);
      secondNum = random.nextInt(10);
      thirdNum = random.nextInt(10);
      setState(() {
        mathQuestion = "$firstNum + $secondNum - $thirdNum = ";
      });
    } else if (levelStage == 10) {
      firstNum = random.nextInt(99);
      secondNum = random.nextInt(99);
      thirdNum = random.nextInt(99);
      setState(() {
        mathQuestion = "$firstNum - $secondNum + $thirdNum = ";
      });
    } else if (levelStage == maxLevelStage) {
      MyAlertBox.showCustomDialog(
          context: context,
          customMessage: "Yiepeee!",
          imageLocation:
              "https://64.media.tumblr.com/4f8b6339f88b26265c31eff71bd4f8ea/47383782115d4472-53/s540x810/7eda8cd5316580fdc41a161c7408d6ccb9a6749c.gif",
          resultMessage: "Congrats! you've finished the game!",
          buttonMessage: "Okay!",
          onPressed: () => Navigator.pop(context));
    }
    MyConfetti;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFA1EEBD),
      body: Column(
        children: [
          Container(
            height: 160,
            color: const Color(0xff7bd9ea),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Level: $levelStage',
                      style: whiteStyleText,
                    ),
                  ),
                  Text(
                    "Question: $startingQuestioNum / $questionLimitNum",
                    style: whiteStyleText,
                  ),
                ],
              ),
            ),
          ),
          // QUESTION AREA
          Expanded(
            child: Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      mathQuestion,
                      style: whiteStyleText,
                    ),
                    Container(
                      height: 50,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: const Color(0XFF7BD3EA),
                      ),
                      child: Center(
                        child: Text(
                          answer,
                          style: whiteStyleText,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // TYPING THE ANSWER AREA

          Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  physics: const ScrollPhysics(
                      parent: NeverScrollableScrollPhysics()),
                  itemCount: numPad.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return NumPadButton(
                      numpy: numPad[index],
                      onTap: () => buttonTapped(
                        numPad[index],
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }
}
