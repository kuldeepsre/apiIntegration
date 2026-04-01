import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/firebase_options.dart';
import 'package:quoteapi/provider/QutesProvider.dart';
import 'package:quoteapi/provider/albumprovider.dart';
import 'package:quoteapi/provider/be_provider.dart';
import 'package:quoteapi/provider/dashboard_provider.dart';
import 'package:quoteapi/provider/photo_provider.dart';
import 'package:quoteapi/provider/sockrtprovider.dart';
import 'package:quoteapi/provider/user_provider.dart';
import 'package:quoteapi/screens/album_screen.dart';
import 'package:quoteapi/screens/be_screen.dart';

import 'package:quoteapi/screens/user_list.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform
   );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_)=>QutesProvider()),
    ChangeNotifierProvider(create: (_)=>SocketProvider()),
    ChangeNotifierProvider(create: (_) => DashboardProvider()),
    ChangeNotifierProvider(create: (_)=>PhotoProvider()),
    ChangeNotifierProvider(create: (_)=>UserProvider()),
    ChangeNotifierProvider(create: (_)=>AlbumProvider()),
    ChangeNotifierProvider(create: (_)=>BeProvider())
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
         home: BeScreen(),
     // home: AlbumScreeen(),
    //  home: UserListScreen(),
     // home: DashboardScreen(),
     // home: QuotesScreen(),
    );
  }
}
