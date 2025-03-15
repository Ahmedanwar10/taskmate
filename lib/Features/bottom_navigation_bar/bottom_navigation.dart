import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:taskmate_app/Features/home/home_view.dart';
import 'package:taskmate_app/Features/home/widgets/home_view_body.dart';
import 'package:taskmate_app/Features/profile/views/profile_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  final List<Widget> pages = [
    HomeViewBody(),
    CalendarView(),
    FilesView(),
    ProfileView(),
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      if (mounted) {
        setState(() {
          currentIndex = pageController.page?.round() ?? 0;
        });
      }
    });
  }

  void onTabChange(int page) {
    if (!mounted || page == currentIndex) return;

    if (page == currentIndex + 1 || page == currentIndex - 1) {
      pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.jumpToPage(page);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: pages,
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 70,
            margin: const EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              color: Colors.purple.shade100,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.shade200.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(LucideIcons.home, 0),
                _buildNavItem(LucideIcons.calendar, 1),
                const SizedBox(width: 60),
                _buildNavItem(LucideIcons.fileText, 2),
                _buildNavItem(LucideIcons.users, 3),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: Colors.purple,
              elevation: 5,
              onPressed: () {},
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTabChange(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: isSelected ? Colors.white : Colors.purple.shade400,
          size: 26,
        ),
      ),
    );
  }
}

// صفحات إضافية لمنع الأخطاء
class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Center(child: Text('Calendar Page', style: TextStyle(fontSize: 24))),
    );
  }
}

class FilesView extends StatelessWidget {
  const FilesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Files Page', style: TextStyle(fontSize: 24))),
    );
  }
}
