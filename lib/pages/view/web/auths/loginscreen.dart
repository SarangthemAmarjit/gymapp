import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/controller/pagegetcontroller.dart';
import 'package:gymwebapp/controller/tapcontroller.dart';
import 'package:gymwebapp/domains/usecase/domainusecases.dart';
import 'package:gymwebapp/domains/usecase/usecasesimpl.dart';

import '../../../../widget/textformwidget.dart';
import '../../../../widget/titletext.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
 
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();
  final AuthUseCases _useCases = AuthenticateUseCase();

Future<bool> validateform(String email,String pass)  async{
    
  return _formkey.currentState!.validate();
  }



@override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) { 
          Get.find<GetxTapController>();
        
          _emailfocus.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _passwordfocus.dispose();
    _emailfocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageGetController>(
      builder: (pagectrl) {
        return GetBuilder<GetxTapController>(
          builder: (tapcontroller) {
            return Container(
            
              padding: const EdgeInsets.all(16),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    MediaQuery.sizeOf(context).width<600?const TitleText(text: "Something",):const SizedBox(),
                  Expanded(
                    child: SizedBox(
                      
                      width:MediaQuery.sizeOf(context).width>300?400:null,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Log In',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  TextFieldWidget(
                                    hint: "Username",
                                      icon: const Icon(Icons.mail),
                                    controller: _emailcontroller,
                                    focusnode: _emailfocus,
                                    nextfocusnode: _passwordfocus,
                                    validator: () {
                                      return tapcontroller.authusecase
                                          .emailAuth(_emailcontroller.text.trim());
                                    },
                                  ),
                    
                                  const SizedBox(
                                    height: 20,
                                  ),
                    
                                  TextFieldWidget(
                                    hint: "Password",
                                    focusnode: _passwordfocus,
                                    icon: const Icon(Icons.lock),
                                    obscure: true,
                                    
                                    fieldsubmitted:()  async{
                                   await validateform(_emailcontroller.text,_passwordcontroller.text).then((v){
                                    if(v){
                                      tapcontroller.authenticate(_emailcontroller.text,_passwordcontroller.text);
                                    }

                                   });
                                     
                                      
                                    
                                    },
                                    controller: _passwordcontroller,
                                    validator: () {
                                      return tapcontroller.authusecase.passwordAuth(
                                          _passwordcontroller.text.trim());
                                    },
                                  ),
                                  
                                ],
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          FittedBox(
                            alignment: Alignment.bottomLeft,
                            fit: BoxFit.fitWidth,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: (){
                                    pagectrl.changeauthIndex(2);
                                  },
                                  child: Text(
                                    "Forgot Password?",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Theme.of(context).colorScheme.secondary),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            disabledColor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                            onPressed:()async{
                                         await validateform(_emailcontroller.text,_passwordcontroller.text).then((v){
                                    if(v){
                                      tapcontroller.authenticate(_emailcontroller.text,_passwordcontroller.text);
                                    }

                                   });
                            },
                            color: Theme.of(context).colorScheme.secondary,
                            minWidth: double.infinity,
                            padding:const EdgeInsets.all(16),
                            child:false?const CircularProgressIndicator(color: Colors.white,backgroundColor: Colors.transparent,):const Text('Log in',
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .surface
                                        .withOpacity(0.6)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                 pagectrl.changeauthIndex(1);
                                },
                                child: Text('Sign Up',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context).colorScheme.secondary,
                                    )),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}
