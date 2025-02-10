import 'package:evently_app/core/extensions/Padding.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/themes/color_pallete.dart';
import '../../core/widgets/custom_text_field.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )
        ),
          centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Image.asset(AppAssets.forgetPasswordImg,
            ),
          ),
          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: const CustomTextField(
              hint: "Email",
              hintColor: ColorPalette.generalGreyColor,
              prefixIcon: ImageIcon(
                AssetImage(
                  AppAssets.mailIcn,
                ),
                color: ColorPalette.generalGreyColor,
              ),
            ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  )),
              child: Text(
                "Reset Password",
                style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold, color: ColorPalette.white),
              ).setVerticalPadding(context, 0.015),
            ).setVerticalPadding(context, 0.025),
          ),

        ],
      )
    );
  }
}
