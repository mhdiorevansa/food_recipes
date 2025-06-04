import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchInputWidget extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchInputWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 255,
      height: 40,
      child: TextField(
        onChanged: onChanged,
        style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFF129575)),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: 'Search recipe',
          hintStyle: TextStyle(color: Color(0xFFD9D9D9), fontSize: 11),
          fillColor: Colors.white,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xFF129575), width: 1),
          ),
        ),
        cursorColor: Color(0xFF129575),
      ),
    );
  }
}
