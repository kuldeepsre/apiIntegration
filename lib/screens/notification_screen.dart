import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quoteapi/screens/notificationDetails.dart';
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}
class _NotificationScreenState extends State<NotificationScreen> {
  void firebaseMessage() async{
    FirebaseMessaging massaging=FirebaseMessaging.instance;
    String ? token=await massaging.getToken();
    if (kDebugMode) {
      print("FCMToken : $token");
    }
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title =message.notification?.title?? "NA";
      final body =message.notification?.body?? "NA";
       showDialog(context: context,
           builder: (context)=>AlertDialog(
             title: Text(title,),
             content: Text(body,maxLines: 1,style: TextStyle(overflow:TextOverflow.ellipsis),),
             actions: [
               TextButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>
               NotificationDetails(title:title,body:body))), child: Text("NEXT")),
               TextButton(onPressed:() {
                 Navigator.pop(context);
               }, child: Text("Cancel"))
             ],
           )
       );
      print('Received message: ${message.notification?.title}');
    });

}
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
