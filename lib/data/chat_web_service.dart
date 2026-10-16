import 'dart:async';
import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:web_socket_client/web_socket_client.dart';

@lazySingleton
class ChatWebService {
  WebSocket?  _webSocket;
  // هون ستعملناها لانو البياناتا مستمرة من الطرفين
  final _searcgResultController = StreamController<Map<String,dynamic>>.broadcast();
  final _contentController=StreamController<Map<String,dynamic>>.broadcast();

  Stream<Map<String,dynamic>> get searchResultStream =>_searcgResultController.stream;
  Stream<Map<String,dynamic>> get contentStream =>_contentController.stream;
  void connect(){
    //انشئنا اتصال مباشر  
    _webSocket = WebSocket(Uri.parse('ws://localhost:8000/ws/chat'));
    //للاستماع للرسائل
    _webSocket!.messages.listen((event) {
      final data = json.decode(event);
      if(data['type']=='search_result'){
        _searcgResultController.add(data);
      }else{
        _contentController.add(data);
      }
    },);
  }
  void chat(String content){
    _webSocket?.send(jsonEncode({'query': content}));
  }
}
