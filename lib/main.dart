import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quoteapi/firebase_options.dart';
import 'package:quoteapi/provider/QutesProvider.dart';
import 'package:quoteapi/provider/albumprovider.dart';
import 'package:quoteapi/provider/be_provider.dart';
import 'package:quoteapi/provider/comment_provider.dart';
import 'package:quoteapi/provider/dashboard_provider.dart';
import 'package:quoteapi/provider/photo_provider.dart';
import 'package:quoteapi/provider/post_provider.dart';
import 'package:quoteapi/provider/reciept_provider.dart';
import 'package:quoteapi/provider/sockrtprovider.dart';
import 'package:quoteapi/provider/user_provider.dart';
import 'package:quoteapi/screens/be_screen.dart';
import 'package:quoteapi/screens/comment_screen.dart';
import 'package:quoteapi/screens/post_screen.dart';
import 'package:quoteapi/screens/reciept_screen.dart';


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
    ChangeNotifierProvider(create: (_)=>BeProvider()),
    ChangeNotifierProvider(create: (_)=>CommentProvider()),
    ChangeNotifierProvider(create: (_)=>RecipeProvider()),
    ChangeNotifierProvider(create: (_)=>PostProvider()),
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


         home: PostScreen(),
        // home: RecipeScreen(),
      //   home: CommentScreen(),
      //   home: BeScreen(),
     // home: AlbumScreeen(),
    //  home: UserListScreen(),
     // home: DashboardScreen(),
     // home: QuotesScreen(),
    );
  }
}
