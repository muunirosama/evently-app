import 'package:evently_app/core/extensions/Padding.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../core/constants/app_assets.dart';
import '../../core/extensions/validtions.dart';
import '../../core/routes/pages_routes_name.dart';
import '../../core/services/FirebaseAuth.dart';

import '../../core/widgets/custom_text_field.dart';
import '../../main.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var theme = Theme.of(context);
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
      body: Form(
        key: _formKey,
        child: Column(
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: nameController,
                hint: "Name",
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your name";
                  }
                  return null;
                },
                prefixIcon: const ImageIcon(
                  AssetImage(
                    AppAssets.nameIcn,
                  ),
                  color: ColorPalette.generalGreyColor,
                ),
              ).setOnlyPadding(context, 0.03, 0.0, 0.0, 0.0),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: emailController,
                hint: "Email",
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your email address";
                  }
                  if (!Validations.validateEmail(value)) {
                    return "plz enter your a valid email address";
                  }
                  return null;
                },
                prefixIcon: const ImageIcon(
                  AssetImage(
                    AppAssets.mailIcn,
                  ),
                  color: ColorPalette.generalGreyColor,
                ),
              ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: passwordController,
                isPassword: true,
                maxLines: 1,
                hint: "Password",
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your password";
                  }
                  if (!Validations.validatePassword(value)) {
                    return "plz enter your a valid password";
                  }
                  return null;
                },
                prefixIcon: const ImageIcon(
                  AssetImage(
                    AppAssets.lockIcn,
                  ),
                  color: ColorPalette.generalGreyColor,
                ),
              ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                isPassword: true,
                maxLines: 1,
                hint: "Re-Password",
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your password";
                  }
                  if (value != passwordController.text) {
                    return "re-password not match.";
                  }
                  return null;
                },
                prefixIcon: const ImageIcon(
                  AssetImage(
                    AppAssets.lockIcn,
                  ),
                  color: ColorPalette.generalGreyColor,
                ),
              ).setOnlyPadding(context, 0.015, 0.0, 0.0, 0.0),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseAuthFunction.createAccount(
                      emailAddress: emailController.text,
                      password: passwordController.text,
                    ).then(
                          (value) {
                        EasyLoading.dismiss();
                        if (value==true) {
                          navigatorKey.currentState!.pushNamedAndRemoveUntil(
                            PagesRouteName.signIn,
                                (route) => false,
                          );
                        }
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Text(
                  "Register",
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: ColorPalette.white),
                ).setVerticalPadding(context, 0.015),
              ).setVerticalPadding(context, 0.025),
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
                    onPressed: () {
                      navigatorKey.currentState!.pop();
                    },
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
          ]
        ),
      )
      );
  }
}
