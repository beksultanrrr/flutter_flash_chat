import 'package:cached_network_image/cached_network_image.dart';
import 'package:flash_chat/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/components/buttons.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool _saving = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: _saving,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Hero(
                    tag: "logo",
                    child: CachedNetworkImage(width: 200.h, height: 200.h, imageUrl: "https://www.kaznu.kz/content/images/pages/25775.jpg"),
                  ),
                  const SizedBox(
                    height: 48.0,
                  ),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      email = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: "Введите логинь"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(hintText: "Введите пароль"),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),

                  //singleScrollchildview
                  RoundedButton(
                      buttonColor: kLogInButtonColor,
                      buttonTitle: "Войти",
                      onPressed: () async {
                        setState(() {
                          _saving = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                          setState(() {
                            _saving = false;
                          });
                        } catch (e) {
                          print(e);
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
