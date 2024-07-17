

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/domains/repository/authenticationrepo.dart';
import 'package:gymwebapp/domains/usecase/usecasesimpl.dart';
import 'package:gymwebapp/models/authenticationrepoimpl.dart';
import 'package:gymwebapp/pages/dashboards/dashboard.dart';


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
  
  void loginpagehandler({required bool isadmin}) {
    _isadminlogin = isadmin;
    update();
  }


  void authenticate(String username,String pass) async{

      //check the login username and user password
    await authenticationOptions.loginauth(username, pass).then((value){
      user = value;
      update();
      if(user!=null){
      print(user!.uname);
      // ignore: use_build_context_synchronously
      context.router.push(DashboardRoute(uid:value?.uid));
      }else{
        print("user null");
      }
    });
 

  }

  void confirmotp(String phone){

   context.router.push(PaymentPage(args: phone,));

  }



}
