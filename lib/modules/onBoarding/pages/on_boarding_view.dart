// import 'package:evently_app/core/themes/color_pallete.dart';
// import 'package:flutter/material.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../../../core/constants/app_assets.dart';
// import '../../../core/services/LocalStorageKeys.dart';
// import '../../../core/services/localstorage.dart';
// import '../../layout/layout_page.dart';
// import '../models/on-boardingmodel.dart';
// import '../widgets/onboarding-item.dart';
//
// class OnBoardingView extends StatefulWidget {
//
//   const OnBoardingView({super.key});
//
//   @override
//   State<OnBoardingView> createState() => _OnBoardingViewState();
// }
//
// class _OnBoardingViewState extends State<OnBoardingView> {
//   var activeIndex=0;
//   var  controller = PageController();
//   @override
//   void initState() {
//     super.initState();
//     LocalStorageServices.setBool(LocalStoragekey.isFirstTimeRun, false);
//   }
//   @override
//   Widget build(BuildContext context) {
//     var size= MediaQuery.of(context).size;
//     return  Scaffold(
//       backgroundColor: ColorPalette.white,
//       body:SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Image.asset(AppAssets.Eventlylogo,
//                 height: size.height*0.25,
//               ),
//               Expanded(
//                   child: PageView.builder(
//                     controller: controller,
//                     onPageChanged: (index){
//                       activeIndex=index;
//                       setState(() {});
//                     },
//                     itemCount: OnboardingModel.onboardingList.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       var onboardingModel= OnboardingModel.onboardingList[index];
//                       return OnboardingItem(onboardingModel: onboardingModel);
//                     },
//                   )
//               ),
//               Row(
//                 children: [
//                   Visibility(
//                     visible: activeIndex!=0,
//                     replacement: Spacer(),
//                     child: TextButton(
//                         onPressed:(){
//                           controller.previousPage(
//                               duration:
//                               Duration(
//                                   microseconds: 500
//                               ),
//                               curve: Curves.easeInOut
//                           );
//                           if(activeIndex>0) {
//                             activeIndex--;
//                           }
//                         },
//                         child: Text(
//                           "Back",
//                           style: TextStyle(
//                               color: ColorPalette.primaryColor,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold
//                           ),
//                         )
//                     ),
//                   ),
//                   Spacer(),
//                   AnimatedSmoothIndicator(
//                     activeIndex: activeIndex,
//                     count: OnboardingModel.onboardingList.length,
//                     effect: ExpandingDotsEffect(
//                       activeDotColor: ColorPalette.primaryColor,
//                       dotColor: Colors.grey,
//                       dotHeight: 10,
//                       dotWidth: 10,
//                     ),
//                   ),
//                   Spacer(),
//                   TextButton(
//                       onPressed:(){
//                         if(activeIndex==OnboardingModel.onboardingList.length-1){
//                           Navigator.of(context).push(
//                               MaterialPageRoute(
//                                 builder: (context) => const LayoutPage() ,
//                               )
//                           );
//                         }
//                         controller.nextPage(
//                             duration:
//                             Duration(
//                                 microseconds: 500
//                             ),
//                             curve: Curves.easeInOut
//                         );
//                         if(activeIndex<OnboardingModel.onboardingList.length) {
//                           activeIndex++;
//                         }
//                       },
//                       child: Text(
//                         activeIndex==OnboardingModel.onboardingList.length-1
//                             ?"Finish"
//                             :"Next",
//                         style: const TextStyle(
//                             color: ColorPalette.primaryColor,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold
//                         ),
//                       )
//                   )
//                 ],
//               ),
//               SizedBox(height: 16,)
//
//             ],
//           ),
//         ),
//       ),
//     );
//
//   }
// }
