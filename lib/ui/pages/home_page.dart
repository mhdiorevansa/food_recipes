import 'package:flutter/material.dart';
import 'package:food_recipes/ui/widgets/food_list_widget.dart';
import 'package:food_recipes/ui/widgets/page_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 64, bottom: 40),
        child: Column(children: [_homeHeader(), Gap(30), FoodListWidget()]),
      ),
    );
  }

  Row _homeHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Hello Dio',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(5),
            Text(
              'What are you cooking today?',
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Color(0xFFA9A9A9),
              ),
            ),
          ],
        ),
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Color(0xFFFFCE80),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset('assets/images/user_icon.png'),
        ),
      ],
    );
  }
}
