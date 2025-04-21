

import 'package:flutter/cupertino.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{
  List<Message>messageList=[
    Message(text: "hola bebe", fromWho: FromWho.me),
    Message(text: "Ya tomaste tetero?", fromWho: FromWho.me),
  ];
  Future<void> sendMessage(String text)async{

  }
}