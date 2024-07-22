import 'package:flutter/material.dart';

import '../constants/colours.dart';

class TopBanner extends StatelessWidget{
  const TopBanner({super.key, required this.left, required this.title, required this.right});

  final IconData left;
  final String title;
  final IconData right;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 110,
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 20),
      decoration: BoxDecoration(
        color: widgetColour,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(left),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          Icon(right),
        ],
      ),
    );
  }

}