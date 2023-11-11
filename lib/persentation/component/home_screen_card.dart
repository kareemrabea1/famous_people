import 'package:famous_people/app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreenCard extends StatelessWidget {
  String name;

  HomeScreenCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Center(
          child: Text(
        name,
        style: TextStyle(color: AppColors.withColor, fontSize: 18),
      )),
    );
  }
}
