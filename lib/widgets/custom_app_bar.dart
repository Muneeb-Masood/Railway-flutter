import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  String appBarText;
  IconData? icon;
  Function()? onPrressed;
  CustomAppBar({required this.appBarText ,  this.icon, this.onPrressed, required String title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          appBarText,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(icon, color: Colors.black),
            onPressed: () {onPrressed;},
          ),
        ],
      );
  }
  
  @override
  Size get preferredSize => throw UnimplementedError();

}
