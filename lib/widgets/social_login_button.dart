import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;
  final VoidCallback onTap;
  final bool isGoogle;

  const SocialLoginButton({
    Key? key,
    this.icon,
    required this.text,
    required this.color,
    required this.onTap,
    this.isGoogle = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isGoogle)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: const Center(
                  child: Text(
                    'G',
                    style: TextStyle(
                      color: Color(0xFF4285F4),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            else if (icon != null)
              Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
