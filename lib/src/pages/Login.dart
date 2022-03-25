//import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 50,
            ),
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                //fit: BoxFit.fill,
                image: NetworkImage(
                  //"https://png.pngtree.com/png-clipart/20190610/original/pngtree-userpeoplelinear-iconuser-png-image_1859764.jpg",
                  "https://scontent.fpbc1-2.fna.fbcdn.net/v/t1.6435-9/134724655_107135327983038_1406202755537195958_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=e3f864&_nc_eui2=AeEktUTe8kSeNpYEGyxxfmZ5RcZHIj1_dE1FxkciPX90TXsfx0519f3_ApIsFiBwTn-QeK-0WaFRLS4_ebhJbx8G&_nc_ohc=AP2QlS28AOoAX8BUi7_&_nc_ht=scontent.fpbc1-2.fna&oh=00_AT8Qai7HGfT1vAEspJbvf8jmX0c7NXFvVlbTpipJ_S0vhQ&oe=6264605E",
                ),
              ),
            ),
            /*
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
            */
          ),
          Container(
            height: 40,
            width: 250,
            margin: const EdgeInsets.only(
              left: 30,
              top: 50,
              right: 30,
            ),
            child: const TextField(
              decoration: InputDecoration(
                labelText: 'Nombre',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 40,
            width: 250,
            margin: const EdgeInsets.only(
              left: 30,
              top: 50,
              right: 30,
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: 'Contraseña',
              ),
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
              obscureText: true,
            ),
          ),
          Container(
            height: 40,
            width: 250,
            margin: const EdgeInsets.only(
              left: 30,
              top: 70,
              right: 30,
            ),
            child: MaterialButton(
              //38d39f
              color: const Color(0xFF38d39f),
              textColor: Colors.white,
              child: const Text("Aceptar"),
              onPressed: () {
                //print("Hola mundo");
                Navigator.pushNamed(context, 'Registro');
              },
            ),
          ),
        ],
      ),
    );
  }
}
