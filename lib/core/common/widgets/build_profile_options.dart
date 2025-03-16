import 'package:flutter/material.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';

class BuildProfileOptions extends StatelessWidget {
  const BuildProfileOptions({super.key, required this.icon, required this.title, required this.onTap});

  final IconData icon;  
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Material( 
      color: Colors.transparent, // إبقاء الخلفية شفافة للحفاظ على التصميم
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color:ColorManager.white, width: 2),
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: const TextStyle(fontSize: 16)),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 18),
          onTap: onTap,
        ),
      ),
    );
  }
}