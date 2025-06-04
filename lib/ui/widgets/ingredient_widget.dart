import 'package:flutter/material.dart';
import 'package:food_recipes/models/meal.dart';
import 'package:food_recipes/services/food_api_service.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class IngredientWidget extends StatefulWidget {
  final String id;
  const IngredientWidget({super.key, required this.id});

  @override
  State<IngredientWidget> createState() => _IngredientWidgetState();
}

class _IngredientWidgetState extends State<IngredientWidget> {
  late Meal detailMeal;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDetailMeal(widget.id);
  }

  Future<void> fetchDetailMeal(String id) async {
    try {
      final meal = await FoodApiService.fetchDetailSeafoodMeal(id);
      setState(() {
        detailMeal = meal;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '10 Items',
            style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFFA9A9A9)),
          ),
          Gap(23.5),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 27),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFFD9D9D9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Tomatos',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '500g',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA9A9A9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
