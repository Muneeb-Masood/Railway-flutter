import 'package:flutter/material.dart';
import 'package:flutter_railway_app/helper_funtions/helper_functions.dart';
import 'package:flutter_railway_app/screens/home/home_model.dart';
import 'package:flutter_railway_app/widgets/date_picker.dart';

class HomeModelImpl {
  HomeScreenModel get model => HomeScreenModel();
   Future<void> showDatePicker(BuildContext context) async {
     final result = await showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Optional for full height
      backgroundColor: Colors.white, // Optional
      builder: (context) => const DateRangePickerSheet(),
    );

    if (result != null) {

      DateRangePickerSheet.initialStart = result['start'];
      DateRangePickerSheet.initialEnd = result['end'];
    }

    else{
      
    }
  }

   void onDetailsCompletion(BuildContext context , Map<String , dynamic> data){
    HelperFucntions.navigateTo(context , "/flighResult" , data);
    
   } 

}