import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/familyWelcome.json'),
            const SizedBox(height: 20,),
            const Text('FamHub', style: TextStyle(fontSize: 44, fontFamily: 'Noir'),),
            const SizedBox(height: 10,),
            const Text('Share important info with your family,\ndon\'t go to your grave with it :)', textAlign: TextAlign.center,),
            const SizedBox(height: 40,),
            GradientButton(onPressed: ()=>{}, color: Color(0xff0a2768), buttonText: 'Sign Up'),
            const SizedBox(height: 10,),
            GradientButton(onPressed: ()=>{}, color: Color(0xffc95664), buttonText: 'Login'),
            const SizedBox(height: 10,),
            const Text('Read our Terms and Conditions', style: TextStyle(color: Color(0xff0a2768)),),
          ],
        ),
      )),
    );
  }
}


