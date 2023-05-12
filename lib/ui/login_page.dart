import 'package:cash_mart/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LogPageState createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  //inject the dependence
  final loginController = Get.put(LoginController());

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Welcome Cashmart",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  labelText: 'email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            MaterialButton(
                color: Colors.green.shade400,
                child: const Text('Log In'),
                onPressed: () {

                  //calling loginMethod by loginController
                  loginController.getLogIn(
                      _emailController, _passwordController);
                })
          ],
        ),
      ),
    );
  }
}
