import 'package:flutter/material.dart';
import 'package:food_recipes/ui/pages/sign_in_page.dart';
import 'package:food_recipes/ui/widgets/button_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FC),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/images/splash_screen.png', fit: BoxFit.cover),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 104, left: 83, right: 83),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/chef_hat.png',
                    width: 79,
                    height: 79,
                  ),
                  Gap(14),
                  Text(
                    '100K+ Premium Recipe',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Gap(200),
                  Text(
                    'Get Cooking',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(20),
                  Text(
                    'Simple way to find Tasty Recipe',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(64),
                  ButtonWidget(
                    text: "Start Cooking",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignInPage()),
                      );
                    },
                    showIcon: true,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
