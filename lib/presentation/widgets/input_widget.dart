import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class InputWidget extends StatelessWidget {
  final String lable;
  final bool isPassword;
  const InputWidget({super.key, required this.lable, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(lable, style: GoogleFonts.poppins(fontSize: 14)),
        Gap(5),
        TextField(
          style: GoogleFonts.poppins(fontSize: 11, color: Color(0xFF129575)),
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: 'Enter Email',
            hintStyle: TextStyle(color: Color(0xFFD9D9D9)),
            contentPadding: EdgeInsets.all(20),
            fillColor: Colors.white,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFFD9D9D9), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFF129575), width: 1),
            ),
          ),
          cursorColor: Color(0xFF129575),
        ),
      ],
    );
  }
}
