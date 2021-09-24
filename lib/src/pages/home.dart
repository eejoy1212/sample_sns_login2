import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sample_sns_login/src/pages/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("firebase sns login"),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          // builder: (context, snapshot) {
          print('Stream');
          if (!snapshot.hasData) {
            return LoginWidget();
          } else {
            return Center(
              child: Column(
                children: [Text("${snapshot.data!.displayName}님 환영합니다.")],
              ),
            );
          }
        },
      ),
    );
  }
}
