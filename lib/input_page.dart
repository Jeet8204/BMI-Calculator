import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;

  void changeColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == kinactiveCardColor) {
        maleCardColor = kactiveCardColor;
        femaleCardColor = kinactiveCardColor;
      } else {
        maleCardColor = kinactiveCardColor;
      }
    } else {
      if (femaleCardColor == kinactiveCardColor) {
        femaleCardColor = kactiveCardColor;
        maleCardColor = kinactiveCardColor;
      } else {
        femaleCardColor = kinactiveCardColor;
      }
    }
  }

  int height = 180;
  int weight = 50;
  int age = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      changeColor(Gender.male);
                    });
                  },
                  child: reusableCard(
                    height: 200,
                    width: 165,
                    colour: maleCardColor,
                    cardChild: const Custom_Icon_Content(
                      icon: FontAwesomeIcons.mars,
                      data: "MALE",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      changeColor(Gender.female);
                    });
                  },
                  child: reusableCard(
                    height: 200,
                    width: 165,
                    colour: femaleCardColor,
                    cardChild: const Custom_Icon_Content(
                        icon: FontAwesomeIcons.venus, data: "FEMALE"),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: reusableCard(
              colour: kactiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("HEIGHT", style: klabelTextStyle),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            height.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text(
                            "cm",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 15),
                            overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 30)),
                        child: Slider(
                          value: height.toDouble(),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.toInt();
                            });
                          },
                          min: 120.0,
                          max: 220.0,
                          activeColor: const Color(0xFFEB1555),
                          inactiveColor: const Color(0xFF8D8E98),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                reusableCard(
                  height: 200,
                  width: 165,
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("WEIGHT", style: klabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            weight.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text("kg",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight -= 1;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight += 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                reusableCard(
                  height: 200,
                  width: 165,
                  colour: kactiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("AGE", style: klabelTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: [
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          const Text("yrs",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age -= 1;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age += 1;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: "CALCULATE",
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);
              if (age < 18) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Age Restriction'),
                    content: const Text(
                        'BMI calculation may not be accurate for people under 18 years old.'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmiResult: calc.calculateBMI(),
                        getResult: calc.getResult(),
                        getInterpretation: calc.getInterpretation()),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
