import 'package:flutter/material.dart';
import 'package:flutter_callback_inherit_app/member.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool _isLocked = false;
  var _icon = Icons.lock;
  var _text = 'กรูณาเข้าสู่ระบบ';

  //callback function
  bool getIslocked() => _isLocked;

  //callback function
  void updateStatus(value){
    setState(() {
      if(!value){
        _icon = Icons.lock;
        _text = 'กรุณาเข้าสู่ระบบ';
      }
      else{
        _icon = Icons.lock_open;
        _text = 'ท่านได้เข้าสู่ระบบเเล้ว';
      }
      _isLocked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Icon(_icon,size: 64,),
            Text(_text),
            SizedBox(height: 60,),
            ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
            ),
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context) => MemberPage(updateStatus: updateStatus,
                                                    getIslocked: getIslocked,)));
            },
            child: const Text("Member"))
          ],
        ),),
    );
  }
}