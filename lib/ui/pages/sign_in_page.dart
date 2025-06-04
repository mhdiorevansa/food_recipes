import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_recipes/ui/pages/home_page.dart';
import 'package:food_recipes/ui/pages/sign_up_page.dart';
import 'package:food_recipes/ui/widgets/button_widget.dart';
import 'package:food_recipes/ui/widgets/divider_auth_widget.dart';
import 'package:food_recipes/ui/widgets/input_widget.dart';
import 'package:food_recipes/ui/widgets/page_widget.dart';
import 'package:food_recipes/ui/widgets/social_media_auth_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 94),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello,',
              style: GoogleFonts.poppins(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5),
            Text('Welcome Back!', style: GoogleFonts.poppins(fontSize: 20)),
            Gap(57),
            InputWidget(lable: "Email", placeholder: "Enter Email"),
            Gap(30),
            InputWidget(
              lable: "Enter Password",
              isPassword: true,
              placeholder: "Enter Password",
            ),
            Gap(20),
            Text(
              'Forgot Password?',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Color(0xFFFF9C00),
              ),
            ),
            Gap(25),
            ButtonWidget(
              text: "Sign In",
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              showIcon: true,
              isFullWidth: true,
            ),
            Gap(20),
            DividerAuthWidget(),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialMediaAuthWidget(pathImage: 'google_icon'),
                Gap(25),
                SocialMediaAuthWidget(pathImage: 'facebook_icon'),
              ],
            ),
            Gap(55),
            Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Don’t have an account? ',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign up',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Color(0xFFFF9C00),
                        fontWeight: FontWeight.w500,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
