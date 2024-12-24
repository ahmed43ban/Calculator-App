import 'dart:math';

import 'package:calculator/Button.dart';
import 'package:flutter/material.dart';

class ClculatorScreen extends StatefulWidget{
  static const String RouteName ='home';

  @override
  State<ClculatorScreen> createState() => _ClculatorScreenState();
}

class _ClculatorScreenState extends State<ClculatorScreen> {
  String resulttext = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Align(alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  children: [
                    Text("$savednum $savedopr",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.w500,fontSize: 48
                    ),),
                    Text(resulttext,style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.w500,fontSize: 48
                    ),),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Button(numb: 'Ac',backgrd: Color(0xff616161),fontcolor: Color(0xffA5A5A5),onbtnclick: Acclear,),
                Button(numb: '',isicon: "assets/images/Vector.svg",backgrd: Color(0xff616161),fontcolor: Color(0xffA5A5A5),onbtnclick: clearlast),
                Button(numb: '/',backgrd: Color(0xff005DB2),onbtnclick: onoprclick),
                Button(numb: '*',backgrd: Color(0xff005DB2),onbtnclick: onoprclick),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Button(numb: '7',onbtnclick: ondigitclick),
                Button(numb: '8',onbtnclick: ondigitclick),
                Button(numb: '9',onbtnclick: ondigitclick),
                Button(numb: '-',backgrd: Color(0xff005DB2),onbtnclick: onoprclick),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Button(numb: '4',onbtnclick: ondigitclick),
                Button(numb: '5',onbtnclick: ondigitclick),
                Button(numb: '6',onbtnclick: ondigitclick),
                Button(numb: '+',backgrd: Color(0xff005DB2),onbtnclick: onoprclick),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Button(numb: '1',onbtnclick: ondigitclick),
                Button(numb: '2',onbtnclick: ondigitclick),
                Button(numb: '3',onbtnclick: ondigitclick),
                Button(numb: 'sin',backgrd: Color(0xff005DB2),onbtnclick: sinopr),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Button(numb: '0',flex: 2,onbtnclick: ondigitclick),
                Button(numb: '.',onbtnclick: ondigitclick),
                Button(numb: '=',backgrd: Color(0xffB2DAFF),onbtnclick: eqalclick),
              ],
            ),
          ),
        ],
      ),
    );
  }
  lastopration(String){

  }
  void sinopr(_){
    if(resulttext.isNotEmpty){
      num result = num.parse(resulttext);
      num radian = result*(pi /180);
      num lastresult = sin(radian);
      setState(() {
        resulttext=lastresult.toString();
      });
    }else{
      return;
    }
  }
  void clearlast(_){
    if(savednum.isNotEmpty&&savedopr.isNotEmpty&&resulttext=='0'){
      setState(() {
        resulttext = savednum;
        savednum="";
        savedopr="";
      });
      return;
    }
    if(savednum.isNotEmpty&&savedopr.isNotEmpty&&resulttext.isNotEmpty){
      setState(() {
        resulttext =resulttext.substring(0,resulttext.length-1) ;
          if(resulttext.trim().isEmpty){
            resulttext='0';
          }

      });
      return;
    }
    if(resulttext.isNotEmpty){
      setState(() {
        resulttext=resulttext.substring(0,resulttext.length-1);
        if(resulttext.trim().isEmpty) {
          resulttext = '0';
        }
      });
    }
  }
void Acclear(_){
    setState(() {
      savednum ='';
      savedopr='';
      resulttext='0';
    });
}
 void ondigitclick(String btntext){
    if(btntext=="0"){
      if(resulttext=="0"){
        return;
      }
    }
    if(btntext=='.'){
      if(resulttext=="0"){
        setState(() {
          resulttext= '0'+btntext;
        });
      }
    if(resulttext.contains('.')){
      return;
    }}
    if(resulttext=='0'){
      setState(() {
        resulttext=btntext;
      });
    }else{
    setState(() {
      resulttext+=btntext;
    });
  }}
  void onoprclick(String btntext){
    if(savednum.isEmpty&&resulttext=='0'){
      return;
    }
    if(savednum.isEmpty){
      setState(() {
        savednum=resulttext;
        savedopr=btntext;
        resulttext='';
      });
    }else{
      num result = calcbutn(
          lhs: num.parse(savednum),
          rhs: num.parse(resulttext),
          oprator: savedopr);
      setState(() {
        savednum=result.toString();
        savedopr=btntext;
        resulttext="";
      });
    }
  }
  void eqalclick(_){
    if(savednum.isEmpty && resulttext!='0'){
      setState(() {
        resulttext="0";
      });
    }
    if(savednum.isNotEmpty) {
      if(resulttext=='0') {
        setState(() {
          resulttext = savednum;
          savednum ="";
          savedopr='';
        });
      }else{
        num resulte = calcbutn(
            lhs: num.parse(savednum),
            rhs: num.parse(resulttext),
            oprator: savedopr);
        setState(() {
          resulttext =resulte.toString();
          savednum ="";
          savedopr='';
        });
      }
    }
  }
 num calcbutn({required num lhs ,required num rhs,required String oprator}){
    late num result;
    switch(oprator){
      case "+":{
        result =lhs + rhs;
      }
      break;
      case "-":{
        result =lhs - rhs;
      }
      break;
      case "/":{
        result =lhs / rhs;
      }
      break;
      case "*":{
        result =lhs * rhs;
      }
      break;


    }
    return result;

  }
  String savednum="";
  String savedopr="";
}
