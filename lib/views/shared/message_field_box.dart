import 'package:flutter/material.dart';



class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {
    final textController=TextEditingController();
    final focusNode=FocusNode();


    final colors = Theme.of(context).colorScheme;
    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40)
    );
    final inputDecoration =  InputDecoration(
        hintText: "?",
        filled: true,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,/*OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.circular(20)
        ),*/
        suffixIcon: IconButton(
            onPressed: (){
                final textValue = textController.value.text;
                print("valor: $textValue");
                textController.clear();
            },
            icon: Icon(Icons.send_outlined)
        )
    );
    return TextFormField(
      onTapOutside: (event) {
         focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration:inputDecoration,
      onFieldSubmitted: (value) {
        //print("valor: $value");
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
