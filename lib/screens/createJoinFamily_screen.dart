import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routes/routes.dart';
import '../widgets/button.dart';

class CreateJoinFamilyScreen extends StatefulWidget {
  const CreateJoinFamilyScreen({super.key});

  @override
  State<CreateJoinFamilyScreen> createState() => _CreateJoinFamilyScreenState();
}

class _CreateJoinFamilyScreenState extends State<CreateJoinFamilyScreen> {
  String? errorMessage = '';
  bool isJoin = true;
  bool _showError = false;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Registration', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 30,),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('Hello', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xffc95664))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('there!', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Text(isJoin? 'Join an existing family account to access shared information': 'Create a family account to access to your account and shared information'),
                ),
                const SizedBox(height: 40,),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                        isJoin ? 'join family' : 'create family',
                        style: const TextStyle(
                            color: Color(0xFF0C005A),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Lato'
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 10.0,
                                  offset: Offset(0, 5)
                              ),
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .1),
                                  blurRadius: 10.0,
                                  offset: Offset(0, 5)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[
                            Visibility(
                              visible: isJoin? false:true,
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.name,
                                  controller: _controllerName,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'family name',
                                      hintStyle: TextStyle(color: _showError? Colors.red: Colors.grey[500])
                                  ),
                                ),
                              ),),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]!))
                              ),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _controllerEmail,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'family ID',
                                    hintStyle: TextStyle(color: Colors.grey[500])
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: _controllerPassword,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'passcode',
                                    hintStyle: TextStyle(color: Colors.grey[500])
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      _emptyFieldError(),
                      _errorMessage(),
                      _submitButton(),
                      _loginOrRegisterButton(),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(PageRoutes.memberProfile);
                        },
                        child: const Text('Login', style: TextStyle(color: Color(0xffEC4F4A)),),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

  @override
  void dispose() {
    _controllerName.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  Widget _submitButton() {
    return GradientButton(
      onPressed:(){
        !isJoin? Navigator.pushNamed(context, PageRoutes.createFamily): Navigator.pushNamed(context, PageRoutes.memberProfile);
      },
      buttonText: isJoin? 'Join' : 'Next', color: const Color(0xff0a2768),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          isJoin = !isJoin;
          errorMessage = '';
        });
      },
      child: isJoin? const RegisterOrLogin(text1: 'Not part of a family yet? ', text2: 'Create a family account',): const RegisterOrLogin(text1: 'Already registered with a family? ', text2: 'Join',),
    );
  }

  Widget _errorMessage() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(errorMessage == ''?'' : 'Hmm... $errorMessage', style: const TextStyle(color: Colors.red),),
    );
  }

  Widget _emptyFieldError() {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Text(!_showError ? '' : 'All fields required...', style: const TextStyle(color: Colors.red),),
    );
  }

}

class RegisterOrLogin extends StatelessWidget {
  final String text1;
  final String text2;
  const RegisterOrLogin({
    Key? key, required this.text1, required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1, style: const TextStyle(color: Color.fromRGBO(143, 148, 251, 1)),),
        Text(text2, style: const TextStyle(color: Color(0xFF0C005A), fontWeight: FontWeight.bold)),
      ],
    );
  }
}