import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberProfile extends StatelessWidget {
  const MemberProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('profile'.tr)),
      body: const Center(child: Text('Member profile'),),
    );
  }
}
