import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/views/providers/chat_provider.dart';

import '../../../domain/entities/message.dart';
import '../../shared/message_field_box.dart';
import '../../widgets/chat/her_message_bubble.dart';
import '../../widgets/chat/my_message_bubble.dart';
import 'package:http/http.dart' as http;

class CounterController extends GetxController {
  // Variable reactiva para el contador (privada)
  var _count = 1.obs;

  // Getter: Obtiene el valor actual del contador
  int get count => _count.value;

  // Setter: Actualiza el valor del contador con validación
  set count(int newValue) {
    if (newValue >= 0) {
      _count.value = newValue; // Solo permite valores mayores o iguales a cero
    }
  }

  // Método para incrementar el contador
  void increment() {
    count = count + 1; // Usa el setter para actualizar el valor
    if (count > 5) {
      count = 1; // Reinicia el contador si supera 5
    }
  }

  // Método para decrementar el contador
  void decrement() {
    count = count - 1; // Usa el setter para actualizar el valor
  }
}


class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child:
              Obx(() =>
                  CircleAvatar(
                   backgroundImage:   AssetImage('assets/${counterController.count}.jpeg'),
                  )
              ),
        ),
        title: Center(child: Text("astrid"),),
        actions: [
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: (){
              counterController.increment();
            },
          ),
          IconButton(
              onPressed: () async {
                try {
                  // Realizar la solicitud GET
                  final response = await http.get(Uri.parse('https://catfact.ninja/fact'));

                  // Verificar si la solicitud fue exitosa
                  if (response.statusCode == 200) {
                      print(response.body);
                  } else {
                    print("Error: ${response.statusCode}");
                  }
                } catch (e) {
                  print("Exception occurred: $e");
                }
              },
            icon: Icon(Icons.get_app)
          )
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends  StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider=context.watch<ChatProvider>();


    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:   10 ),
        child: Column(
          children: [
            /*Expanded(child: Container(
              color: Colors.blue,
            )),*/
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
               /* itemCount: 100,
                itemBuilder: (context, index) {
                   return (index % 2 ==0)
                     ? HerMessageBubble() : MyMessageBubble();
                },*/
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                   final message=chatProvider.messageList[index];
                   return ( message.fromWho == FromWho.hers)
                           ? HerMessageBubble(message: message)
                           : MyMessageBubble(message: message);
                },

              ),
            ),
            //caja de texto
            MessageFieldBox(
              onValue: (value)=> chatProvider.sendMessage(value),
            ),// Text("data")
          ],
        ),
      ),
    );
  }
}


