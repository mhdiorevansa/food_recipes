import 'package:flutter/material.dart';
import 'package:food_recipes/models/meal.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcedureWidget extends StatelessWidget {
  final Meal meal;
  const ProcedureWidget({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${(meal.instructions ?? '').trim().split('\n').where((str) => str.trim().isNotEmpty).length} steps',
            style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFFA9A9A9)),
          ),
          Gap(20),
          ...((meal.instructions?.split('\n') ?? [])
              .map((step) => step.trim())
              .where((step) => step.isNotEmpty)
              .map((step) {
                return Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ), // opsional: beri jarak antar item
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xFFD9D9D9),
                  ),
                  child: Text(
                    step,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFA9A9A9),
                    ),
                  ),
                );
              })
              .toList()),
        ],
      ),
    );
  }
}
