import 'package:flutter/material.dart';
import 'package:gymwebapp/widget/cardwithshadow.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({super.key, required this.onpress,required this.text, this.icon, this.iconsize, this.iconcolor, this.textsize, this.padding, this.isborder = false});
  final VoidCallback onpress;
  final String text;
  final IconData? icon;
  final double? iconsize;
  final Color? iconcolor;
  final double? textsize;
  final EdgeInsets? padding;
  final bool isborder;
  @override
  Widget build(BuildContext context) {
    return CardWithShadow(
      isBorder: isborder,
      radius: BorderRadius.zero,
      child: MaterialButton(
        onPressed: onpress,
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
        hoverColor: Theme.of(context).colorScheme.surface.withOpacity(0.2),
        color:isborder? Colors.transparent:Theme.of(context).colorScheme.secondary,
        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      
          icon==null?const SizedBox():Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(icon,size: iconsize,color: iconcolor,),
          ),
      
          Text(text,style: TextStyle(fontSize: textsize,color: isborder?Theme.of(context).colorScheme.secondary :Colors.white,fontWeight: FontWeight.bold))
        ],),
      ),
    );
  }
}