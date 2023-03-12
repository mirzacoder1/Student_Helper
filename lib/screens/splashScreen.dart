import 'package:flutter/material.dart';
import 'package:student_helper/screens/homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500));
    Navigator.push(context, MaterialPageRoute(builder:(context)=> HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[ 
                  Container(
                    height:100,
                    width:100,
                    color:Colors.blue
                  ),
                  Container(
                    child: Text(
                      "Splash Screen",
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),),],
              ),),),
    );
  }
}
