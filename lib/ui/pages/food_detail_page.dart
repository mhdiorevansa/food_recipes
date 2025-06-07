import 'package:flutter/material.dart';
import 'package:food_recipes/models/meal.dart';
import 'package:food_recipes/ui/pages/home_page.dart';
import 'package:food_recipes/ui/widgets/ingredient_widget.dart';
import 'package:food_recipes/ui/widgets/page_widget.dart';
import 'package:food_recipes/ui/widgets/procedure_widget.dart';
import 'package:food_recipes/ui/widgets/tab_menu_widget.dart';
import 'package:food_recipes/services/food_api_service.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDetailPage extends StatefulWidget {
  final String id;
  const FoodDetailPage({super.key, required this.id});

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
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
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageWidget(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 56, bottom: 40),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
              Gap(20),
              Container(
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(detailMeal.thumbnail),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black38,
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      detailMeal.category ?? '',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Gap(15),
              SizedBox(
                width: double.infinity,
                child: Text(
                  detailMeal.name,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Gap(5),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'From ${detailMeal.area}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFA9A9A9),
                  ),
                ),
              ),
              Gap(20),
              TabMenuWidget(
                length: 2,
                tabs: [
                  Tab(text: 'Ingredient'),
                  Tab(text: 'Procedure'),
                ],
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [IngredientWidget(meal: detailMeal)],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ProcedureWidget(meal: detailMeal)],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
