
import 'package:bmi_flutter/constants/constant.dart';
import 'package:bmi_flutter/helpers/bmi_calculator.dart';
import 'package:bmi_flutter/view/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {

int height = 100;
int weight = 50;
int age = 20;
String? gender ;
 
//double calculateBmi(){
 // double heightInMeter = height / 100;
 // final h = (heightInMeter * heightInMeter);
 // final bmi = weight / h;

 // return bmi;

//}

List<Widget> generateList(start, end){
  List<Widget> weigths = [];
  for (var i = start; i < end; i++) {
    weigths.add(
      Text("$i",
      style: labelTextStyle.copyWith(
        fontSize: 20,
      ),
      ),
    );
  }
  return weigths;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        
title: const Center(child: Text("BMI Calculator",
style: TextStyle(fontSize: 30, 
            color: Colors.black, fontWeight: FontWeight.bold),),
),
 

      ),
bottomNavigationBar:  GestureDetector(
onTap: (){
  final bmiCalculator = BmiCalculator(height: height, weight: weight);
  bmiCalculator.calculateBmi();

Navigator.of(context).push(
  MaterialPageRoute(builder: ((context) {
    return BmiResultScreen(
      bmi: bmiCalculator.bmi!,
    );
  }),
  ),
);

},
child: Container(
        height: 60,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(8), 
        color: const Color(0XFF517df6),
        ),
        child: const Center(
          child: Text("COUNT BMI",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        ),
      ),
      ),
    body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        Row(
          children:  [
        Expanded(
          child: GestureDetector(
            onTap: (){
              gender = "boy";
              setState(() {});
            },
            child: BmiCard(
              borderColor: (gender == "boy") ? Color(0xff517df6) : Colors.white,
              child: Stack(
                children: [
                 const Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 20.0),
                      child:  GenderIconText(
                      icon: Icons.boy,
                      title: 'Boy',
            ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                  child: Icon(Icons.check_circle,
            color:  (gender == "boy") ? Color(0xff517df6) : Colors.white,
            ),
                  ),
                ],
              ),
            ),
          )),
         Expanded(
           child: GestureDetector(
            onTap: (){
              gender = "girl";
              setState(() {});
            },
             child: BmiCard(
              borderColor: (gender == "girl") ? Color(0xff517df6) : Colors.white,
               child: Stack(
                 children: [
                  const Center(
                     child:  Padding(
                       padding: EdgeInsets.symmetric(vertical: 20.0),
                       child: GenderIconText(
                        icon: Icons.girl,
                        title: 'Girl',
                             ),
                     ),
                   ),
                   Positioned(
                    right: 10,
                    top: 10,
                  child: Icon(Icons.check_circle,
            color:  (gender == "girl") ? Color(0xff517df6) : Colors.white,
            ),
                  ),
                 ],
               ),
             ),
           ),
        ),
        ],
        ),
        const SizedBox(height: 30),
        Column(
          children: [
             Text("HEIGHT",
            style: labelTextStyle.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            ),
            Row(
              children: [
                Expanded(
                  child: BmiCard(
                    child:Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 250,
                      thumbColor: Colors.blue,
                      activeColor: Colors.blue,
                      inactiveColor: Colors.black,
                      onChanged: (value){
                        height = value.toInt();
                        setState(() {});
                    
                      },
                    
                    ),
                    ),
                ),
               BmiCard(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal:15.0,
                  vertical: 15.0,
                  ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "$height",
                      style: numberTextStyle,
                    ),
                    Text(
                      " cm",
                      style: labelTextStyle,
                    ),
                ],
                ),
              ),
              ),
    
              ],
            ),
             
          ],
      ),
      const SizedBox(height: 30),
        Container(
          child: Row(
            children: [
              Expanded(child: Column(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("WEIGHT",
                    style: labelTextStyle,
                    ),
                  BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Container(
                          height: MediaQuery.of(context).size.height * 0.15,
                          child: CupertinoPicker(
                          scrollController: FixedExtentScrollController(initialItem: 50),
                          itemExtent: 25,
                          magnification: 2,
                          useMagnifier: true,
                           onSelectedItemChanged: (val){
                            weight = val + 0;
                           },
                           children: generateList(0, 250),
                          ),
                        ),
                       // Text(
                         // "$weight",
                       // style: numberTextStyle,
                      //  ),
                      //  const SizedBox(height: 8),
                      //  Row(
                         // mainAxisAlignment: MainAxisAlignment.center,
                         // children: [
                          //  RawMaterialButton(
                          //    onPressed: (){
                           //     weight = weight +1;
                            //    setState(() {});
                            //  },
                            //  elevation: 0,
                            //  child: const Icon(Icons.add,
                           //   color: Colors.white,
                           //   ),
                            //  shape: const CircleBorder(),
                            //  fillColor: const Color(0xff212747),
                            //  constraints: const BoxConstraints.tightFor(
                            //    width: 56,
                            //    height: 56,
                             // ),
                             // ),
                             // const  SizedBox(width: 10),
                         // RawMaterialButton(
                            //  onPressed: (){
                            //    weight = weight -1;
                            //    setState(() {});
                            //  },
                             // elevation: 0,
                             // child: const Icon(
                             //   Icons.remove,
                             // color: Colors.white,
                             // ),
                             // shape: const  CircleBorder(),
                             // fillColor: const Color(0xff212747),
                            //  constraints: const BoxConstraints.tightFor(
                            //    width: 56,
                             //   height: 56,
                            //  ),
                            //  ),
                       // ],
                       // )
                      ],
                      ),
                  ),
                ],
              ),
              ),
              Expanded(
                child: Column(
                  children: [
                     Text("AGE",
                    style: labelTextStyle,
                    ), 
                    BmiCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       
                        Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                              scrollController: FixedExtentScrollController(initialItem: 50),
                              itemExtent: 25,
                              magnification: 2,
                              useMagnifier: true,
                               onSelectedItemChanged: (val){
                                weight = val + 0;
                               },
                               children: generateList(0, 200),
                              ),
                            ),
                      ]),
              ),
                  ],
                ),
              ),
            ],
            )),
        
      ],
      ),
    ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key, this.child,  this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
     color: Colors.white,
     boxShadow: [
      BoxShadow(
        offset: Offset(-2,2),
        blurRadius: 20,
        color: Colors.black.withOpacity(0.2)
      )
     ],
     borderRadius: BorderRadius.circular(15),
     border: Border.all(
      color: borderColor!
     ),
     ),
     margin: const EdgeInsets.all(15),
          child: child
        );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key, 
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        icon,
      size: 80,
      color: primaryColo,
      ),
      const SizedBox(height: 15),
      Text(
        title,
      style: labelTextStyle,
      ),
      ],
    );
  }
}