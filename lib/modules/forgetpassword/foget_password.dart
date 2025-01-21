import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/themes/color_pallete.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                prefixIcon:const ImageIcon(AssetImage(AppAssets.mailIcn)
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorPalette.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
                child: const Text("Reset Password",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.white,
                      fontSize: 20
                  ),
                )
            ),
          ),
        ],
      )
    );
  }
}
