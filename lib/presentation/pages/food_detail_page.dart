import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/pages/home_page.dart';
import 'package:food_recipes/presentation/widgets/page_widget.dart';
import 'package:food_recipes/services/food_api_service.dart';
import 'package:gap/gap.dart';

class FoodDetailPage extends StatelessWidget {
  final String id;
  const FoodDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: FoodApiService.fecthDetailSeafoodMeal(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error : ${snapshot.error}'));
          }
          final meal = snapshot.data!;
          return PageWidget(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 56),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Icon(Icons.more_horiz, color: Colors.black, size: 20),
                    ],
                  ),
                  Gap(20),
                  Container(
                    height: 150,
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
                  ),
                  Gap(10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
