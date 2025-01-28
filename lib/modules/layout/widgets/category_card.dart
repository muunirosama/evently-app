import 'package:flutter/material.dart';

import '../../../core/themes/color_pallete.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    return  Container(
      padding: EdgeInsets.all(12),
      width: mediaQuery.size.width *0.9,
      height: mediaQuery.size.height * 0.25,
      decoration: BoxDecoration(
          border: Border.all(
              color: ColorPalette.primaryColor,
              width: 1
          ),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image:AssetImage("assets/images/bdimg.png",
              ),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorPalette.white,
            ),
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
            child: const Column(
              children: [
                Text("25",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.primaryColor
                  ),
                ),
                Text("Nov",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.primaryColor
                  ),
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color: ColorPalette.white,
                borderRadius: BorderRadius.circular(8)
            ),
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Text("This is a Birthday Party",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
                Spacer(),
                Icon(Icons.favorite_border_outlined,
                  color: ColorPalette.primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
