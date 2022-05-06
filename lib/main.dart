import 'package:flutter/material.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

import 'chat/chat_list.dart';
import 'constants/constants.dart';

void main() async {
  final client = StreamChatClient(Constants.apiKey, logLevel: Level.INFO);
  await client.connectUser(User(id: 'tutorial-flutter'), Constants.token);
  // final channel = client.channel('messaging', id: 'flutterdevs');
  // await channel.watch();
  runApp(ChatApp(client: client));
}

class ChatApp extends StatelessWidget {
  final StreamChatClient client;

  const ChatApp({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => StreamChat(
        client: client,
        child: child,
        streamChatThemeData: StreamChatThemeData.fromTheme(ThemeData.light()),
      ),
      home: const ChannelListPage(),
    );
  }
}
