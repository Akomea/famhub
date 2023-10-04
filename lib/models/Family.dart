import 'FamilyMember.dart';

class Family {
  final String familyName;
  final String familyInitials;
  final List<FamilyMember> members;

  Family({required this.familyName, required this.members, required this.familyInitials});
}