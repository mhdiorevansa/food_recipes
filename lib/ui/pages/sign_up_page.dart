import 'package:flutter/material.dart';
import 'package:food_recipes/ui/pages/home_page.dart';
import 'package:food_recipes/ui/pages/sign_in_page.dart';
import 'package:food_recipes/ui/widgets/button_widget.dart';
import 'package:food_recipes/ui/widgets/checkbox_widget.dart';
import 'package:food_recipes/ui/widgets/divider_auth_widget.dart';
import 'package:food_recipes/ui/widgets/input_widget.dart';
import 'package:food_recipes/ui/widgets/page_widget.dart';
import 'package:food_recipes/ui/widgets/social_media_auth_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create an account',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5),
            SizedBox(
              width: 195,
              child: Text(
                'Let’s help you set up your account, it won’t take long.',
                style: GoogleFonts.poppins(fontSize: 11),
              ),
            ),
            Gap(20),
            InputWidget(lable: 'Name', placeholder: 'Enter Name'),
            Gap(20),
            InputWidget(lable: 'Email', placeholder: 'Enter Email'),
            Gap(20),
            InputWidget(
              lable: 'Password',
              placeholder: 'Enter Password',
              isPassword: true,
            ),
            Gap(20),
            CheckboxWidget(),
            Gap(26),
            ButtonWidget(
              text: 'Sign Up',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              showIcon: true,
              isFullWidth: true,
            ),
            Gap(14),
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
            Gap(20),
            GestureDetector(
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => SignInPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member? ',
                    style: GoogleFonts.poppins(fontSize: 11),
                  ),
                  Text(
                    'Sign In ',
                    style: GoogleFonts.poppins(
                      fontSize: 11,
                      color: Color(0xFFFF9C00),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
