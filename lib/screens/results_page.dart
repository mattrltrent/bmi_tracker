import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import '../components/resuable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';


class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomCenter,
              child: Text(
                  'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$resultText',
                    style: kResultTextStyle,
                  ),
                  Text(
                    '$bmiResult',
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      '$interpretation',
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(buttonTitle: 'RE-CALCULATE',
              onTap: (){
            Navigator.pop(context);
          },
          )
        ],
      ),
    );
  }
}
