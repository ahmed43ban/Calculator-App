import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
typedef calcbutn = void Function(String);
class Button extends StatelessWidget {
  Color fontcolor;
  int flex;
  Color backgrd;
  String numb ;
  String? isicon;
  calcbutn onbtnclick;
  Button({this.fontcolor=const Color(0xff29A8FF),
    this.backgrd = const Color(0xff303136),
    this.flex= 1,
    required this.numb,
    this.isicon,
  required this.onbtnclick});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex:flex ,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 11),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:backgrd ,
            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))
          ),
            onPressed: (){
            onbtnclick(numb);
            },
            child:isicon != null?SvgPicture.asset(isicon!,height: 24,width:24)
          : Text(numb,style: TextStyle(
              color: fontcolor,
              fontWeight: FontWeight.w500,
              fontSize: 32),)
        ),
      ),
    );
  }
}
