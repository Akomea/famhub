import 'package:flutter/cupertino.dart';

import '../screens/user_profile.dart';

///Creates a class with accessible routes to all screens of the app
class PageRoutes {
  static const String memberProfile = 'member_profile';
  static const String welcome = 'welcome';
  static const String signIn = 'sign_in';
  static const String signUp = 'sign_out';
  static const String joinFamily = 'join_family';
  static const String createFamily = 'join_family';

  ///Builds screen widgets and maps them to class attributes
  Map<String, WidgetBuilder> routes() {
    return {
      memberProfile: (context) => const UserProfile(),
      welcome: (context) => const UserProfile(),
      signIn: (context) => const UserProfile(),
      signUp: (context) => const UserProfile(),
      joinFamily: (context) => const UserProfile(),
      createFamily: (context) => const UserProfile(),
    };
  }
}