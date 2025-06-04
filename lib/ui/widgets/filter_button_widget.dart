import 'package:flutter/material.dart';

class FilterButtonWidget extends StatelessWidget {
  const FilterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFF129575),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.settings, color: Colors.white, size: 20),
    );
  }
}
