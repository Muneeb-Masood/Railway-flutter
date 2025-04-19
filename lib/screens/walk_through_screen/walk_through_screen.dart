import 'package:flutter/material.dart';
import 'package:flutter_railway_app/templates/walk_through_screen_template.dart';

class WalkThroughScreen extends StatelessWidget {
  const WalkThroughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: PageView(
        onPageChanged: (int pageValue){
            print(pageValue);
            onPageChnaged(pageValue);
            
        },
        children: [
          WalkThroughScreenTemplate("assets/images/walk_through/walk_through_1.svg", "First Screen", "Description for the second screen" , 1),
          WalkThroughScreenTemplate("assets/images/walk_through/walk_through_2.svg", "Second Screen", "Description for the second screen" , 2),
          WalkThroughScreenTemplate("assets/images/walk_through/walk_through_3.svg", "Third Screen", "Description for the third screen" , 3),
        
           ],
      ),
    ));
  }
}


void onPageChnaged(int pageValue) {

  print("Value chnaged: $pageValue\n");

}