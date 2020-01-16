import 'dart:convert';
import 'package:http/http.dart';
import 'package:androidprojecto/Chats/Chat.dart';

class Setting{
   static String url1 = "http://192.168.0.48/apis/getAll.php";
   static String url2 ="";


  static Future<List<Chat>> ChatApp() async{

    List<Chat> lista = [];
    var queries = await get(url1).then((Response response){
        if(response.statusCode >=200 && response.statusCode <=400){
            List<dynamic> din = json.decode(response.body);
            for(var chat in din)
                lista.add(Chat.Json(chat));
        }
   });
    return lista;
  }

}