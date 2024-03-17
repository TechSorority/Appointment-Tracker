import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project/firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
   
     MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
int token = 0;

final firebase = FirebaseFirestore.instance;

void createCollection()async{
  await firebase.collection('token').doc().update({
    'token':token
  });
}

@override
 
  @override
  Widget build(BuildContext context) {
    createCollection();
    return MaterialApp(
      title: 'Appoinment Tracker',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 234, 229, 233)),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('APPOINTMENT TRACKER',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.0,
            color: Color(0xFF00806C),  
          )
          ),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 23, 198, 174),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight:Radius.circular(25),
              topLeft:Radius.circular(25),
              topRight:Radius.circular(25),
              ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('HOSPITAL NAME',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Color.fromARGB(255, 0, 128, 108),
              ),),
              Text(token.toString(),style: const TextStyle(
                fontSize: 100.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
                color: Color.fromARGB(255, 0, 128, 108),
              ),),
              Text(
              'Token number',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
                color: Color.fromARGB(255, 0, 128, 108),
              ),
                      ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
          setState(() {
            token = token+1;

          });
        },child: Icon(Icons.add),),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        backgroundColor: Color.fromARGB(255, 230, 234, 234),
        
    
    ),
    );
  }
}

