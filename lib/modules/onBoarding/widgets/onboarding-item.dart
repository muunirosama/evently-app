// import 'package:evently_app/core/themes/color_pallete.dart';
// import 'package:flutter/material.dart';
// import '../models/on-boardingmodel.dart';
//
// class OnboardingItem extends StatelessWidget {
//   final OnboardingModel onboardingModel;
//    OnboardingItem({super.key, required this.onboardingModel, });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         Image.asset(
//           onboardingModel.imagePath
//         ),
//         Text(
//           onboardingModel.title,
//           style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//               color: ColorPalette.primaryColor
//           ),
//         ),
//         Text(
//           onboardingModel.desc??"",
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//               color: ColorPalette.primaryColor
//           ),
//         )
//       ],
//     );
//   }
// }
