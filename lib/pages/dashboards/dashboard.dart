import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gymwebapp/widget/actionbutton.dart';
import 'package:gymwebapp/widget/cardwithshadow.dart';
import 'package:gymwebapp/widget/normaltext.dart';
import 'package:gymwebapp/widget/titletext.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, this.uid});
  final String? uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Row(children: [
        SizedBox(
          width: 300,
          child: CardWithShadow(
            margin: EdgeInsets.all(16),
    
            child: Column(

              children: [
                SizedBox(height: 100,width: 100,child: Image.asset('assets/images/logo.png'),),
                Expanded(child: Column(
                  children: [
                    SizedBox(width: double.maxFinite,child: CardWithShadow(child: NormalText(text: "Home",size: 16,),margin: EdgeInsets.all(8),padding: EdgeInsets.all(24),),),
                    SizedBox(width: double.maxFinite,child: CardWithShadow(child: NormalText(text: "Renew",size: 16,),margin: EdgeInsets.all(8),padding: EdgeInsets.all(24),),),
                    SizedBox(width: double.maxFinite,child: CardWithShadow(child: NormalText(text: "Pay monthly fees",size: 16,),margin: EdgeInsets.all(8),padding: EdgeInsets.all(24),),),
                    SizedBox(width: double.maxFinite,child: CardWithShadow(child: NormalText(text: "Settings",size: 16,),margin: EdgeInsets.all(8),padding: EdgeInsets.all(24),),),
                  ],
                ))
              ],
            ))),
    Expanded(
          flex:1, 
          child: Column(

              children: [
           SizedBox(
            height: 100,
            width: double.maxFinite,
             child: CardWithShadow(
              color: Colors.transparent,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.zero,
       
              child: Row(
            
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleText(text:"Membership",size: 20,),
                        NormalText(text:"General",size: 16,),
                      ],
                    ),
                  ),

                       Expanded(
                         child: Column(
                                             crossAxisAlignment: CrossAxisAlignment.start,
                                             children: [
                                               TitleText(text:"Pricing",size: 20,),
                                               NormalText(text:"3 Months",size: 16,),
                                             ],
                                           ),
                       ),

                   
                ],
              )),
           ),

                      Expanded(
                        child: SizedBox(
                          width: double.maxFinite,
                          child: CardWithShadow(
                           margin:EdgeInsets.zero,
                           color: Colors.transparent,
                           child: Row(
                             children: [
                               Expanded(
                                flex: 2,
                                 child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 
                                      SizedBox(height: 150,width: double.maxFinite,
                                      child: CardWithShadow(
                                           margin: EdgeInsets.all(16),
                                            padding: EdgeInsets.all(16),
                                        isshadow: true,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                                       crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: [
                                                         TitleText(text:"Renewal",size: 20,),
                                                         NormalText(text:"2 weeks remaining",size: 16,),
                                                       ],
                                                     ),

                                            ActionButton(onpress: (){}, text: "Renew",padding: EdgeInsets.all(24),)

                                          ],
                                        ),),
                                      ),
                                 
                                             SizedBox(height: 150,width: double.maxFinite,
                                      child: CardWithShadow(
                                           margin: EdgeInsets.all(16),
                                            padding: EdgeInsets.all(16),
                                        isshadow: true,
                                        child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     TitleText(text:"Renewal",size: 20,),
                                                     NormalText(text:"2 weeks remaining",size: 16,),
                                                   ],
                                                 ),),
                                      ),
                                 
                                             SizedBox(height: 150,width: double.maxFinite,
                                      child: CardWithShadow(
                                        margin: EdgeInsets.all(16),
                                        padding: EdgeInsets.all(16),
                                        isshadow: true,
                                        child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: [
                                                     TitleText(text:"Renewal",size: 20,),
                                                     NormalText(text:"2 weeks remaining",size: 16,),
                                                   ],
                                                 ),),
                                      ),
                                 
                                 ],),
                               ),
                               Expanded(
                                child: SizedBox())
                             ],
                           )),
                        ),
                      ),
              ],

          )),
        
        
        ],),

    );
  }
}