import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/firebase_options.dart';
import 'package:quoteapi/provider/QutesProvider.dart';
import 'package:quoteapi/provider/sockrtprovider.dart';
import 'package:quoteapi/screens/sockrt_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
   );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>QutesProvider()),
    ChangeNotifierProvider(create: (_)=>SocketProvider())
  ]
  ,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SocketScreen(),
     // home: QuotesScreen(),
    );
  }
}
