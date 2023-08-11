import 'package:flutter/cupertino.dart';

import '../member_profile.dart';

///Creates a class with accessible routes to all screens of the app
class PageRoutes {
  static const String memberProfile = 'member_profile';

  ///Builds screen widgets and maps them to class attributes
  Map<String, WidgetBuilder> routes() {
    return {
      memberProfile: (context) => const MemberProfile(),
    };
  }
}