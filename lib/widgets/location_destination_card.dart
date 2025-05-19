import 'package:flutter/material.dart';
import 'package:flutter_railway_app/screens/flight/flight_screen_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

List<DropdownMenuItem> countries = [
      DropdownMenuItem(value: "Pakistan",child: Text("Pakistan"),),
      DropdownMenuItem(value: "India",child: Text("India"),),
      DropdownMenuItem(value: "Bangladesh",child: Text("Bangladesh"),),
      DropdownMenuItem(value: "Nepal",child: Text("Nepal"),),

      DropdownMenuItem(value: "Bhutan",child: Text("Bhutan"),),
      DropdownMenuItem(value: "Sri Lanka",child: Text("Sri Lanka"),),
      DropdownMenuItem(value: "Maldives",child: Text("Maldives"),),
      DropdownMenuItem(value: "Afghanistan",child: Text("Afghanistan"),),
      DropdownMenuItem(value: "Iran",child: Text("Iran"),),

      DropdownMenuItem(value: "Iraq",child: Text("Iraq"),),
      DropdownMenuItem(value: "Turkey",child: Text("Turkey"),),

      DropdownMenuItem(value: "Syria",child: Text("Syria"),),
      DropdownMenuItem(value: "Jordan",child: Text("Jordan"),),
      DropdownMenuItem(value: "Lebanon",child: Text("Lebanon"),),
      
    ];


    

class LocationDestinationCard extends StatelessWidget {
  late String fromLocation;
  late String toLocation;
  late DateTime startSelectedDate;
  late DateTime endSelectedDate;
  
  
  LocationDestinationCard({
    super.key,
    required this.fromLocation,
    required this.toLocation,
  });

  @override
  Widget build(BuildContext context){

    return Column(
      children: [
       Row(
        children: [
          Column(
            children: [
              Row(
                children: [
                    SvgPicture.asset("assets/images/home/start.svg"),
                    DropdownButtonFormField(items: countries, onChanged: (value) => setStartLocation(value),)
                ],
              ),
              
              Row(
                children: [
                    SvgPicture.asset("assets/images/home/route.svg"),
                ],
              ),

              Row(
                children: [
                    SvgPicture.asset("assets/images/home/end.svg"),
                    DropdownButtonFormField(items: countries, onChanged: (value) => setStartLocation(value),)
                ],
              ),

              SvgPicture.asset("assets/images/home/loc-dest.svg"),

              Row(
                children: [
                  GestureDetector(onTap: () async{ startSelectedDate = await selectDate(context);}, 
                    child: Text("${startSelectedDate.day}/${startSelectedDate.month}/${startSelectedDate.year}", 
                    style: TextStyle(color: Colors.black, fontSize: 16),)
                    ),

                    Text("-"),
                     GestureDetector(onTap: () async{ endSelectedDate = await selectDate(context);}, 
                    child: Text("${endSelectedDate.day}/${endSelectedDate.month}/${endSelectedDate.year}", 
                    style: TextStyle(color: Colors.black, fontSize: 16),)
                    ),
                    
                    ]

                
              )

            ],
          ),
          Column(
            children: [
        DropdownButtonFormField(items: countries, onChanged: (value) => setEndLocation(value),)],
          ),

          SvgPicture.asset("assets/images/home/")


        ],
       )
      ],
    );


  }

void setStartLocation(String value){
    fromLocation = value;
    FlightModel.fromValue = value;
}

void setEndLocation(String value){
  toLocation = value;
  FlightModel.toValue = value;
}

Future<DateTime> selectDate(BuildContext context) async{
    DateTime? date = await showDatePicker(context: context, firstDate: DateTime.now(), 
          lastDate: DateTime(DateTime.now().year, DateTime.now().month));
    if(date != null){
      return startSelectedDate;
    }
    return DateTime.now();
}

}



