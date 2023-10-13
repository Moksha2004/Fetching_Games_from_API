import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inside_medhelp/model/cardio_model.dart';
import 'package:inside_medhelp/book.dart';
import 'model/doctor_model.dart';

class specs extends StatefulWidget {
  const specs({Key? key}) : super(key: key);
  @override
  State<specs> createState() => _specsState();
}

class _specsState extends State<specs> {
   static List<DoctorModel> doctors_list=[
  //
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),
  //   CardioModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',"3 days ago"),

    DoctorModel("Dermatology","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
    DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),


  ];
  List<DoctorModel> display_list=List.from(doctors_list);
  void updateList(String value){
    setState(() {
      display_list=doctors_list.where((element) => element.Specification!.toLowerCase().contains(value.toLowerCase())).toList();

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE4F1EF),
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
                    hintText: "Search a doctor or health issue",
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Color(0xff090A0A)
                ),
              ),
              SizedBox(height: 20.0,),

              Text("Book Appointments",style: TextStyle(
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
                              title: Text(display_list[index].Specification!,style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(display_list[index].activity!,),
                              leading: Image.network(display_list[index].imageurl!,
                                fit: BoxFit.cover,
                                width: 100.0,
                                height: 100.0,),
                              onTap:(){
                                Navigator.push(
                                  context,MaterialPageRoute(builder: (context)=>book())
                                );
                              }
                              // onTap: () {
                              // Navigator.push(
                              // context,
                              // MaterialPageRoute(builder: (context) => MyNextPage()),);),
                            ),


                          ])
                  ))
              )],
          ),

        ),

    );
  }


}

