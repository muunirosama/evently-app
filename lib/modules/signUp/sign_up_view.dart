import 'package:evently_app/core/routes/pages_routes_name.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register",
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        )
          ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 20,),
          Image.asset(AppAssets.Eventlylogo,
            height: mediaQuery.size.height * 0.25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon:Transform.scale(
                  scale: .7,
                  child: const ImageIcon(
                    AssetImage(AppAssets.nameIcn,
                  )
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon:const ImageIcon(AssetImage(AppAssets.mailIcn)
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon:Transform.scale(
                    scale: .6,
                    child: const ImageIcon(
                      AssetImage(AppAssets.lockIcn),
                    ),
                  ),
                  suffixIcon:const Icon(Icons.visibility_off),
                ),
              )
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "Re Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon:Transform.scale(
                    scale: .6,
                    child: const ImageIcon(
                      AssetImage(AppAssets.lockIcn),
                    ),
                  ),
                  suffixIcon:const Icon(Icons.visibility_off),
                ),
              )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
            child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorPalette.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    )
                ),
                child: const Text("Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.white,
                      fontSize: 20
                  ),
                )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have account ?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: (){},
                  child: const Text("Login",
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorPalette.primaryColor,
                    ),
                  )
              )
            ],
          ),

        ],
      ),
    );
  }
}