import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../routes/routes.dart';
import '../widgets/button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? errorMessage = '';
  bool isLogin = true;
  final bool _showError = false;

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: Text('Welcome', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold, color: Color(0xffc95664))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('back!', style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20,),
                const Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text('Sign in to access to your family space and shared information'),
                ),
                const SizedBox(height: 40,),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, left: 30),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text('login',
                        style: TextStyle(
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
                                    hintText: 'email',
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
                                    hintText: 'password',
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
                          Get.toNamed(PageRoutes.welcome);
                        },
                        child: const Text('Forgot password?', style: TextStyle(color: Color(0xffEC4F4A)),),
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
        Navigator.pushNamed(context, PageRoutes.memberProfile);
      },
      buttonText: 'Login', color: const Color(0xff0a2768),
    );
  }

  Widget _loginOrRegisterButton() {
    return TextButton(
      onPressed: () {
        setState(() {
          Navigator.pushNamed(context, PageRoutes.signUp);
          errorMessage = '';
        });
      },
      child: const RegisterOrLogin(text1: 'Don\'t have an account? ', text2: 'Sign Up',),
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