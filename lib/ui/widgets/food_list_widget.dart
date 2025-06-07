import 'package:flutter/material.dart';
import 'package:food_recipes/ui/pages/food_detail_page.dart';
import 'package:food_recipes/ui/widgets/filter_button_widget.dart';
import 'package:food_recipes/ui/widgets/search_input_widget.dart';
import 'package:food_recipes/services/food_api_service.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({super.key});

  @override
  State<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  List allMeals = [];
  List filteredMeals = [];
  bool isLoading = true;
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  Future<void> fetchMeals() async {
    try {
      final meals = await FoodApiService.fetchAllMeal();
      setState(() {
        allMeals = meals;
        filteredMeals = meals;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void onSearchChanged(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredMeals = allMeals
          .where((meal) => meal.name.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  void filterByCategory(Set<String> categories) {
    setState(() {
      if (categories.isEmpty) {
        filteredMeals = allMeals;
      } else {
        filteredMeals = allMeals.where((meal) {
          return categories.contains(meal.category);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchInputWidget(onChanged: onSearchChanged),
            FilterButtonWidget(
              onFilterApplied: (Set<String> selectedCategories) {
                filterByCategory(selectedCategories);
              },
            ),
          ],
        ),
        Gap(20),
        Text(
          'All Foods',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        if (isLoading)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(child: CircularProgressIndicator()),
          )
        else if (filteredMeals.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'No foods found',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        else
          GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: filteredMeals.map((meal) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => FoodDetailPage(id: meal.id),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(meal.thumbnail),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black38,
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        meal.name,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
