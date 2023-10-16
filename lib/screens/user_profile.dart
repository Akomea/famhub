import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../models/Family.dart';
import '../models/FamilyMember.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  int selectedFamilyIndex = 0; // Initialize with the first family as the default selected family

  final List<Family> families = [
    Family(
      familyInitials: 'FA1',
      familyName: 'Family 1',

      members: [
        FamilyMember(name: 'Member 1', email: 'member1@example.com'),
      ],
    ),
    Family(
      familyInitials: 'FA2',
      familyName: 'Family 2',
      members: [
        FamilyMember(name: 'Member 2', email: 'member2@example.com'),
        FamilyMember(name: 'Member 3', email: 'member3@example.com'),
      ],
    ),
    Family(
      familyInitials: 'FA3',
      familyName: 'Family 3',
      members: [
        FamilyMember(name: 'Member 4', email: 'member4@example.com'),
        FamilyMember(name: 'Member 5', email: 'member3@example.com'),
        FamilyMember(name: 'Member 6', email: 'member4@example.com'),
      ],
    ),
  ];

  void updateSelectedFamilyIndex(int newIndex) {
    setState(() {
      selectedFamilyIndex = newIndex;
    });
  }

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
        title: Align(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              const Icon(Icons.arrow_back_ios, color: Colors.black,),
              Text(
                'profile'.tr,
                style:
                const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xfffaf2e3),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
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
                  UserInfo(iconData: Icons.cake_outlined, text: '09/04/1999',),
                ],
              ),
            ),
          ),
          const Header(title: 'Families'),
          FamiliesList(families: families, selectedFamilyIndex: selectedFamilyIndex,updateSelectedFamilyIndex: updateSelectedFamilyIndex, ),
          const SizedBox(height: 10),
          const Header(title: 'Members'),
          FamilyMembersList(families: families, selectedFamilyIndex: selectedFamilyIndex,)

        ],
      )
    );
  }
}

class MemberCard extends StatelessWidget {
  final String name;
  final String email;
  const MemberCard({
    super.key, required this.name, required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        color: const Color(0xffEEEEEE),
      ),
      child: Row(
        children: [
        const CircleAvatar(
        radius: 40,
        child: Text('Text')),
          const SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name),
              const SizedBox(height: 5,),
              Text(email),
            ],
          )
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String title;
  const Header({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
      child: Text(
        title,
        style:
        const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 28),
      ),
    );
  }
}

class FamiliesList extends StatefulWidget {
  final List<Family> families;
  int selectedFamilyIndex;
  final void Function(int) updateSelectedFamilyIndex; // Callback function


  FamiliesList({super.key, required this.families, required this.selectedFamilyIndex, required this.updateSelectedFamilyIndex});

  @override
  State<FamiliesList> createState() => _FamiliesListState();
}

class _FamiliesListState extends State<FamiliesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.families.length,
        itemBuilder: (context, index) {
          final family = widget.families[index]; // Get the initials of the family member
          return GestureDetector(
            onTap: (){
              // Update the selected family index when a family avatar is tapped
              widget.updateSelectedFamilyIndex(index);
            },
              child: FamilyAvatar(initials: family.familyInitials, familyName: family.familyName, isSelected: index == widget.selectedFamilyIndex,));
        },
      ),
    );
  }
}

class FamilyMembersList extends StatefulWidget {
  final List<Family> families;
  int selectedFamilyIndex;
  FamilyMembersList({super.key, required this.families, required this.selectedFamilyIndex});

  @override
  State<FamilyMembersList> createState() => _FamilyMembersListState();
}

class _FamilyMembersListState extends State<FamilyMembersList> {
  @override
  Widget build(BuildContext context) {
    final selectedFamily = widget.families[widget.selectedFamilyIndex]; // Get the selected family
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: selectedFamily.members.length,
        itemBuilder: (context, index) {
          final member = selectedFamily.members[index];
          return MemberCard(name: member.name, email: member.email);
        },
      ),
    );
  }
}

class FamilyAvatar extends StatelessWidget {
  final String initials;
  final String familyName;
  final bool isSelected;
  const FamilyAvatar({
    super.key, required this.initials, required this.familyName, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            child: Text(initials),
          ),
          const SizedBox(height: 15,),
          Text(familyName)
        ],
      ),
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
