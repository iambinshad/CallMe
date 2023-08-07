import 'package:callme/common/widgets/loading_holder.dart';
import 'package:callme/services/firebase_service.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingHolder(
          isLoading: isLoading,
          child: Column(
            children: [
              TextFormField(
                decoration:InputDecoration(border: OutlineInputBorder()),
                
                controller: email,
              ),
              TextFormField(
                 decoration:InputDecoration(border: OutlineInputBorder()),
                controller: password,
              ),
              ElevatedButton(
                  onPressed: () {
                    FirebaseService.login(
                        email: email.text, password: password.text);
                  },
                  child: const Text("LOGIN"))
            ],
          )),
    );
  }
}
