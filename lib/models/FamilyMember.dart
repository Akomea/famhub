import 'Family.dart';

class FamilyMember {
  final String memberID;
  final String firstName;
  final String middleName;
  final String familyName;
  final String dateOfBirth;
  final String email;
  final List<Family> mFamilies;

  FamilyMember({required this.memberID, required this.firstName, required this.middleName, required this.familyName, required this.dateOfBirth, required this.email, required this.mFamilies});
}