import 'package:final_exam/features/home/presentation/widgets/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:final_exam/assets/colors.dart';
import 'package:final_exam/core/widgets/w_button.dart';
import 'package:final_exam/core/widgets/w_textfield.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../../assets/icons.dart';
import '../../../../../core/widgets/w_scale_animation.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(60 + MediaQuery.of(context).padding.top),
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.16),
              blurRadius: 16,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WScaleAnimation(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(AppIcons.arrowLeft),
                ),
              ),
              Align(child: SvgPicture.asset(AppIcons.logo,width: 142, height: 50,)),
              const Padding(
                padding: EdgeInsets.all(16),
                child: SizedBox(width: 24),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Ro’yxatdan o’tish',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: signUpColor,
              ),
            ),
            SizedBox(height: 36),
            WTextField(
              title: 'Email',
              fillColor: Colors.white,
              hintText: 'Email',
              controller: mailController,
              keyboardType: TextInputType.emailAddress, onChanged: (String value) {  }, obscureText: true,
            ),
            const SizedBox(height: 20),
            WTextField(
              title: 'Maxfiylik kaliti',
              fillColor: Colors.white,
              hintText: 'Maxfiylik kalitini kiriting...',
              controller: passwordController,
              obscureText: true, onChanged: (String value) {  },
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: () async {
                try {
                  UserCredential userCredential =
                  await _auth.createUserWithEmailAndPassword(
                    email: mailController.text,
                    password: passwordController.text,
                  );
                  print(userCredential.user!.email);

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                        (route) => false,
                  );
                } catch (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        error.toString(),
                      ),
                    ),
                  );
                }
              },
              text: 'Davom Etish',
            ),

            const Gap(20)    ,

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/login");
                  },
                  child: Container(
                    height: 42,
                    width: 350,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: borderColor),
                    ),
                    child: const Text(
                      "Kirish",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: signUpColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
