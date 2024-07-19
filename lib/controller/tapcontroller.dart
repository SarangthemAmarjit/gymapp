import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/domains/repository/authenticationrepo.dart';
import 'package:gymwebapp/domains/usecase/usecasesimpl.dart';
import 'package:gymwebapp/models/authenticationrepoimpl.dart';



import '../domains/usecase/domainusecases.dart';
import '../models/usermodel.dart';
import '../router/router.gr.dart';

class GetxTapController extends GetxController
    with GetSingleTickerProviderStateMixin{
  final BuildContext context;

  GetxTapController({required this.context});
  //table

  final AuthenticationRepo authenticationOptions = AuthenticationrepoImpl();
  bool _isadminlogin = false;
  bool auth = false;
  User? user;
  bool get isadminlogin => _isadminlogin;
  final AuthUseCases authusecase = AuthenticateUseCase();
  int otp = 1234;
  void loginpagehandler({required bool isadmin}) {
    _isadminlogin = isadmin;
    update();
  }


  void authenticate(String username,String pass) async{

      //check the login username and user password
    await authenticationOptions.loginauth(username, pass).then((value){
      
      update();
  
      print(value);
   
      context.router.push(DashboardRoute(uid:"290"));

    });
  }


  void sendotp(String phone){
    int rand = Random().nextInt(9000) + 1000;
    otp = rand;
    authenticationOptions.sendOTP(rand.toString(), "10",phone);
    
  }

  bool confirmotp(String confirmotp){
    if(confirmotp == otp.toString()){
        return true;
    }
    return false;
  }



}
