import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({required this.bmiResult,required this.resultText,required this.Interpretation});

  final String bmiResult;
  final String Interpretation;
  final String resultText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                  alignment: Alignment.bottomLeft,
                  child: Text('YOUR RESULT',style: kTitleTextStyle,
                  ),
              ),
            ),
            Expanded(
              flex: 5,
                child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(resultText,
                          style: kResultTextStyle,),
                        Text(bmiResult,style: kBMITextStyle,),
                        Text(
                          Interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        )
                      ],
                    ),
                ),

            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                },
              child: Container(
                child: Center(child: Text('RE-CALCULATE',style: kBigContainerStyle,),),
                color: kBottomContainerColor,
                padding: EdgeInsets.only(bottom: 20.0),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: kBottomContainerHeight,
              ),
            )
          ],
        ),
      ),

    );
  }
}
