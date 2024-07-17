import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymwebapp/controller/pagegetcontroller.dart';
import 'package:gymwebapp/widget/actionbutton.dart';


import 'package:gymwebapp/widget/cardwithshadow.dart';
import 'package:gymwebapp/widget/overlaycard.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key,this.keys});
  final GlobalKey? keys;
  @override
  Widget build(BuildContext context) {
      debugPrint("contact in debug");
    return SizedBox(
    
      height: MediaQuery.sizeOf(context).width>800?700:1000,
      child: Column(
        children: [
          // Expanded(
          //   flex: 3,
          //   child: CardWithShadow(
          //     child: OverlayCard(
          //       gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [Theme.of(context).colorScheme.primary.withOpacity(0.7),Theme.of(context).colorScheme.primary.withOpacity(0.5)]),
          //       child: Image.asset("assets/images/map.png",fit: BoxFit.contain,)),
          //   )),
           Expanded(
            flex: 2,
            child: ContactCard()) 
        ],
      ),
    );
  }
}

class ContactCard extends StatefulWidget {
  const ContactCard({
    super.key,
  });

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PageGetController>(
      builder: (pagectrl) {
        return CardWithShadow(
          // margin: const EdgeInsets.all(16),
          radius: BorderRadius.zero,
          color: Theme.of(context).colorScheme.primary,
                
          shadowcolor: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
          child: Stack(
        
            children: [
            //            Positioned(
            //     child: OverlayCard(
            //   gradient: LinearGradient(
            //       begin: Alignment.topLeft,
            //       end: Alignment.bottomLeft,
            //       colors: [
            //       Theme.of(context).colorScheme.primary,
                  
            //         Theme.of(context).colorScheme.primary.withOpacity(0.7)
                   
            //       ]),
               
            //   child: Image.asset(
            //     'assets/images/backg.jpg',
            //     fit: BoxFit.cover,
            //     filterQuality: FilterQuality.low,
            //   ),
            // )),
             MediaQuery.sizeOf(context).width>800?Positioned(
               child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100,
                            width: 100,
                            child: Image.asset("assets/images/logo.png"),
                            ),
                            ActionButton(onpress: (){pagectrl.changeScrolltoScreen(0);}, text: "Go to Home")
                          ],
                        ),
                     
                        
                  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                Text("Socials",style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.surface.withOpacity(0.6)),),
                            const Row(children: [
                                  CardWithShadow(
                                    
                                    padding: EdgeInsets.all(16),
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.facebook,size: 20,)),
                                      CardWithShadow(
                                    padding: EdgeInsets.all(16),
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.work_outlined,size: 20,)),
                                    CardWithShadow(
                                    padding: EdgeInsets.all(16),
                                    margin: EdgeInsets.all(8),
                                    child: Icon(Icons.telegram,size: 20,))
                            
                            ],),
                          ],
                        ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("+9174846386385",style: TextStyle(fontSize: 26),),
                            Text("xxx@gmail.com",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.secondary),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ActionButton(onpress: (){}, text: "Register Now"),
                              ],
                            )
                          
                          ],),
                      
                      ],
                        
                ),
             ):Positioned(
               child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 100,
                            width: 100,
                            child: Image.asset("assets/images/logo.png"),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ActionButton(onpress: (){pagectrl.changeScrolltoScreen(0);}, text: "Go to Home"),
                              ],
                            )
                          ],
                        ),
                     
                        SizedBox(height: 20,) ,
                  Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                Text("Socials",style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.surface.withOpacity(0.6)),),
                           const Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Row(
                               
                                  children: [
                                      CardWithShadow(
                                        
                                        padding: EdgeInsets.all(16),
                                        margin: EdgeInsets.all(8),
                                        child: Icon(Icons.facebook,size: 20,)),
                                          CardWithShadow(
                                        padding: EdgeInsets.all(16),
                                        margin: EdgeInsets.all(8),
                                        child: Icon(Icons.work_outlined,size: 20,)),
                                        CardWithShadow(
                                        padding: EdgeInsets.all(16),
                                        margin: EdgeInsets.all(8),
                                        child: Icon(Icons.telegram,size: 20,))
                                
                                ],),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Text("+9174846386385",style: TextStyle(fontSize: 26),),
                            Text("xxx@gmail.com",style: TextStyle(fontSize: 16,color: Theme.of(context).colorScheme.secondary),),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ActionButton(onpress: (){}, text: "Register Now"),
                              ],
                            )
                          
                          ],),
                                  SizedBox(height: 10,),
                      
                      ],
                        
                ),
             ),
             
                 ],
          ));
      }
    );
  }
}