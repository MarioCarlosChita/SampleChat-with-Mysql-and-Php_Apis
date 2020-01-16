import 'package:androidprojecto/Chats/Chat.dart';
import 'package:flutter/cupertino.dart';
import  'package:flutter/material.dart';
import './UI/chatacesss.dart';


void main()=>runApp(MaterialApp(

  home:  Sample(),
));

class Sample extends  StatefulWidget{
   @override
  State<StatefulWidget> createState() {
     return myApp();
  }
}

class myApp extends State<Sample>{

   @override
   initState(){
     super.initState();
      Future.delayed(Duration(seconds: 5) , (){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder:(BuildContext Context)=> Chatusuario ()), (Route<dynamic> route)=> false);
      });
   }
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
           color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                        Text("Chats Friends" ,style: TextStyle(
                            color: Colors.white,
                            fontSize: 30 ,
                           fontWeight: FontWeight.bold
                        ),) ,
                        SizedBox(height:4,),
                       Text('Connect with your friends' , style: TextStyle(
                           color: Colors.white ,
                           fontSize: 12,

                        ),) ,
                        SizedBox(height: 50 ,
                        ) ,
                      CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      )
                 ],
            ),
        ),
    );
  }

}
