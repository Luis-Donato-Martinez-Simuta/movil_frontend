import 'package:flutter/material.dart';
import 'package:movil_patitas_felices/src/pages/Login.dart';
import 'package:movil_patitas_felices/src/pages/Regitro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _ClasePincipal createState() => _ClasePincipal();
}

class _ClasePincipal extends State<MyApp> {
  int actualPage = 0;
  String titlePage = "LOGIN";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'movil',
      initialRoute: 'Login',
      routes: {
        'Login': (BuildContext context) => const Login(),
        'Registro': (BuildContext context) => const Registro(),
      },
    );
  }
}
