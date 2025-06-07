import 'package:flutter/material.dart';
import 'package:food_recipes/services/food_api_service.dart';
import 'package:food_recipes/ui/widgets/button_widget.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterButtonWidget extends StatefulWidget {
  final Function(Set<String>) onFilterApplied;
  const FilterButtonWidget({super.key, required this.onFilterApplied});

  @override
  State<FilterButtonWidget> createState() => _FilterButtonWidgetState();
}

class _FilterButtonWidgetState extends State<FilterButtonWidget> {
  Set<String> selectedCategories = {};
  List categories = [];
  bool isLoading = true;

  void toggleSelection(String categoryName) {
    setState(() {
      if (selectedCategories.contains(categoryName)) {
        selectedCategories.remove(categoryName);
      } else {
        selectedCategories.add(categoryName);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    try {
      final categoriesData = await FoodApiService.fetchCategoriesMeal();
      setState(() {
        categories = categoriesData;
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
    if (isLoading) return CircularProgressIndicator();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          backgroundColor: Colors.white,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, setModalState) {
                return Container(
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Filter Search',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gap(20),
                      Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: categories.map((category) {
                          final isSelected = selectedCategories.contains(
                            category.name,
                          );
                          return GestureDetector(
                            onTap: () {
                              setModalState(() {
                                toggleSelection(category.name);
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 7,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Color(0xFF129575)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                category.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Gap(20),
                      ButtonWidget(
                        text: 'Terapkan',
                        onPressed: () {
                          widget.onFilterApplied(selectedCategories);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xFF129575),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(Icons.settings, color: Colors.white, size: 20),
      ),
    );
  }
}
