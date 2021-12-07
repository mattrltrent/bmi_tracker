import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/resuable_card.dart';
import '../constants.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GendersEnum {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColour;
  Color femaleCardColor = kInactiveCardColour;

  GendersEnum genderSelected;

  int height = 140;
  int weight = 150;
  int age = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      genderSelected = GendersEnum.male;
                    });
                  },
                  colour: genderSelected == GendersEnum.male ? kActiveCardColour : kInactiveCardColour,
                  cardChild: IconContent(icon: FontAwesomeIcons.mars, label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: (){
                    setState(() {
                      genderSelected = GendersEnum.female;
                    });
                  },
                colour: genderSelected == GendersEnum.female ? kActiveCardColour : kInactiveCardColour,
                cardChild: IconContent(icon: FontAwesomeIcons.venus, label: 'FEMALE',
                ),
              ),
              ),
            ],
          ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                     style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(), // $height, (Does this work?),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        ' cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: kMinScaleHeight,
                      max: kMaxScaleHeight,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      },
                      activeColor: Color(0xFFeb1555),
                      inactiveColor: Color(0xff8d8e9),
                    ),
                  ),
                ],
              ),
          ),
          ),
          Expanded(
            child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          ' lbs',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                          onPressed: (){
                              setState(() {
                                if (weight > 1){
                                  weight--;
                                }
                              });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                          onPressed: (){
                              setState(() {
                                if (weight < 1000){
                                  weight++;
                                }
                              });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
              Expanded(child: ReusableCard(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          ' yrs',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              if (age > 1){
                                age--;
                              }
                            });
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              if (age < 130){
                                age++;
                              }
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),),
          BottomButton(buttonTitle: 'CALCULATE', onTap: (){

            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiResult: calc.calculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation(),)));
          },)
        ],
      ),
    );
  }
}








