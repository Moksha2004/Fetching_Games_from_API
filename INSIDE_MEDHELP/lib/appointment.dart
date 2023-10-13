import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inside_medhelp/cardio.dart';
import 'package:inside_medhelp/model/cardio_model.dart';
import 'package:inside_medhelp/bookApp.dart';
import 'model/doctor_model.dart';
import 'package:inside_medhelp/specs.dart';
class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  static List<CardioModel> doctors_list=[

    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
    CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),

    // DoctorModel("Dermatology","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    // DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    // DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    // DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    // DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),


  ];
  List<CardioModel> display_list=List.from(doctors_list);
  void updateList(String value){
    setState(() {
      display_list=doctors_list.where((element) => element.Name!.toLowerCase().contains(value.toLowerCase())).toList();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE4F1EF
        ),
        appBar: AppBar(elevation: 0,
          backgroundColor: Color(0xFFE4F1EF),
          // leading: ,
        ),
        body: Padding(padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) => updateList(value),
                style: TextStyle(),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                          color: Color(0xFF18CDCA)
                      ),
                    ),
                    hintText: "Book Appointments",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xff090A0A)
                ),
              ),
              SizedBox(height: 20.0,),

              Text("Reports and Appointments",style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 20.0,),
              Expanded(child:display_list.length==0?
              Center(child: Text("No result found",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                ),),)
                  :ListView.builder(
                  itemCount: display_list.length,
                  itemBuilder:(context,index)=>Card(
                      child:Column(
                          children:[
                            ListTile(

                              minVerticalPadding: 30.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                //  side: BorderSide(color: Colors.black),
                              ),
                              tileColor:Colors.white,
                              title: Text(display_list[index].Name!,style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(display_list[index].Hospital!,),
                              leading: Image.network(display_list[index].imageurl!,
                                fit: BoxFit.cover,
                                width: 100.0,
                                height: 100.0,),
                              // onTap: () {
                              // Navigator.push(
                              // context,
                              // MaterialPageRoute(builder: (context) => MyNextPage()),);),
                            ),
                            Positioned( left: 120.0,
                                child: ElevatedButton(

                                    onPressed: (){}, child:Text("View Prescription")
                                ))

                          ])
                  ))
              )],
          ),

        ),
        floatingActionButton:FloatingActionButton(onPressed: () {
          showModalBottomSheet(context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20.0)
                  )
              ),
              builder: (BuildContext context){
                return SizedBox(
                  height: 306,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 163,right: 163),
                        child: Divider(color: Colors.grey,
                          thickness: 5,),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => specs()),);
                        },
                        child: Container(
                          width: 327,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.0),
                              color:Color(0xFF052E2D)
                          ),
                          child: Center(child: Text('Book Appointment',style: TextStyle(color: Colors.white),),),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          )),
                          Text('or'),
                          Expanded(child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ))
                        ],
                      ),
                      GestureDetector(
                         onTap: (){
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => k()),);
                        },
                        child: Container(
                          width: 327,
                          height: 48,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48.0),
                              color:Color(0xFF052E2D)
                          ),
                          child: Center(child: Text('Add Prescription',style: TextStyle(color: Colors.white),),),
                        ),
                      )
                    ],
                  ),
                );
              });
        },
          backgroundColor: Color(0xFF052E2D),
          child: Icon(Icons.add),
        )
    );
  }


}