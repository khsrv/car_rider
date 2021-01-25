import 'package:car_rider/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final FirebaseApp app = await Firebase.initializeApp(
    name: 'db2',
    options: Platform.isIOS || Platform.isMacOS
        ? FirebaseOptions(
            appId: '1:227291038045:ios:859ff7ea604dcff9b128b4',
            apiKey: 'AIzaSyAmmn-FFUohudleuNPsh5-f1n8o8i6SbSo',
            projectId: 'taxi-mobile-app-d507f',
            messagingSenderId: '227291038045',
            databaseURL:
                'https://taxi-mobile-app-d507f-default-rtdb.firebaseio.com',
          )
        : FirebaseOptions(
            appId: '1:227291038045:android:5c598845cf39eee7b128b4',
            apiKey: 'AIzaSyBpm7rwBIwVion-_nqDhngy3jZHw0TxKlk',
            messagingSenderId: '227291038045',
            projectId: 'taxi-mobile-app-d507f',
            databaseURL:
                'https://taxi-mobile-app-d507f-default-rtdb.firebaseio.com',
          ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}
