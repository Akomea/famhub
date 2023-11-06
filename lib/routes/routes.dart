import 'package:famhub/screens/createJoinFamily_screen.dart';
import 'package:famhub/screens/create_family_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screens/signIn_screen.dart';
import '../screens/user_profile.dart';

///Creates a class with accessible routes to all screens of the app
class PageRoutes {
  static const String memberProfile = 'member_profile';
  static const String welcome = 'welcome';
  static const String signIn = 'sign_in';
  static const String signUp = 'sign_up';
  static const String createFamily = 'create_family';

  ///Builds screen widgets and maps them to class attributes
  Map<String, WidgetBuilder> routes() {
    return {
      memberProfile: (context) => const UserProfile(),
      welcome: (context) => const UserProfile(),
      signIn: (context) =>  const SignInScreen(),
      signUp: (context) =>  const CreateJoinFamilyScreen(),
      createFamily: (context) => const CreateFamilyScreen(),
    };
  }
}