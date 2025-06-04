import 'package:flutter/material.dart';

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
            unselectedLabelColor: Colors.black,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              color: Color(0xFF129575),
              borderRadius: BorderRadius.circular(10),
            ),
            tabs: tabs,
          ),
          SizedBox(height: 33),
          SizedBox(height: 300, child: TabBarView(children: children)),
        ],
      ),
    );
  }
}
