import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';



enum givenGender{
  Male,
  Female
}


void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // stack overflow code

      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme:AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180;
  int weight = 60;
  int age = 20;
  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;

  void changeCardColor(givenGender selectedGender){
    if(selectedGender == givenGender.Male){
      if(maleCardColor==kInactiveCardColor){
        maleCardColor = kActiveCardColor;
        femaleCardColor = kInactiveCardColor;
      }else{
        maleCardColor = kInactiveCardColor;
      }
    }
    if(selectedGender==givenGender.Female){
      if(femaleCardColor==kInactiveCardColor){
        femaleCardColor = kActiveCardColor;
        maleCardColor = kInactiveCardColor;
      }else{
        femaleCardColor = kInactiveCardColor;
      }

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        changeCardColor(givenGender.Male);

                      });
                    },
                    child: ReusableCard(
                      maleCardColor,
                      iconContent(
                        FontAwesomeIcons.mars,
                        'MALE',
                      ),

                    ),
                  ),
                ),
                
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState((){
                        changeCardColor(givenGender.Female);
                      });
                    },
                    child: ReusableCard(
                      femaleCardColor,
                      iconContent(
                        FontAwesomeIcons.venus,
                        'FEMALE',
                      ),

                    ),
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                        child: Text('HEIGHT',style: kLabelTextStyle,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),style: kNum,
                        ),
                        Text('cm',style: kLabelTextStyle,)
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x15EB1555),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)

                      ),
                      child: Slider(value: height.toDouble(),
                          min: 120,
                          max: 220,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double newValue){
                         setState((){
                           height = newValue.round();
                         });
                      }),
                    ),
                  ],
                ),

            ),
          ),
          
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                   Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('WEIGHT',style: kLabelTextStyle,),
                       Text(weight.toString(),style: kNum,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           FloatingActionButton(
                               backgroundColor: Color(0xFF4C4F5E),
                               child: Icon(
                                 FontAwesomeIcons.minus,
                               ),
                               onPressed: (){
                                 setState((){
                                   weight--;


                                 });
                               }

                           ),

                           SizedBox(width: 10.0,),
                           FloatingActionButton(
                               backgroundColor: Color(0xFF4C4F5E),
                               child: Icon(
                                 FontAwesomeIcons.plus,
                               ),
                               onPressed: (){
                                 setState((){
                                   weight++;
                                 });
                               }

                           ),
                         ],

                       ),
                     ],

                   ),
                  ),
                ),
                Expanded(
                  child:ReusableCard(
                    kActiveCardColor,
                    Column(
                      children: [
                        Text('AGE',style: kLabelTextStyle,),
                        Text(age.toString(),style: kNum,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  FontAwesomeIcons.minus,
                                ),
                                onPressed: (){
                                  setState((){
                                    age--;


                                  });
                                }

                            ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                                backgroundColor: Color(0xFF4C4F5E),
                                child: Icon(
                                  FontAwesomeIcons.plus,
                                ),
                                onPressed: (){
                                  setState((){
                                    age++;
                                  });
                                }

                            ),


                          ],
                        ),


                      ],
                    ),
                  ),
                ),
              ],

            ),

          ),

          GestureDetector(
            onTap: (){

              CalculatorBrain cal = CalculatorBrain(height, weight);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return ResultsPage(
                      bmiResult: cal.calculateBMI(),
                      resultText: cal.getResult(),
                      Interpretation: cal.getInterpretation(),


                    );

                  })
                ,);
            },
            child: Container(
              child: Center(child: Text('CALCULATE',style: kBigContainerStyle,),),
              color: kBottomContainerColor,
              padding: EdgeInsets.only(bottom: 20.0),
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          )
        ],
      ),

    );
  }
}

