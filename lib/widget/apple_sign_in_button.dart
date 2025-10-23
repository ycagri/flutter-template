import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppleSignInButton extends StatelessWidget {
  final String title;

  final VoidCallback onTap;

  const AppleSignInButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: FilledButton(
      style: FilledButton.styleFrom(backgroundColor: Colors.black),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8 * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 36.0,
              child: const Icon(FontAwesomeIcons.apple, color: Colors.white),
            ),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
