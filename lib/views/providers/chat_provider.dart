

import 'package:flutter/cupertino.dart';
import '../../config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message>messageList=[
    //Message(text: "hola bebe", fromWho: FromWho.me),
    //Message(text: "Ya tomaste tetero?", fromWho: FromWho.me),
  ];

  Future<void> herReply() async{
    final herMessage = await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveSrollToBottom();
  }
  Future<void> sendMessage(String text)async{
         if(text.isEmpty)return;
          final newMessage= Message(text: text, fromWho: FromWho.me);
          messageList.add(newMessage);
          if(text.endsWith("?")) await herReply();
          notifyListeners();
          moveSrollToBottom();
  }
  Future<void> moveSrollToBottom() async{
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(chatScrollController.position.maxScrollExtent, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }
}