import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/controller/pagegetcontroller.dart';
import 'package:gymwebapp/widget/overlaycard.dart';
import 'package:gymwebapp/widget/pricingcard.dart';

import '../../../../widget/actionbutton.dart';
import '../../../../widget/cardwithshadow.dart';


class PricingScreen extends StatelessWidget {
  const PricingScreen({super.key});
 
  @override
  Widget build(BuildContext context) {
    debugPrint("pricing in debug");
    return GetBuilder<PageGetController>(
      builder: (pagectrl) {
        return SizedBox(
         
          height: MediaQuery.sizeOf(context).width<600?600:700,
          child: Stack(
            
            children: [
                 Positioned(
                  child: OverlayCard(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                    Theme.of(context).colorScheme.primary,
                    
                      Theme.of(context).colorScheme.primary.withOpacity(0.7)
                     
                    ]),
                child: Image.asset(
                  'assets/images/backg2.jpg',
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
              )),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                        const SizedBox(height: 10,),
                  const Text("Pricing",style: TextStyle(fontSize: 30),),
                  const SizedBox(height: 40,),
                  Expanded(
                    flex: 4,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      shrinkWrap: true,
                      children: [
                        PricingCard(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                            children:[
                    
                    // Expanded(child: Stack(
                    //   children: [
                    //     // Positioned.fill(child: Image.asset('assets/')),
                    //     Center(child: TitleText(text: "Rs.1500")),
                    //   ],
                    // )),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text("All",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.surface ),),
                        const SizedBox(height: 20,),
                        Row(
                    
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rs 1200",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 20),),
                            Text(" /Admission Fee",style: TextStyle(color: Theme.of(context).colorScheme.surface.withOpacity(0.3)),),
                          ],
                        )
                      ],
                    )),
                    Container(color: Theme.of(context).colorScheme.surface,height: 0.3,width: 80,),
                     Expanded(
                            flex: 3,
                      child: 
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         const Text("Personal",style: TextStyle(fontSize: 18),),
                         const SizedBox(height: 10,),
                           
                        
                              Row(
                    
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rs 3500",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 20),),
                            Text("/month",style: TextStyle(color: Theme.of(context).colorScheme.surface.withOpacity(0.3)),),
                          ],
                        ),
                         const SizedBox(height: 24,),
                          const Text("General",style: TextStyle(fontSize: 18),),
                         const SizedBox(height: 10,),
                           
                        
                              Row(
                    
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Rs 1500",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 20),),
                            Text("/month",style: TextStyle(color: Theme.of(context).colorScheme.surface.withOpacity(0.3)),),
                          ],
                        ),
                      
                      ],
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActionButton(onpress: (){}, text: "Get Started"),
                      ],
                    )
                            ],
                          ),).animate().fade(begin: 0,end: 1),
                        const SizedBox(width: 40,),
                    
                    PricingCard(child: PricingInfo(type: "Personal",discount: pagectrl.pricingindex==0?"15":pagectrl.pricingindex==1?"20":"25",monthlyamount: "Rs 3500",months:pagectrl.pricingindex==0?"3 months":pagectrl.pricingindex==1?"6 months":"12 months",price:pagectrl.pricingindex==0?"Rs 8920":pagectrl.pricingindex==1?"Rs 16800":"Rs 31500",),),
                        const SizedBox(width: 40,),
                      PricingCard(child: PricingInfo(type: "General",discount: pagectrl.pricingindex==0?null:pagectrl.pricingindex==1?"20":"25",monthlyamount: "Rs 1500",months:pagectrl.pricingindex==0?"3 months":pagectrl.pricingindex==1?"6 months":"12 months",price:pagectrl.pricingindex==0?"Rs ${1500*3}":pagectrl.pricingindex==1?"Rs 7200":"Rs 13500",),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(
                    flex: 2,
                    child: SizedBox(height: 100,child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          ClickDotPrice(text: "3 months",onpress: (){
                              pagectrl.changePricingindex(0);
                              pagectrl.changeScrolltoScreen(1);
                          },color: pagectrl.pricingindex==0,),
                          SizedBox(width: 40,),
                          ClickDotPrice(text: "6 months",onpress: (){
                              pagectrl.changePricingindex(1);
                                   pagectrl.changeScrolltoScreen(1);
              
                          },color: pagectrl.pricingindex==1,),
                                SizedBox(width: 40,),
                          ClickDotPrice(text: "12 months",onpress: (){
                              pagectrl.changePricingindex(2);
                                   pagectrl.changeScrolltoScreen(1);
              
                          },color: pagectrl.pricingindex==2,),
                                
                    ],),))
                ],
              ),
            ],
          )
        );
      }
    );
  }
}

class ClickDotPrice extends StatefulWidget {
  const ClickDotPrice({
    super.key, required this.text, required this.onpress, required this.color,
  });
    final String text;
    final VoidCallback onpress;
    final bool color;
  @override
  State<ClickDotPrice> createState() => _ClickDotPriceState();
}

class _ClickDotPriceState extends State<ClickDotPrice> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      onHover: (v){
        setState(() {
          hover = v;
        });
      },
      child: Column(
        children: [
         SizedBox(
          height: 20,
          width: 20,
           child: widget.color?CardWithShadow(
              isBorder:  hover||widget.color,
              margin: EdgeInsets.symmetric(vertical: 16,horizontal: 24),
              color:hover||widget.color?Colors.transparent:Colors.white.withOpacity(0.5),
              child: SizedBox(height: 10,width:10,),boxshape: true,):SizedBox(),
         ),
            Text(widget.text,style: TextStyle(color: hover||widget.color?Theme.of(context).colorScheme.secondary:null,fontSize: 16),)
        ],
      ),
    );
  }
}

class PricingInfo extends StatelessWidget {
  const PricingInfo({
    super.key, required this.type, this.monthlyamount, this.months, this.discount, this.price,
  });
  final String type;
  final String? monthlyamount;
  final String? months;
  final String? discount;
  final String? price;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
            children:[
    
    // Expanded(child: Stack(
    //   children: [
    //     // Positioned.fill(child: Image.asset('assets/')),
    //     Center(child: TitleText(text: "Rs.1500")),
    //   ],
    // )),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
    children: [
       Text(type,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).colorScheme.surface ),),
      const SizedBox(height: 20,),
      Row(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Rs $monthlyamount",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 20),),
          Text("/month",style: TextStyle(color: Theme.of(context).colorScheme.surface.withOpacity(0.3)),),
        ],
      )
    ],
        ),
    Container(color: Theme.of(context).colorScheme.surface,height: 0.3,width: 80,margin: EdgeInsets.symmetric(vertical: 30),),
     Expanded(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
            Text("$months",style:const TextStyle(fontSize: 18),),
            const SizedBox(height: 10,),
            Row(
             mainAxisAlignment: MainAxisAlignment.center,
              children: [
              discount==null?const SizedBox():CardWithShadow(
       
                 isBorder: true,
                 radius: BorderRadius.zero,
                padding:const  EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                 child:Text("$discount% Discount",style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.surface.withOpacity(0.4)),)),
              ],
            ),
            const SizedBox(height: 10,),
            Text(price!,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
            const SizedBox(height: 24,),
       
       
           //       const Text("6 Months",style: TextStyle(fontSize: 18),),
           //  const SizedBox(height: 10,),
           //     Row(
           //   mainAxisAlignment: MainAxisAlignment.center,
           //    children: [
           //     CardWithShadow(
       
           //       isBorder: true,
           //       radius: BorderRadius.zero,
           //      padding:const  EdgeInsets.symmetric(vertical: 4,horizontal: 8),
           //       child:Text("20% Discount",style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.surface.withOpacity(0.4)),)),
           //    ],
           //  ),
           //  const SizedBox(height: 10,),
           //  Text('Rs 16800',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
           //  const SizedBox(height: 24,),
       
           //  const Text("12 months",style: TextStyle(fontSize: 18),),
           //  const SizedBox(height: 10,),
           //       Row(
           //   mainAxisAlignment: MainAxisAlignment.center,
           //    children: [
           //     CardWithShadow(
       
           //       isBorder: true,
           //       radius: BorderRadius.zero,
           //      padding:const  EdgeInsets.symmetric(vertical: 4,horizontal: 8),
           //       child:Text("25% Discount",style: TextStyle(fontSize: 12,color: Theme.of(context).colorScheme.surface.withOpacity(0.4)),)),
           //    ],
           //  ),
           //  const SizedBox(height: 10,),
           //  Text("Rs 31500",style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
           //  const SizedBox(height: 24,),
         
         ],
       ),
     ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(onpress: (){}, text: "Get Started"),
      ],
    )
            ],
          );
  }
}