import 'package:evently_app/core/routes/pages_routes_name.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/utlis/firebase-functions.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20,
          ),
          Image.asset(
            AppAssets.Eventlylogo,
            height: mediaQuery.size.height * 0.25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: Transform.scale(
                  scale: .7,
                  child: const ImageIcon(AssetImage(
                    AppAssets.nameIcn,
                  )),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                prefixIcon: const ImageIcon(AssetImage(AppAssets.mailIcn)),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Transform.scale(
                    scale: .6,
                    child: const ImageIcon(
                      AssetImage(AppAssets.lockIcn),
                    ),
                  ),
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Re Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Transform.scale(
                    scale: .6,
                    child: const ImageIcon(
                      AssetImage(AppAssets.lockIcn),
                    ),
                  ),
                  suffixIcon: const Icon(Icons.visibility_off),
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: ElevatedButton(
                onPressed: () {
                  FirebaseFunctions.createAccount(
                      emailController.text, passwordController.text);
                },
                style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ColorPalette.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorPalette.white,
                      fontSize: 20),
                )),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Already have account ?",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: ColorPalette.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                      decorationColor: ColorPalette.primaryColor,
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
