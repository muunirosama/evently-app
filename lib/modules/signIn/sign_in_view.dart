import 'package:evently_app/core/extensions/Padding.dart';
import 'package:evently_app/core/routes/pages_routes_name.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../core/constants/app_assets.dart';
import '../../core/extensions/validtions.dart';
import '../../core/services/FirebaseAuth.dart';
import '../../core/widgets/custom_text_field.dart';
import '../../main.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery= MediaQuery.of(context);
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.Eventlylogo,
            height: mediaQuery.size.height * 0.25,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: _emailController,
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
              ).setOnlyPadding(context, 0.03, 0.015, 0.0, 0.0),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomTextField(
                controller: _passwordController,
                isPassword: true,
                maxLines: 1,
                hint: "Password",
                hintColor: ColorPalette.generalGreyColor,
                onValidate: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "plz enter your email address";
                  }
                  return null;
                },
                prefixIcon: const ImageIcon(
                  AssetImage(
                    AppAssets.lockIcn,
                  ),
                  color: ColorPalette.generalGreyColor,
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(onPressed: (){
                Navigator.pushNamed(context,
                    PagesRouteName.forgetPassword
                );
              },
                  child: const Text("Forget Password ?",
                  style: TextStyle(
                    color: ColorPalette.primaryColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorPalette.primaryColor,
                  ),
                  )
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    FirebaseAuthFunction.login(
                        emailAddress: _emailController.text,
                        password: _passwordController.text)
                        .then(
                          (value) {
                        EasyLoading.dismiss();
                        if (value) {
                          navigatorKey.currentState!.pushNamedAndRemoveUntil(
                            PagesRouteName.layoutPage,
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
                    )),
                child: Text(
                  "Login",
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: ColorPalette.white),
                ).setVerticalPadding(context, 0.015),
              ).setVerticalPadding(context, 0.025),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context,
                          PagesRouteName.signUp
                      );
                    },
                  child: const Text("Create account",
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: ColorPalette.primaryColor,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
              Text("OR",
                style: TextStyle(
                  color: ColorPalette.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: ColorPalette.primaryColor,
                      indent: 20,
                      endIndent: 20,
                    ),
                  ),
              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
              child: ElevatedButton(onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: ColorPalette.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                          color:  ColorPalette.primaryColor,
                        )
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppAssets.googleIcn, height: 25,),
                       const SizedBox(width: 10,),
                       const Text("login with Google",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorPalette.primaryColor,
                            fontSize: 18
                        ),
                      ),
                    ],
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}

