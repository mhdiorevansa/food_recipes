import 'package:flutter/material.dart';
import 'package:food_recipes/models/meal.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientWidget extends StatelessWidget {
  final Meal meal;
  const IngredientWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${meal.ingredients?.length ?? 0} Items',
            style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFFA9A9A9)),
          ),
          Gap(23.5),
          ...((meal.ingredients ?? []).asMap().entries.map((entry) {
            final index = entry.key;
            final ingredient = entry.value;
            final measure = (meal.measures?.length ?? 0) > index
                ? meal.measures![index]
                : '';
            return Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFFD9D9D9),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ingredient,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                  Text(
                    measure,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                ],
              ),
            );
          }).toList()
          ),
        ],
      ),
    );
  }
}
