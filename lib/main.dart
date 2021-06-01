import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hsvh_test/auth_service.dart';
import 'package:hsvh_test/login_page.dart';
import 'package:hsvh_test/splash_screen.dart';

import 'package:hsvh_test/webview.dart';
import 'package:provider/provider.dart';
//import 'login_page.dart';

//import 'webview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              StreamProvider.value(
                value: AuthService().user,
                initialData: null,
              )
            ],
            child: Consumer<User?>(
              builder: (ctx, user, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Applore',
                home: user == null ? LoginPage() : LandingPage(),
                routes: {
                  LandingPage.routeName: (context) => LandingPage(),
                  LoginPage.routeName: (context) => LoginPage(),
                },
              ),
            ),
          );
        } else {
          return MaterialApp(
            home: SplashScreen(),
          );
        }
      },
    );
  }
}
