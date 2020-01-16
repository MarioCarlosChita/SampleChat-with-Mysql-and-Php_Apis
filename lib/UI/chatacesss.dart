
import 'package:androidprojecto/Chats/Chat.dart';
import 'package:androidprojecto/Setting/Setting.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class Chatusuario extends StatefulWidget{
    @override
  State<StatefulWidget> createState() {
      return Screen();
  }
}

class Screen extends State<Chatusuario>{
    @override
    List<Chat> listaChat= [];
    List<int> changes  = [-1];


    initState(){
      Timer.periodic(Duration(seconds: 1) ,(Timer){
        Setting.ChatApp().then((lista){
          setState(() {
            listaChat= lista;
          });
          if(changes.elementAt(changes.length-1) != lista.length ){
              if(changes.elementAt(0) != -1 ){
                setState(() {
                  changes[0] = (lista.length);
                });
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context)=>Chatusuario() ), (Route<dynamic> route)=> false);
              }
          }else{
            setState(() {
              changes[0] = (lista.length);
            });

          }

        });
      });
       super.initState();
    }

  Widget build(BuildContext context) {
     return Scaffold(
         body: Container(
               margin: EdgeInsets.only(
                 left: 10 ,
                 top: 80 ,
                 right: 10 ,
               ),
               child:listaChat.length == 0 ?Center(child:CircularProgressIndicator(backgroundColor: Colors.blue,)):ListView.builder(
                   itemCount: listaChat.length,
                   itemBuilder: (context , index){
                     print(listaChat[index].message);
                     return Card(
                       child: Container(
                         width:120,
                         height: 70,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(50),
                         ),
                         child: ListTile(
                           title: Text(listaChat[index].autor, style: TextStyle(
                               color: Colors.blue ,
                               fontWeight: FontWeight.bold ,
                               fontSize: 11
                           ),),
                           subtitle: Text(listaChat[index].message ,style: TextStyle(
                               fontSize: 11,
                               color: Colors.black26
                           ),),
                         ),
                       ),
                     );
                   }
               ),

             ),

        bottomNavigationBar: Container(
            height: 50,
          margin: EdgeInsets.only(
            bottom: 5,
          ),
            decoration: BoxDecoration(
               color: Colors.blue ,
               borderRadius:BorderRadius.circular(40)
            ),
            child: TextField(
              autofocus: true,
                 autocorrect:  true,
              decoration: InputDecoration(
                 filled: true,
                 focusColor:Colors.orange,

                 hoverColor: Colors.orange,
                 fillColor: Colors.white,
                 labelText: "Type a Message",
                 prefixStyle: TextStyle(
                    color: Colors.white ,
                 ),
                 prefixIcon: IconButton(icon: Icon(Icons.send ,size: 20,color: Colors.blue,), onPressed: (){}),
                 border: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20) ,
                       borderSide: BorderSide(
                        color: Colors.black26,
                           width: 2
                     )
                 ),

              ),
            ),
        ),
     );
  }

}