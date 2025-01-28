import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Function()?onTap;
  final Color bgColor;
  final Color textColor;
  const CustomElevatedButton({super.key,
    required this.text,
     this.onTap,
    this.borderRadius=16,
    this.bgColor = ColorPalette.white,
    this.textColor= ColorPalette.primaryColor
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(8),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)
        )
      ),
        onPressed:onTap,
        child: Text(text,
        style:TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: textColor
        ),
        )
    );
  }
}
