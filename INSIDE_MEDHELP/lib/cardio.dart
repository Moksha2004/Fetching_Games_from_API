import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inside_medhelp/model/cardio_model.dart';
import 'package:inside_medhelp/bookApp.dart';
import 'package:inside_medhelp/specs.dart';
import 'model/doctor_model.dart';
class doctor extends StatefulWidget {
  const doctor({Key? key}) : super(key: key);
  @override
  State<doctor> createState() => _doctorState();
}

class _doctorState extends State<doctor> {
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

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
//
// void main() {
//   runApp(k());
// }
//
// class k extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<k> {
//   int _currentIndex = 0;
//   final FocusNode _focusNode = FocusNode();
//   bool _isKeyboardDisplayed = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _focusNode.addListener(_onFocusChange);
//   }
//
//   void _onFocusChange() {
//     setState(() {
//       _isKeyboardDisplayed = _focusNode.hasFocus;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           systemOverlayStyle: SystemUiOverlayStyle.light,
//           backgroundColor: Colors.white,
//           leading:Padding(
//             padding:EdgeInsets.all(20.0),
//             child: IconButton(
//               icon: Icon(Icons.arrow_back_ios,size:20,color: Colors.black,),
//               onPressed: () {
//                 setState(() {
//                   _currentIndex--;
//                 });
//               },
//             ),),
//
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(20.0),
//               child:LinearProgressIndicator(
//                 value: (_currentIndex + 1) / 3,
//                 backgroundColor: Colors.grey,
//                 valueColor: AlwaysStoppedAnimation(Color(0xff18CDCA)),
//               ),),
//             SizedBox(height: 20),
//             Expanded(
//               child: _buildScreen(),
//             ),
//             SizedBox(height: 20),
//
//             //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//
//             // if (_currentIndex > 0)
//             //   ElevatedButton(
//             //     onPressed: () {
//             //       setState(() {
//             //         _currentIndex--;
//             //       });
//             //     },
//             //     child: Text('Back'),
//             //   ),
//             // ElevatedButton(
//             //   onPressed: () {
//             //     setState(() {
//             //       if (_currentIndex < 2) {
//             //         _currentIndex++;
//             //       } else {
//             //         // Navigate to next screen or do something else
//             //       }
//             //     });
//             //   },
//             //   child: Text(_currentIndex < 2 ? 'Continue' : 'Finish'),
//             // ),
//             AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               height: _isKeyboardDisplayed
//                   ? MediaQuery.of(context).viewInsets.bottom + 80.0
//                   : 80.0,
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(327, 50),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(48),),
//                     backgroundColor: Color( 0xff18CDCA),                  ),
//                   onPressed: () {
//                     setState(() {
//
//                       if (_currentIndex < 2) {
//                         _currentIndex++;
//                       } else {
//                         // Navigate to next screen or do something else
//                       }
//                     });
//                   },
//                   child: Text('Continue'),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildScreen() {
//     switch (_currentIndex) {
//       case 0:
//         return Column(children:[Container(
//           padding: EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
//           alignment: Alignment.topLeft,
//           child:RichText(
//             text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Tell us your',
//                     style:TextStyle(
//                       color:Colors.black,fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   ),
//                   TextSpan(
//                     text: ' Name!',
//                     style:TextStyle(
//                       color: Color(0xff18CDCA),fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   )
//
//                 ]
//             ),
//           ),
//         ),
//           Container(
//             padding: EdgeInsets.all(20.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 2.0,
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person),
//                     SizedBox(width: 10.0),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Enter your name',
//                         ),
//                         focusNode: _focusNode,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//         ]);
//       case 1:
//         return Column(children:[Container(
//           padding: EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
//           alignment: Alignment.topLeft,
//           child:RichText(
//             text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Tell us your',
//                     style:TextStyle(
//                       color:Colors.black,fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   ),
//                   TextSpan(
//                     text: ' Name!',
//                     style:TextStyle(
//                       color: Color(0xff18CDCA),fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   )
//
//                 ]
//             ),
//           ),
//         ),
//           Container(
//             padding: EdgeInsets.all(20.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 2.0,
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person),
//                     SizedBox(width: 10.0),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Enter your name',
//                         ),
//                         focusNode: _focusNode,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//         ]);
//
//
//       case 2:
//         return Column(children:[Container(
//           padding: EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
//           alignment: Alignment.topLeft,
//           child:RichText(
//             text: TextSpan(
//                 children: [
//                   TextSpan(
//                     text: 'Add',
//                     style:TextStyle(
//                       color:Colors.black,fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   ),
//                   TextSpan(
//                     text: ' Adhar Card No.',
//                     style:TextStyle(
//                       color: Color(0xff18CDCA),fontWeight: FontWeight.w600,
//                       fontSize: 20,
//                     ),
//                   )
//
//                 ]
//             ),
//           ),
//         ),
//           Container(
//             padding: EdgeInsets.all(20.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 2.0,
//                 ),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 10.0),
//                 child: Row(
//                   children: [
//                     Icon(Icons.credit_card),
//                     SizedBox(width: 10.0),
//                     Expanded(
//                       child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'Enter your Adhar Number',
//                         ),
//                         focusNode: _focusNode,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//
//
//         ]);
//       default:
//         return Container();
//     }
//   }
// }
// //
// // class DateOfBirthInput extends StatefulWidget {
// //   const DateOfBirthInput({Key? key}) : super(key: key);
// //
// //   @override
// //   _DateOfBirthInputState createState() => _DateOfBirthInputState();
// // }
// //
// // class _DateOfBirthInputState extends State<DateOfBirthInput> {
// //   DateTime? _selectedDate;
// //
// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: _selectedDate ?? DateTime.now(),
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime.now(),
// //     );
// //     if (picked != null && picked != _selectedDate) {
// //       setState(() {
// //         _selectedDate = picked;
// //       });
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
// //       child: TextFormField(
// //         readOnly: true,
// //         onTap: () => _selectDate(context),
// //         decoration: InputDecoration(
// // //          labelText: 'Date of Birth',
// //           hintText: 'Select your date of birth',
// //           border: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               color: Colors.grey.shade400,
// //             ),
// //             borderRadius: BorderRadius.circular(8.0),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               color: Theme.of(context).primaryColor,
// //             ),
// //             borderRadius: BorderRadius.circular(8.0),
// //           ),
// //           suffixIcon: Icon(
// //             Icons.calendar_today_outlined,
// //             color: Colors.grey.shade600,
// //           ),
// //         ),
// //         controller: TextEditingController(
// //           text: _selectedDate != null
// //               ? DateFormat.yMd().format(_selectedDate!)
// //               : null,
// //         ),
// //       ),
// //     );
// //   }
// // }
