
import 'package:bmi_flutter/constants/constant.dart';
import 'package:bmi_flutter/helpers/bmi_calculator.dart';
import 'package:bmi_flutter/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';



class  BmiResultScreen extends StatelessWidget {
   const BmiResultScreen
({Key? key,required this.bmi, 
//this.bmiCalculator,
}) : super(key: key);
final double bmi;
//final BmiCalculator? bmiCalculator;

//String determineBmiCategory(double bmiValue) {
 //String category = "";
//if (bmiValue < 16.0) {
 // category = underweightSevere;
//} else if (bmiValue < 17) {
  //category = underweightModerate;
//} else if (bmiValue < 18.5) {
  //category = underweightMild; 
//} else if (bmiValue < 25) {
 // category = normal;
//}   else if (bmiValue < 30) {
//  category = overweight;
//} else if (bmiValue < 35) {
 //category = obeseI;
//} else if (bmiValue < 40) {
 // category = obeseII;
//}else if (bmiValue >= 40) {
 // category = obeseIII;
  //}

 // return category;
//}

//String getHealRiskDescription(String categoryName){
  //String desc ="";
  //switch (categoryName) {
  //  case underweightSevere:
  //  case underweightModerate:
  //  case underweightMild:
  //  desc ="Possible nutritional deficiency and osteoporosis.";
  //    break;

     // case normal:
   // /desc ="Low risk (healty range).";
   // /  break;
   //  / case overweight:
  // / desc ="Moderate risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
    // / break;
     //  case obeseI:
     //  case obeseII:
     //  case obeseIII:
    //desc ="High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus.";
     // break;
   //
   // default:
  //}
//return desc;
//}

  @override
  Widget build(BuildContext context) {
final BmiCalculator bmiCalculator = BmiCalculator.fromBmiValue(bmi);
// final bmiCategory =
 bmiCalculator.determineBmiCategory();
// final bmiDesc = 
 bmiCalculator.getHealRiskDescription();

    return Scaffold(
appBar: AppBar(    
title: const Center(child: Text("Result BMI     ",
style: TextStyle(fontSize: 30, 
            color: Colors.black, fontWeight: FontWeight.bold),),
),
 ),
 body: Column(children: [
  const Expanded(
    child:  Center(
      child:  Text("The Calculation Result",
      style:  TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      ),
      //PrettyGauge(gaugeSize: 300,
     // minValue: 0,
     // maxValue: 40,
      //segments: [
       // GaugeSegment('UnderWeight', 18.5, Colors.red),
       // GaugeSegment('UnderWeight', 6.4, Colors.green),
       // GaugeSegment('UnderWeight', 5, Colors.orange),
       // GaugeSegment('UnderWeight', 10.1, Colors.pink),
     // ],
     // valueWidget: Text(BmiResultScreen.toStringAsFixed(1),
      //style: const TextStyle(fontSize: 40),
      
    //  ),
     // currentValue: BmiResultScreen.toDouble( ),
      ),
    ),
  //),
  Expanded(
    flex: 5,
    child: BmiCard(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal:
          15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(bmiCalculator.bmiCategory ?? "",
            style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColo,
          ),
          ),
            Text(
             bmi.toStringAsFixed(1),
            style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
            ),
            Text(
              bmiCalculator.bmiDescription??"",
            textAlign: TextAlign.center,
            style: const TextStyle(
            fontSize: 15,
            color: primaryColo,
          ),
            ),
          ],
        ),
      )


    ),
  ),
   GestureDetector(
onTap: (){
Navigator.pop(context);
},
child: Container(
        height: 80,
        color: const Color(0XFF517df6),
        child: const Center(
          child: Text("RECALCULATE BMI",
          style:  TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        ),
      ),
      ),
 ],)
    );
    
  }
}