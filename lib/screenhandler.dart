import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/controller/pagegetcontroller.dart';
import 'package:gymwebapp/controller/tapcontroller.dart';
import 'package:gymwebapp/pages/view/web/contact/contact.dart';
import 'package:gymwebapp/pages/view/web/gallery/galleryscreen.dart';
import 'package:gymwebapp/pages/view/web/home/landingpage.dart';
import 'package:gymwebapp/pages/view/web/pricing/pricing.dart';
import 'package:gymwebapp/pages/view/web/services/services.dart';
import 'package:gymwebapp/router/router.gr.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'widget/actionbutton.dart';
import 'widget/normaltext.dart';

@RoutePage()
class ScreenHandlerPage extends StatefulWidget {
  const ScreenHandlerPage({super.key});

  @override
  State<ScreenHandlerPage> createState() => _ScreenHandlerPageState();
}

class _ScreenHandlerPageState extends State<ScreenHandlerPage> with TickerProviderStateMixin{

  // List<Widget>  screens = const [LandingPage(),PricingScreen(),ServicesScreen(),ContactUsScreen()];
 ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  AnimationController? landingcontroller;
  AnimationController? pricingcontroller;
  AnimationController? servicecontroller;
  AnimationController? contactcontroller;



  @override
  void initState() {
    super.initState();
    Get.put(PageGetController()).onInit();
    Get.put(GetxTapController(context: context)).onInit();


 
  }


@override
  void dispose() {
    landingcontroller!.dispose();
    pricingcontroller!.dispose();
    servicecontroller!.dispose();
    contactcontroller!.dispose();
 landingcontroller!.forward();
    super.dispose();
  }

  void changeScrolltoScreen(int index){

    debugPrint("in scroll control");
    itemScrollController.scrollTo(
  index:index%4,
  duration: const Duration(seconds: 2),
  curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    // final PageGetController page = Get.put(PageGetController());
    // var width = MediaQuery.of(context).size.width;
    // itemPositionsListener.itemPositions.addListener(() {
    //   //  print(
    //   //     '====current first ${itemPositionsListener.itemPositions.value.first.index}====');
    //       page.changeindex(itemPositionsListener.itemPositions.value.last.index);

    //       if(page.index==0){
    //         if(landingcontroller!=null){
    //           debugPrint("In Animated");

    //           if(landingcontroller!.isDismissed || landingcontroller!.isCompleted ){
    //              debugPrint("In Animated reset and forward");

    //            landingcontroller!.forward();
    //           }else{
    //                         debugPrint("In Animated forward");
    //             landingcontroller!.forward();
    //           }
    //         }
         
    //       }else  if(page.index==1){
    //         if(pricingcontroller!=null){
    //           debugPrint("In Animated");

    //           if(pricingcontroller!.isDismissed || pricingcontroller!.isCompleted ){
    //              debugPrint("In Animated reset and forward");

    //                 pricingcontroller!.forward();
    //           }else{
    //                         debugPrint("In Animated forward");
    //               pricingcontroller!.forward();
    //           }
    //         }
         
    //       }else  if(page.index==2){
    //         if(servicecontroller!=null){
    //           debugPrint("In Animated");

    //           if(servicecontroller!.isDismissed ||servicecontroller!.isCompleted ){
    //              debugPrint("In Animated reset and forward");
              
    //             servicecontroller!.forward();
    //           }else{
    //                         debugPrint("In Animated forward");
    //               servicecontroller!.forward();
    //           }
    //         }
         
    //       }else{
    //         if(contactcontroller!=null){
    //           debugPrint("In Animated");

    //           if(contactcontroller!.isDismissed || landingcontroller!.isCompleted ){
    //              debugPrint("In Animated reset and forward");
              
    //             contactcontroller!.forward();
    //           }else{
    //                         debugPrint("In Animated forward");
    //               contactcontroller!.forward();
    //           }
    //         }
         
    //       }


    //       print(
    //       '====current last ${itemPositionsListener.itemPositions.value.last.index}====');
    // },);

    return Scaffold(
      body: GetBuilder<PageGetController>(
        builder: (pagetcontroller) {
          return Container(
          
            decoration:  BoxDecoration(
              color: Theme.of(context).colorScheme.primary
              // color: Theme.of(context).colorScheme.
              // gradient: LinearGradient(
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   colors: [
              //     Color(0xFFfbc2eb),
              //     Color.fromARGB(255, 208, 192, 247),
              //     Color.fromARGB(255, 209, 218, 244),
              //   ],
              // ),
            ),
            child: Column(
              children: [
          //                Container(
          // height: 80,
          // padding:const EdgeInsets.symmetric(vertical: 16,horizontal: 32),
          // color:Theme.of(context).colorScheme.primary.withOpacity(0.4),
          // child: Row(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     SizedBox(
          //       width: 100,
          //       child: Image.asset('assets/images/logo.png',fit: BoxFit.contain,),
          //     ),
          //     Row(
          //       children: [
          //         InkWell(
          //           onTap: (){
          //             // changeScrolltoScreen(0);
          //           },
          //           child: NormalText(text: "Home".toUpperCase(),color: pagetcontroller.index == 0?Theme.of(context).colorScheme.secondary:null,),),
          //            const  SizedBox(width: 40,),
          //         InkWell(
          //           onTap: (){
          //             // changeScrolltoScreen(1);
          //           },
          //           child: NormalText(text: "Pricing".toUpperCase(),color: pagetcontroller.index == 1?Theme.of(context).colorScheme.secondary:null,)),
          //                 const  SizedBox(width: 40,),
          //         InkWell(
          //           onTap: (){
          //             // changeScrolltoScreen(2);
          //           },
          //           child: NormalText(text: "Services".toUpperCase(),color: pagetcontroller.index == 2?Theme.of(context).colorScheme.secondary:null,)),
          //            const  SizedBox(width: 40,),
          //         InkWell(
          //           onTap: (){
          //             // changeScrolltoScreen(3);
          //           },
          //           child: NormalText(text: "Contact Us".toUpperCase(),color: pagetcontroller.index == 3?Theme.of(context).colorScheme.secondary:null,)),
          //            const  SizedBox(width: 40,),
          
          //       ],
          //     ),
          //             ActionButton(onpress: (){
          //                 context.router.pushNamed("/WebLoginPage");

          //             }, text:"Register")
          
          //   ],
          // ),
          //     ),
                // Expanded(
                //   child: SingleChildScrollView(
                  
                //     child: 
                //     // Padding(
                //       // padding: EdgeInsets.symmetric(horizontal: width < 600 ? 20 : 40),
                //       // padding: EdgeInsets.zero,
                //       // child: LayoutBuilder(
                //       //   builder: (context, constraints) {
                //       //     // if (constraints.maxWidth < 600) {
                //       //     //   // Mobile layout
                //       //     //   return const MobileLoginPage();
                //       //     // } else {
                //       //     //   // Web layout
                //       //     //   return const WebLoginPage();
                //       //     // }
                                  
                //       //     return 
                //           Column(
                //             children: [
                     
                //               LandingPage(keys: _landing),
                  
                //               PricingScreen(keys: _pricing,),
                  
                //               ServicesScreen(keys:_service,),
                              
                //               ContactUsScreen(keys: _contact,), 
                //               SizedBox(
                //                 height: 700,
                //                 child: WebLoginPage()),
                //             ],
                //           )
                //     //     },
                //     //   ),
                //     // ),
                //   ),
                // ),
          
                Expanded(
                  child: ScrollablePositionedList.builder(
                    
                    itemScrollController: pagetcontroller.scrollController,
                    initialScrollIndex: 0,
                      itemCount: 5,
                      itemBuilder: (context, index) =>index == 0?LandingPage():index==1?PricingScreen():index==2?const ServicesScreen():index==3?const GalleryScreen():const ContactUsScreen() ,
                  ),
                )
          
              ],
            ),
          );
        }
      ),
    );
  }
}