import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/views/providers/chat_provider.dart';
import 'package:yes_no_app/views/screens/chat/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ChatProvider())//envolver toda la app con el provider
      ],
      child: MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner:false,
          theme: AppTheme(selectedColor:0).theme(),/*ThemeData(
            useMaterial3: true,
            colorSchemeSeed:Colors.blue
        ),*/
          home: ChatScreen()
      ),
    );
  }
}