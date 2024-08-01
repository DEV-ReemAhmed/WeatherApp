import 'package:flutter/material.dart';

class Noweatherbody extends StatelessWidget {
  const Noweatherbody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'There is no weather ☹️ ',
              style: TextStyle(fontSize: 26),
            ),
            Text(
              'Start searching now 🔍',
              style: TextStyle(fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
