import 'package:flutter/material.dart';

import '../../../core/themes/color_pallete.dart';

class tapbarItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData icon;
  const tapbarItem({super.key,
    required this.text,
    required this.isSelected,
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
          color: isSelected?ColorPalette.white:Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: ColorPalette.white
        )
      ),
      padding: EdgeInsets.all(8),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon,
          color: isSelected?ColorPalette.primaryColor:Colors.white,
          ),
          SizedBox(width: 8,),
          Text(text,
            style: TextStyle(
                color: isSelected?ColorPalette.primaryColor:Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
