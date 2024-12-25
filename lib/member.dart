import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  final Function updateStatus;
  final getIslocked;
  const MemberPage({super.key, 
                    required this.updateStatus,
                    required this.getIslocked});

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Member Page"),
      ),

      body:  Center(
        child: Column(
          children: [
            SizedBox(height: 60,),
            btnLoginLogout(context),
            SizedBox(height: 30,),
            btnBack(context),
          ],
        ),
      ),
    );
  }

  Widget btnLoginLogout(BuildContext context){
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: Colors.grey),
      ),
      onPressed: () {
        //เมื่อคลิกปุ่ม ให้สลับสถานะการเข้าระบบ true => false, false => true
        widget.updateStatus(!widget.getIslocked());
        setState(() {
          widget.getIslocked();
        });
      } ,
      child: Text((!widget.getIslocked()?'เข้าสู่ระบบ':'ออกจากระบบ')));
  }

  Widget btnBack(BuildContext contex){
    return TextButton(
      onPressed: ()=>Navigator.pop(context),
      child: Text('<<กลับ>>'));
  }
}