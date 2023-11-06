import 'package:famhub/routes/routes.dart';
import 'package:famhub/screens/createJoinFamily_screen.dart';
import 'package:famhub/screens/signIn_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../constants.dart';
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
            GradientButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  const CreateJoinFamilyScreen(),
                    ),
                  );
            }, color: kPrimaryColour, buttonText: 'Sign Up'),
            const SizedBox(height: 10,),
            GradientButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  const SignInScreen(),
                ),
              );
            }, color: kAccentColour, buttonText: 'Login'),
            const SizedBox(height: 10,),
            const Text('Read our T&Cs and Privacy Policy', style: TextStyle(color: kPrimaryColour),),
          ],
        ),
      )),
    );
  }
}


