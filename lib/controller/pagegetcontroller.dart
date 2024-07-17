import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class PageGetController extends GetxController{
  int index = 0;
  int pricingindex = 0;
 ItemScrollController? scrollController;
  bool menu = false;
  bool showlogin = false;
  int authpage = 0;
  @override
  void onInit() {
  
    super.onInit();
    scrollController = ItemScrollController();
  }
  


  void setscrollcontroller(ItemScrollController controller){
        scrollController = controller;
        update();
  }
  void changeindex(int i){
      index = i;
      update();
  }

  void changePricingindex(int i){
    pricingindex = i;
    update();
  }
  void changeauthIndex(int index){
      authpage = index;
      update();
  }
  void changeMenu(){
    menu = !menu;
    update();
  }

  void changeshowLogin(){
    showlogin = !showlogin;
    update();
  }
        void changeScrolltoScreen(int index) {
    debugPrint("in scroll control");
    scrollController!.scrollTo(
        index: index % 5,
        duration: const Duration(seconds: 2),
        curve: Curves.easeInOutCubic);
  }
  

}