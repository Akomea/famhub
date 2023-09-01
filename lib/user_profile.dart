import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Color(0xfffaf2e3),

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black,),
            tooltip: 'Edit user profile',
            onPressed: () {
              // handle the press
            },
          ),
        ],
        title: Text(
          'profile'.tr,
          style:
          const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: const Color(0xfffaf2e3),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 220,
              padding: const EdgeInsets.only(bottom: 16),
              color: const Color(0xfffaf2e3),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 35,
                      child: Text('KA'),
                    ),
                    SizedBox(height: 10,),
                    Text('Kenn Akomea', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black,fontSize: 24),),
                    UserInfo(text: 'kam@yahoo.com',),
                    SizedBox(height: 10,),
                    UserInfo(iconData: Icons.calendar_month_rounded, text: 'Joined on 02/08/2023',),
                    UserInfo(iconData: Icons.cake_outlined, text: '09/04/1999',),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            top: 250,
            left: 15,
            child: Text(
              'Families',
              style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28),
            ),
          ),
          Positioned(
            top: -30,
              left: 15,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 35,
                    child: Text('KA'),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 35,
                    child: Text('KA'),
                  ),
                  SizedBox(width: 10,),
                  CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 35,
                    child: Text('KA'),
                  ),
                ],
              )
          ),

        ],
      )
    );
  }
}

class UserInfo extends StatelessWidget {
  final String text;
  final IconData? iconData;
  const UserInfo({
    super.key, required this.text, this.iconData
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if(iconData !=null) ...[
        Icon(iconData, color: Colors.grey,),
        const SizedBox(width: 5,),
        ],
        Text(text)
      ],
    );
  }
}
