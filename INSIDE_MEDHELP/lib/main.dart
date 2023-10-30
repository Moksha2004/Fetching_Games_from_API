// import 'dart:core';
//
// import 'package:flutter/material.dart';
// import 'package:inside_medhelp/cardio.dart';
//
// import 'model/doctor_model.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home:SearchPage(),
//
//     );
//
//   }
// }
// class SearchPage extends StatefulWidget {
//   const SearchPage({Key? key}) : super(key: key);
//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   static List<DoctorModel> doctors_list=[
//     DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
//     DoctorModel("Dermatology","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
//     DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
//     DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
//     DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
//     DoctorModel("Cardiovascular","last activity 3 days ago",'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',),
//
//
//   ];
//   List<DoctorModel> display_list=List.from(doctors_list);
//  void updateList(String value){
//    setState(() {
//      display_list=doctors_list.where((element) => element.Specification!.toLowerCase().contains(value.toLowerCase())).toList();
//
//    });
//  }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFE4F1EF),
//       appBar: AppBar(elevation: 0,
//         backgroundColor: Color(0xFFE4F1EF),
//        // leading: ,
//       ),
//       body: Padding(padding: EdgeInsets.all(16),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             SizedBox(
//               height: 20.0,
//             ),
//             TextField(
//               onChanged: (value) => updateList(value),
//               style: TextStyle(),
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide(
//                     color: Color( 0xff18CDCA)
//                   ),
//                 ),
//                 hintText: "Search a doctor or health issue",
//                 hintStyle: TextStyle(fontSize:15.71,color: Color(0xff939AA4
//                 ) ),
//                   prefixIcon: Icon(Icons.search),
//                 prefixIconColor: Color(0xff090A0A)
//               ),
//             ),
//             SizedBox(height: 20.0,),
//
//             Text("Reports and Appointments",style: TextStyle(
//               color: Color(0xff052E2D
//               ),
//               fontSize: 18,
//               fontWeight: FontWeight.w700,
//             ),),
//             SizedBox(height: 20.0,),
//             Expanded(child:display_list.length==0?
//             Center(child: Text("No result found",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 22.0,
//                   fontWeight: FontWeight.bold
//               ),),)
//             :ListView.builder(
//               itemCount: display_list.length,
//                 itemBuilder:(context,index)=>Card(
//                   child:
//                   ListTile(
//
//                     minVerticalPadding: 30.0,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                     //  side: BorderSide(color: Colors.black),
//                     ),
//
//                   tileColor:Colors.white,
//                   title: Text(display_list[index].Specification!,style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   subtitle: Text(display_list[index].activity!,),
//                leading: Image.network(display_list[index].imageurl!,
//                fit: BoxFit.cover,
//                width: 80.0,
//                height: 80.0,),
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => doctor()),);
//     } )
//                 )
//             )
//             )
//           ],
//         ),
//
//       ),
//     );
//   }
// }
//
import 'dart:core';
import 'package:flutter/material.dart';

import 'book.dart';

class DoctorModel {
  final String Specification;
  final String activity;
  final String imageurl;

  DoctorModel(this.Specification, this.activity, this.imageurl);
}

class doctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Center(
        child: Text('Doctor details go here.'),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<DoctorModel> doctors_list = [
    DoctorModel(
      "Cardiovascular",
      "last activity 3 days ago",
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    ),
    DoctorModel(
      "Dermatology",
      "last activity 3 days ago",
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    ),
    DoctorModel(
      "Cardiovascular",
      "last activity 3 days ago",
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    ),
    DoctorModel(
      "Cardiovascular",
      "last activity 3 days ago",
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    ),
    DoctorModel(
      "Cardiovascular",
      "last activity 3 days ago",
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    ),
    DoctorModel(
      "Cardiovascular",
      "last activity 3 days ago",
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
    ),
  ];
  List<DoctorModel> display_list = List.from(doctors_list);

  void updateList(String value) {
    setState(() {
      display_list = doctors_list
          .where((element) =>
          element.Specification!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE4F1EF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xFFE4F1EF),
          leading: Builder(
            builder: (context) {
              return GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    ),
                    radius: 22,
                  ),
                ),
              );
            },
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hello',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color(0xff052E2D),
                      ),
                    ),
                    TextSpan(
                      text: ' moksha',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff052E2D),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Welcome to Medhelp',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff717171),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.topLeft,
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 32,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Handle item 1 click
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Handle item 2 click
                },
              ),
            ],
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(16),
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
    color: Color(0xff18CDCA),
    ),
    ),
    hintText: "Search a doctor or health issue",
    hintStyle: TextStyle(
    fontSize: 15.71,
    color: Color(0xff939AA4),
    ),
      prefixIcon: Icon(Icons.search),
      prefixIconColor: Color(0xff090A0A),
    ),
            ),
                SizedBox(height: 20.0),
                Text(
                  "Reports and Appointments",
                  style: TextStyle(
                    color: Color(0xff052E2D),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: display_list.length == 0
                      ? Center(
                    child: Text(
                      "No result found",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                      : ListView.builder(
                    itemCount: display_list.length,
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        minVerticalPadding: 30.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        tileColor: Colors.white,
                        title: Text(
                          display_list[index].Specification!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(display_list[index].activity!),
                        leading: Image.network(
                          display_list[index].imageurl!,
                          fit: BoxFit.cover,
                          width: 80.0,
                          height: 80.0,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => doctor(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_work_rounded,
              color: _currentIndex == 0 ? Colors.blue : null,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_books,
              color: _currentIndex == 1 ? Colors.blue : null,
            ),
            label: 'Folded Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              color: _currentIndex == 2 ? Colors.blue : null,
            ),
            label: 'Calendar',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoldedPage(), // Navigate to FoldedPage when Folded Page is selected
                ),
              );
            }
          });
        },
      ),
    );
  }
}

class FoldedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return book();
  }
}
