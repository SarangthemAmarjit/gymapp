import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/config/colors.dart';
import 'package:gymwebapp/controller/tapcontroller.dart';

import 'package:gymwebapp/widget/actionbutton.dart';
import 'package:gymwebapp/widget/cardwithshadow.dart';
import 'package:gymwebapp/widget/normaltext.dart';

import 'package:gymwebapp/widget/textformwidget.dart';
import 'package:gymwebapp/widget/titletext.dart';


@RoutePage()
class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, this.args});
  final String? args;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if(widget.args==null){
    context.router.pushNamed('/');
    }
    return GetBuilder<GetxTapController>(
      builder: (tapcontrol) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.primary,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Center(
                child: SizedBox(
                  height: 500,
                  width: 400,
                  child: CardWithShadow(
                    padding: const EdgeInsets.all(16),
                    color:const Color.fromARGB(255, 44, 42, 42),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(text: "Create User",size: 20,),
                       const  SizedBox(height: 20,),
                        //body
                          Expanded(child: Form(
                            key: form,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFieldWidget(hint: "Phone", controller:TextEditingController(text: widget.args.toString()) ,icon: const Icon(Icons.phone),enablefield: false,),
                                     const SizedBox(height: 10,),
                                TextFieldWidget(hint: "Username", controller:username ,icon: const Icon(Icons.person),),
                                const SizedBox(height: 10,),
                                TextFieldWidget(hint: "Password", controller:password ,icon:const  Icon(Icons.lock),obscure: true,),
                                 const SizedBox(height: 10,),
                                TextFieldWidget(hint: "Confirm Password", controller:confirmpassword,icon:const Icon(Icons.lock),obscure: true,
                                ),
        
                              ],
                            ),
                          )),
                        //pay button
                        CardWithShadow(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                         padding: const EdgeInsets.all(16),
                          isshadow: true,
                          isGradient: true,
                          color: blackalt,
                          child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            NormalText(text: "Admission",size: 14,),
                            TitleText(text: "Rs 1200",size: 18,)
                          ],
                        )),
                        ActionButton(
                          padding: const EdgeInsets.all(24),
                          onpress: (){
        
                                tapcontrol.initNdpsPayment(context: context, responseHashKey: tapcontrol.responseHashKey, responseDecryptionKey: tapcontrol.responseDecryptionKey, name: "tomvba", amount: "200", address: "23464");
                                // if(form.currentState!.validate()){
                                //   if(password.text == confirmpassword.text){
                                //       //paymentsss
                                      
                                //   }
                                // }
        
                          }, text:"Pay Now")
                      ],
                    ),
                    
                    
                    ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}