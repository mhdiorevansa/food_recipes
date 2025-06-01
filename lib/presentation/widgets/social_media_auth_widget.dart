import 'package:flutter/material.dart';

class SocialMediaAuthWidget extends StatelessWidget {
  final String pathImage;
  const SocialMediaAuthWidget({super.key, required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/$pathImage.png',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
