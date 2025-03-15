import 'package:flutter/material.dart';
import 'package:taskmate_app/Features/bottom_navigation_bar/bottom_navigation.dart';
import 'package:taskmate_app/Features/home/widgets/home_view_body.dart';
import 'package:taskmate_app/core/constants/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: const HomeViewBody(),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
