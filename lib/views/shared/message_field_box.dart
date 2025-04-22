import 'package:flutter/material.dart';



class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

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
                onValue(textValue);
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
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
