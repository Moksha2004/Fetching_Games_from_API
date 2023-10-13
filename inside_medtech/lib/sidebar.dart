import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class sidebar extends StatelessWidget {
  const sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          // UserAccountsDrawerHeader(
          //   margin: EdgeInsets.all(20.0),
          //
          //   accountName: Text('Moksha'), accountEmail: Text('18 years old'),
          //   currentAccountPicture: CircleAvatar(
          //     child: ClipOval(
          //     child:  Image.network('https://1.bp.blogspot.com/-W_fgqSoWUcg/X1zXJ_q1hCI/AAAAAAAABMw/N5WY-ZLSZTQqpFj3v5gPUe6PUwE-wfbKQCLcBGAsYHQ/s640/doraemon_nobita-png-factory88.png',
          //     width: 90,
          //     height: 90,),
          //     ),
          //   ),)
          Container(

            margin: EdgeInsets.all(20.0),
            padding: EdgeInsets.all(20.0),
            color: Color(0xFFE4F1EF),
            child:Text('Moksha')
          ),
          ListTile(
            leading: Icon(Icons.dashboard_customize_outlined),
            title: Text('schedule appointment'),
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text('Settings'),
          ),
          ListTile(
            leading: Icon(Icons.folder_open),
            title: Text('upload prescription'),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today_outlined),
            title: Text('Notifications'),
          ),
          ListTile(
            leading: Icon(Icons.schedule_outlined),
            title: Text('Need Help?'),
          ),

        ],
      ),
    );
  }
}
