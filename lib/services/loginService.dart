// import 'dart:_http';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pet_aplication/providers/duenios_modelo.dart';
import 'package:pet_aplication/providers/loginProvider.dart';

Future<List<dynamic>> login(String usuario, String password) async {
  print("iniciando logueo");
  try {
    final response = await http.post(Uri.http('10.0.2.2:8888', '/loginUser'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: json.encode({
          "usuario": usuario,
          "password": password,
        }));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      //print("Idusuario:" + data[0]);
      if (data == null) {
        return [];
      } else {
        return data;
      }
    } else {
      return ['No se ha podido conectar al servidor'];
    }
  } catch (e) {
    return ['Error en la respuesta'];
  }
}

Future<List<dynamic>> get_duenios_all(String token) async {
  var resultado;
  print(LoginProvider().jwt);
  print('object');
  try {
    final response =
        await http.get(Uri.http('10.0.2.2:7777', '/listMascotas'), headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      // HttpHeaders.authorizationHeader: LoginProvider().jwt
      HttpHeaders.authorizationHeader: token
    });

    // body: json.encode({"username": usuario, "password": password}));
    // resultado = json.decode(response.body);
    resultado = [
      {"id": 1, "nombreMascota": "Perro","tipo":"Perro"}
    ];
    print("Esto es lo que devuelve el resultado $resultado");
    //print(resultado);
    return resultado;
  } catch (e) {
    return ['Error en la respuesta'];
  }
}

Future<List<dynamic>> updateDuenio(Usuario usuario, String token) async {
  try {
    final response = await http.post(
      Uri.http('10.0.2.2:7777', '/user/update'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: token
      },
      body: json.encode({
        "id": usuario.idUsuario,
        "username": usuario.nombreMascota,
        "password": usuario.nombreMascota,
        "tipoUsuario": usuario.tipo,
        "edad": usuario.idUsuario,
        "nombrePersona": usuario.nombreMascota,
        "telefono": usuario.edad,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      if (data == null) {
        return [];
      } else {
        return data;
      }
    } else {
      return ['No se ha podido conectar al servidor'];
    }
  } catch (e) {
    return ['Error en la respuesta'];
  }
}

Future<List<dynamic>> deleteDuenio(int IdMascota, String token) async {
  print("Token: " + token);
  try {
    final response = await http.post(
      Uri.http('127.0.0.1:7777', '/eliminar_mascota/' + IdMascota.toString()),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: token
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      if (data == null) {
        return [];
      } else {
        return data;
      }
    } else {
      return ['No se ha podido conectar al servidor'];
    }
  } catch (e) {
    return ['Error en la respuesta'];
  }
}
