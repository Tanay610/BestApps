import 'package:chat_gpt/providers/chats_provider.dart';
import 'package:chat_gpt/providers/models_providers.dart';
import 'package:chat_gpt/screens/chat_screen.dart';
import 'package:flutter/material.dart';

import 'package:chat_gpt/constants/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider(),),
        ChangeNotifierProvider(create: (_) => ChatProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldBGcolor,
          appBarTheme: AppBarTheme(color: carColor),
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
