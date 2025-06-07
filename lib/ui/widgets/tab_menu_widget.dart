import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabMenuWidget extends StatelessWidget {
  final int length;
  final List<Tab> tabs;
  final List<Widget> children;
  const TabMenuWidget({
    super.key,
    required this.length,
    required this.tabs,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: length,
      child: Column(
        children: [
          TabBar(
            labelColor: Colors.white,
            labelStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: Color(0xFF129575),
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: tabs,
          ),
          SizedBox(height: 33),
          SizedBox(
            height: 340,
            child: TabBarView(
              children: children.map((child) {
                return SingleChildScrollView(child: child);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
