import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';




class HerMessageBubble extends StatelessWidget {
  final Message message;
  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary,//Colors.black,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Text(message.text,style: TextStyle(color: Colors.white)),
          ),
        ),
        SizedBox(height: 5),
        _ImageBubble(imageUrl: message.imageUrl!),
        SizedBox(height: 10),
      ],
    );//Text("My message");
  }
}


class _ImageBubble extends StatelessWidget {
  final String imageUrl;

   const _ImageBubble({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
        child: Image.network(imageUrl/*"https://yesno.wtf/assets/yes/14-b57c6dc03aa15a4b18f53eb50d6197ee.gif"*/,
          width: size.width*0.5,
          height: 220,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
              if(loadingProgress == null) return child;
              return Container(
                 width: size.width * 0.5,
                  height: 220,
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: Center(child: Text("Cargando..."),),
              );
          },
        ),
    );
  }
}
