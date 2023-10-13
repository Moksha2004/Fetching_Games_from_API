import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inside_medhelp/MainScreen.dart';
import 'package:inside_medhelp/pic.dart';
// import 'package:intl/intl.dart';
// import 'package:med_tech/test.dart';

void main() {
  runApp(k());
}

class k extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<k> {
  int _currentIndex = 0;
  final FocusNode _focusNode = FocusNode();
  bool _isKeyboardDisplayed = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isKeyboardDisplayed = _focusNode.hasFocus;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          leading:Padding(
            padding:EdgeInsets.all(20.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios,size:20,color: Colors.black,),
              onPressed: () {
                setState(() {
                  _currentIndex--;
                });

                if(_currentIndex<0) {
                  Navigator.pop(context);
                }
              },
            ),),

        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child:LinearProgressIndicator(
                value: (_currentIndex + 1) / 3,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Color(0xff18CDCA)),
              ),),
            SizedBox(height: 20),
            Expanded(
              child: _buildScreen(),
            ),
            SizedBox(height: 20),

            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            // if (_currentIndex > 0)
            //   ElevatedButton(
            //     onPressed: () {
            //       setState(() {
            //         _currentIndex--;
            //       });
            //     },
            //     child: Text('Back'),
            //   ),
            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       if (_currentIndex < 2) {
            //         _currentIndex++;
            //       } else {
            //         // Navigate to next screen or do something else
            //       }
            //     });
            //   },
            //   child: Text(_currentIndex < 2 ? 'Continue' : 'Finish'),
            // ),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: _isKeyboardDisplayed
                  ? MediaQuery.of(context).viewInsets.bottom + 80.0
                  : 80.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(327, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),),
                    backgroundColor: Color( 0xff18CDCA),                  ),
                  onPressed: () {
                    setState(() {

                      if (_currentIndex < 2) {
                        _currentIndex++;
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),);
                        // Navigate to next screen or do something else
                      }
                    });
                  },
                  child: Text('Continue'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildScreen() {
    switch (_currentIndex) {
      case 0:
        return Column(children:[Container(
          padding: EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
          alignment: Alignment.topLeft,
          child:RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Tell us your',
                    style:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' Name!',
                    style:TextStyle(
                      color: Color(0xff18CDCA),fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  )

                ]
            ),
          ),
        ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.person),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your name',
                        ),
                        focusNode: _focusNode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


        ]);
      case 1:
        return Column(children:[Container(
          padding: EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
          alignment: Alignment.topLeft,
          child:RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Add',
                    style:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' Adhar Card No.',
                    style:TextStyle(
                      color: Color(0xff18CDCA),fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  )

                ]
            ),
          ),
        ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Adhar Number',
                        ),
                        focusNode: _focusNode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


        ]);
      case 2:
        return Column(children:[Container(
          padding: EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
          alignment: Alignment.topLeft,
          child:RichText(
            text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Add',
                    style:TextStyle(
                      color:Colors.black,fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  TextSpan(
                    text: ' Adhar Card No.',
                    style:TextStyle(
                      color: Color(0xff18CDCA),fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  )

                ]
            ),
          ),
        ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Icon(Icons.credit_card),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter your Adhar Number',
                        ),
                        focusNode: _focusNode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


        ]);
      default:
        return Container();
    }
  }
}
