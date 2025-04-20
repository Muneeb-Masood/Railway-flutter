import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginWithOtherPlatformsButton extends StatelessWidget{
  final String buttonText;
  final String image;
  LoginWithOtherPlatformsButton(this.buttonText, this.image);
  

  @override
  Widget build(BuildContext context){

    return OutlinedButton(onPressed: (){}, child: Row(
      children: [SvgPicture.asset(image),SizedBox(width: 13,),Text(buttonText, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),)],
    ));

  }

}