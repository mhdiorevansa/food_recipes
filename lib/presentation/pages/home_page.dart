import 'package:flutter/material.dart';
import 'package:food_recipes/presentation/pages/food_detail_page.dart';
import 'package:food_recipes/presentation/widgets/filter_button_widget.dart';
import 'package:food_recipes/presentation/widgets/page_widget.dart';
import 'package:food_recipes/presentation/widgets/search_input_widget.dart';
import 'package:food_recipes/services/food_api_service.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageWidget(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 64, bottom: 40),
        child: Column(
          children: [
            _homeHeader(),
            Gap(30),
            _searchFilter(),
            Gap(20),
            _listOfFoods(),
          ],
        ),
      ),
    );
  }

  Widget _listOfFoods() {
    return FutureBuilder(
      future: FoodApiService.fetchSeafoodMeal(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error : ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No Data Found'));
        }
        final meals = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'All Foods',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: meals.map((meal) {
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
      },
    );
  }

  Row _searchFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [SearchInputWidget(), FilterButtonWidget()],
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
