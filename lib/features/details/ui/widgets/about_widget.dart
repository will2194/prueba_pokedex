import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const AboutWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(description, style: TextStyle(fontSize: 12)),
        Text(title, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
