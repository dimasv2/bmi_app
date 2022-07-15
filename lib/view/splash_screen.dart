import 'dart:async';

import 'package:bmi_flutter/view/bmi_data_screen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    
    Timer(const Duration(seconds: 8), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const BmiDataScreen() ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             const Text('WELCOME', style: TextStyle(fontSize: 40, 
            color: Color.fromARGB(255, 39, 4, 235), fontWeight: FontWeight.bold),),
           Image.asset('assets/awan.png'),
           //Center(child: FlutterLogo(size: 200)),
            const Text('Body Mass Index', style: TextStyle(fontSize: 30,
             color: Color.fromARGB(255, 65, 27, 233), fontWeight: FontWeight.bold),),
            const Text('REBAHAN', style: TextStyle(fontSize: 20, 
            color: Colors.white, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
    
  }
}