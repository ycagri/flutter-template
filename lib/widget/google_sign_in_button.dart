import 'package:flutter/material.dart';

class GoogleSignInButton extends StatelessWidget {
  final String title;

  final bool isDark;

  final VoidCallback onTap;

  const GoogleSignInButton({
    super.key,
    required this.title,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: EdgeInsets.symmetric(vertical: 8),
    child: OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: const BorderSide(width: 2.0),
      ),
      onPressed: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8 * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 36.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child:
                    isDark
                        ? Image.asset('assets/logos/google_dark.png')
                        : Image.asset('assets/logos/google_light.png'),
              ),
            ),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}
