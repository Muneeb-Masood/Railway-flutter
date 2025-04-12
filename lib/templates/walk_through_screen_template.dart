import 'package:flutter/material.dart';
import 'package:flutter_railway_app/core/utils/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkThroughScreenTemplate extends StatelessWidget {
  final String _imagePath;
  final String _label;
  final String _description;
  final int _pageValue;
    WalkThroughScreenTemplate(this._imagePath, this._label, this._description, this._pageValue,{super.key}){
    print(_imagePath);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:     Center(
            child: Column(
              children: [
                SvgPicture.asset(_imagePath),
                Text(_label , style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),),
                Text(_description),
                
                Row(
                  children: [
                    Text("Skip" , style: TextStyle(color: AppColor.primaryColor)),
                    Container(color: _pageValue == 1 ? AppColor.primaryColor : AppColor.secondaryColor,),
                    Container(color: _pageValue == 2 ? AppColor.primaryColor : AppColor.secondaryColor,),
                    Container(color: _pageValue == 3 ? AppColor.primaryColor : AppColor.secondaryColor,),
                    Icon(Icons.forward, color: AppColor.primaryColor,)
                  ],
                )
              ],
            ),
          ),
   
    );
  }
}