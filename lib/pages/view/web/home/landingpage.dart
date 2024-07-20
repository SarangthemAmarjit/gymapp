import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/config/const.dart';
import 'package:gymwebapp/controller/pagegetcontroller.dart';
import 'package:gymwebapp/pages/view/web/auths/forgotpasswordscreen.dart';
import 'package:gymwebapp/pages/view/web/auths/loginscreen.dart';
import 'package:gymwebapp/pages/view/web/auths/signup.dart';
import 'package:gymwebapp/pages/view/web/services/services.dart';
import 'package:gymwebapp/widget/actionbutton.dart';
import 'package:gymwebapp/widget/cardwithshadow.dart';

import 'package:flutter_animate/flutter_animate.dart';
import 'package:gymwebapp/widget/navbar/navbarwidget.dart';
import 'package:gymwebapp/widget/responsivecontainer/responsivecontainer.dart';
import '../../../../widget/overlaycard.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key, 
  });
  // final Function(GlobalKey) changescroll;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageGetController>(
      builder: (pagecontroller) {
        return Container(
          height: MediaQuery.sizeOf(context).width<700?pagecontroller.menu?700: 500:800,
          child:Stack(
              children: [
                Positioned.fill(
                    child: OverlayCard(
                  child: Image.asset(
                    'assets/images/first.jpg',
                    fit: BoxFit.cover,
                  ).animate().fadeIn(),
                )),
                Column(
                  children: [
                    NavBar(pagetcontroller: pagecontroller,),
                    Expanded(
                      child: Responsivecontainer(
                        // child2: Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     // NavBar(keyss:changescroll),
                        //     Expanded(
                        //       child: Padding(
                        //         padding: const EdgeInsets.all(40),
                        //         child: Column(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           crossAxisAlignment: CrossAxisAlignment.start,
                        //           children: [
                        //             Text(
                        //               "Welcome to Xtreme Fitness",
                        //               style: TextStyle(
                        //                   fontSize: 20,
                        //                   fontWeight: FontWeight.bold,
                        //                   color:
                        //                       Theme.of(context).colorScheme.secondary),
                        //             ).animate().fade(duration: Durations.extralong1),
                        //             FittedBox(
                        //                 child: Text(
                        //               subtext
                        //                   .toUpperCase(),
                        //               style: const TextStyle(
                        //                   fontSize: 40, fontWeight: FontWeight.bold),
                        //             )).animate().slideX(begin: -1,end: 0,
                        //               duration: Durations.extralong1),
                        //               FittedBox(
                        //                 child: Text(
                        //               "Xtreme Fitness"
                        //                   .toUpperCase(),
                        //               style: TextStyle(
                        //                   fontSize: 40, fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.secondary),
                        //             )).animate().slideX(begin: -1,end: 0,
                        //               duration: Durations.extralong1),
                        //             const SizedBox(
                        //               height: 40,
                        //             ),
                        //             Row(
                        //               crossAxisAlignment: CrossAxisAlignment.center,
                        //               children: [
                        //                 ActionButton(
                        //                     onpress: () {
                        //                       pagecontroller.changeScrolltoScreen(1);
                        //                     }, text: "Get Started"),
                        //               ],
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        child1:Center(
                          child:pagecontroller.showlogin?pagecontroller.authpage==1?SignUpPage().animate().slideX(begin: 1,end: 0,duration: Durations.extralong1).fade():pagecontroller.authpage==2?ForgotPassWordScreen().animate().slideX(begin: 1,end: 0,duration: Durations.extralong1).fade():LoginScreen().animate().slideX(begin: 1,end: 0,duration: Durations.extralong1).fade() :SizedBox(
                            height: 300,
                            width: 300,
                            child: CardWithShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.alarm,
                                      size: 20,
                                    ),
                                    // Text("GYM TIMING",style: TextStyle(fontSize: 24),),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "MORNING",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "5 AM - 11 AM",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "EVENING",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "3 PM - 8 PM",
                                      style: TextStyle(fontSize: 24),
                                    ),
                                  ],
                                )).animate().scaleXY(begin: 0,end: 1,duration: Durations.extralong1).fade(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          
        );
      }
    );
  }
}