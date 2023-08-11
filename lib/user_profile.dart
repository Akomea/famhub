import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.black,),
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
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
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
