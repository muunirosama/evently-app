import 'package:evently_app/core/routes/pages_routes_name.dart';
import 'package:evently_app/core/themes/color_pallete.dart';
import 'package:evently_app/core/utlis/firebase-services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    var mediaQuery= MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AppAssets.Eventlylogo,
          height: mediaQuery.size.height * 0.25,
          ),
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
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
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
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
              suffixIcon:IconButton(
                icon: Icon(
                  isObscure?Icons.visibility_off:Icons.visibility
                ),
                onPressed:(){
                  setState(() {
                    isObscure = ! isObscure;
                  });
                },
              ),
          ),
            obscureText: isObscure,
        )
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(onPressed: (){
              Navigator.pushNamed(context,
                  PagesRouteName.layoutPage
             );
            },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ColorPalette.primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)
                  )
                ),
                child: const Text("login",
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
    );
  }
}
