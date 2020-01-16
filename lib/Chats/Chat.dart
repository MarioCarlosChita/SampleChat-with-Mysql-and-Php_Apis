class Chat{

  String _message ;
  String _time ;
  String _autor ;
  String _id;

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  Chat(this._id ,this._message, this._time, this._autor);
  factory Chat.Json(Map<String, dynamic> map){
      return Chat(
          map['id'],
          map['message'],
          map['data'],
          map['autor']
      );
  }


  toMap(){
     return {
        'message':this._message ,
        'time':this._time ,
        'autor':this._autor
      };
  }

  String get time => _time;

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get autor => _autor;

  set autor(String value) {
    _autor = value;
  }

  set time(String value) {
    _time = value;
  }
}

