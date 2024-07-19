
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/controller/pagegetcontroller.dart';
import 'package:gymwebapp/controller/tapcontroller.dart';
import 'package:gymwebapp/router/router.gr.dart';
import 'package:gymwebapp/widget/normaltext.dart';

import '../../../../domains/usecase/usecasesimpl.dart';
import '../../../../widget/textformwidget.dart';
import '../../../../widget/titletext.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key,

  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();

        final TextEditingController _otp1 = TextEditingController();
  final TextEditingController _otp2 = TextEditingController();
  final TextEditingController _otp3 = TextEditingController();
  final TextEditingController _otp4 = TextEditingController();
  final TextEditingController _phonecontroller = TextEditingController();
  final FocusNode _passwordfocus = FocusNode();
  final FocusNode _confirmpasswordfocus = FocusNode();
  final FocusNode _phonefocus = FocusNode();
  final FocusNode _emailfocus = FocusNode();
  final FocusNode _namefocus = FocusNode();

  final FocusNode _otpfocus1 = FocusNode();
  final FocusNode _otpfocus2 = FocusNode();
  final FocusNode _otpfocus3= FocusNode();
  final FocusNode _otpfocus4 = FocusNode();
  final AuthenticateUseCase _authUseCases = AuthenticateUseCase();
  bool otpshow = false;
 
  bool validateform(){ 
    return _formkey.currentState!.validate();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _namefocus.requestFocus();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    _confirmpasswordcontroller.dispose();
    _phonecontroller.dispose();
    _passwordfocus.dispose();
    _confirmpasswordfocus.dispose();
    _phonefocus.dispose();
    _emailfocus.dispose();

    _otpfocus1.dispose();
    _otpfocus2.dispose();
    _otpfocus3.dispose();
    _otpfocus4.dispose();

    _otp1.dispose();
    _otp2.dispose();
    _otp3.dispose();
    _otp4.dispose();
  }

  @override
  Widget build(BuildContext context) {
 

    return GetBuilder<PageGetController>(
      builder: (pagectrl) {
        return GetBuilder<GetxTapController>(
          builder: (tapcontrol) {
            return Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              // color: Theme.of(context).colorScheme.primary,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width>300?400 : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     MediaQuery.sizeOf(context).width<600?const TitleText(text: "fhdj",):const SizedBox(),
              const SizedBox(
                                          height: 30,
                                        ),
                  const Text(
                                          'Sign Up',
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                    Form(
                        key: _formkey,
                        child: Column(
                          children: [
                              
                            // TextFieldWidget(
                            //   hint: "Full Name",
                            //   icon: const Icon(Icons.person),
                            //   controller: _namecontroller,
                            //   focusnode: _namefocus,
                            //   nextfocusnode: _emailfocus,
                            //   validator: () {
                            //     return _authUseCases
                            //         .nameAuth(_namecontroller.text.trim());
                            //   },
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // TextFieldWidget(
                            //   hint: "Email",
                            //     icon: const Icon(Icons.mail),
                            //   controller: _emailcontroller,
                            //   focusnode: _emailfocus,
                            //   nextfocusnode: _phonefocus,
                            //   validator: () {
                            //     return _authUseCases
                            //         .emailAuth(_emailcontroller.text.trim());
                            //   },
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                          otpshow?const SizedBox():TextFieldWidget(
                              hint: "Phone",
                              icon: const Icon(Icons.phone),
                              controller: _phonecontroller,
                              focusnode: _phonefocus,
                              nextfocusnode: _passwordfocus,
                              validator: () {
                                return _authUseCases
                                    .phoneAuth(_phonecontroller.text.trim());
                              },
                            ),
                           SizedBox(
                              height:otpshow?0:20,
                            ),

                            otpshow?Column(
                              children: [
                                const NormalText(text: "We have send an OTP to your number",size: 16,).animate().slideY(begin: 1,end: 0),
                                const SizedBox(height: 5,),
                                NormalText(text:_phonecontroller.text,size: 20,).animate().slideY(begin: 1,end: 0),
                              
                              ],
                            ):SizedBox(),
                           otpshow? Center(
                             child: ConstrainedBox(
                                constraints: const BoxConstraints(maxWidth: 300),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: TextFieldWidget(hint: 'OTP', controller:_otp1,align: TextAlign.center,),
                                ),
                              ),
                           ):const SizedBox(),
                            // TextFieldWidget(
                            //   hint: "Password",
                            //   focusnode: _passwordfocus,
                            //   icon: const Icon(Icons.lock),
                            //   obscure: true,
                            //   interactivetext: false,
                            //   nextfocusnode: _confirmpasswordfocus,
                            //   controller: _passwordcontroller,
                            //   validator: () {
                            //     return _authUseCases
                            //         .passwordAuth(_passwordcontroller.text.trim());
                            //   },
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // TextFieldWidget(
                            //   hint: "Confirm Password",
                            //   focusnode: _confirmpasswordfocus,
                            //   icon: const Icon(Icons.lock),
                            //   obscure: true,
                            //   autovalidateMode: AutovalidateMode.disabled,
                            //   interactivetext: false,
                            //   fieldsubmitted: () async {
                            //     bool v = await validateform(
                               
                            //         _emailcontroller.text,
                            //         _passwordcontroller.text,
                            //         _phonecontroller.text,
                            //         _namecontroller.text);
                                            
                            // // pageprov.changePage(v?0:1);
                              
                            //   },
                            //   controller: _confirmpasswordcontroller,
                            //   validator: () {
                            //     return _confirmpasswordcontroller.text !=
                            //             _passwordcontroller.text
                            //         ? 'Must be same with password'
                            //         : null;
                            //   },
                            // ),
                                    
                              const SizedBox(
                                      height: 20,
                                    ),
                          ],
                        )),
                                             MaterialButton(
                      onPressed: () async {
                       if(otpshow){
                          if(  tapcontrol.confirmotp(_otp1.text)){
                            context.router.push(PaymentPage(args: _phonecontroller.text));
                          }  
                       }else{
                              if(validateform()){
                              tapcontrol.sendotp(_phonecontroller.text);
                               if(!otpshow){
                                    _otpfocus1.requestFocus();
                                }
                              setState(() {
                                otpshow = true;
                              });
                          }else{
                            debugPrint("Not in otpshow");
                          }
                       }
                                       
                     
            
                      
                      },
                      color: Theme.of(context).colorScheme.secondary,
                      minWidth: double.infinity,
                      padding: const EdgeInsets.all(16),
                      child: Text(otpshow?"Confirm OTP":'Send OTP',
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
                                "Already have an Account?",
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
                                onTap: () {
                                  pagectrl.changeauthIndex(0);
                                },
                                child: Text('Log In',
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
            );
          }
        );
      }
    );
  }
}
