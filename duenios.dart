import 'package:flutter/material.dart';
import 'package:pet_aplication/providers/duenios_modelo.dart';
import 'package:pet_aplication/providers/share.dart';
import 'package:pet_aplication/services/loginService.dart';

class duenios extends StatefulWidget {
  const duenios({Key? key}) : super(key: key);

  @override
  State<duenios> createState() => _dueniosState();
}

class _dueniosState extends State<duenios> {
  @override
  TextEditingController _textFieldController = TextEditingController();
  late List<String> lista_Datos = [];
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  int tamLista = 0;
  List lista_datos = [];
  void initState() {
    super.initState();
    local().getToken().then((token) => {
          get_duenios_all(token!).then((resultado) {
            // listaDatos(value.length, value);
            //print(resultado);
            tamLista = resultado.length;
            lista_datos = resultado;
            // print("Tamanio de la lista:");
            // print(resultado.length);
            // for (var i = 0; i < resultado.length; i++) {
            //   lista_datos.add(resultado[i]);
            // }
            // print("Lista de mascotas que recupera");
            //print(lista_datos);
          }),
        });
    refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Mascotas'),
      ),
      body: tamLista > 0
          ? RefreshIndicator(
              child: listaDatos(tamLista, lista_datos, context),
              onRefresh: refreshList,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show();
    await Future.delayed(const Duration(seconds: 1));
    setState(
      () {
        local().getToken().then(
              (token) => {
                get_duenios_all(token!).then(
                  (lista) {
                    tamLista = lista.length;
                    lista_datos = lista;
                  },
                ),
              },
            );
      },
    );
    return null;
  }

  //https://www.kindacode.com/article/flutter-listtile/
  Widget listaDatos(int lenghtLista, List lista, BuildContext context) {
    final List<Map<String, dynamic>> _items = List.generate(
      lenghtLista,
      (index) => {
        "id": index,
        "title": "Nombre: " + lista[index]['nombreMascota'],
        //"title": "Mascota: ",
        "subtitle": "Tipo: " + lista[index]['tipo'],
        //"subtitle": "Tipo: "
        // " | Apellido: " +
        // lista[index]['apellidos']
      },
    );
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (_, index) => Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(
            _items[index]['title'],
          ),
          subtitle: Text(
            _items[index]['subtitle'],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  print("vamos a la vista de actualizar");
                  print(lista[index]['idMascota']);
                  lista_Datos.add(lista[index]['idMascota'].toString());
                  lista_Datos.add(lista[index]['nombreMascota']);
                  lista_Datos.add(lista[index]['idUsuario'].toString());
                  lista_Datos.add(lista[index]['tipo']);
                  lista_Datos.add(lista[index]['edad'].toString());
                  //lista_Datos.add(lista[index]['apellidos']);

                  // print(lista_datos);
                  late List ListaNavigador = [];
                  ListaNavigador.add(lista[index]['idMascota'].toString());
                  ListaNavigador.add(lista[index]['nombreMascota']);
                  ListaNavigador.add(lista[index]['idUsuario'].toString());
                  ListaNavigador.add(lista[index]['tipo']);
                  ListaNavigador.add(lista[index]['edad'].toString());
                  
                  local().setDuenio(lista_Datos);
                  Navigator.pushReplacementNamed(context, 'edit_duenios',
                      arguments: ListaNavigador);
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {
                  // String id_STR = lista_navigator.toString()[1];
                  // int id_casteado = int.parse(lista_navigator.toString()[1]);

                  // ignore: unnecessary_new
                  // Usuario user = new Usuario(
                  //   idMascota: lista[index]['idMascota'],
                  //   nombreMascota: lista[index]['nombreMascota'],
                  //   // apellidos: lista[index]['apellidos'],
                  //   idUsuario: lista[index]['idusuario'],
                  //   tipo: 'tipo',
                  //   edad: lista[index]['edad'],
                  // );
                  print("Eliminando mascota");
                  print(lista[index]['idMascota']);
                  local().getToken().then(
                    (token) {
                      deleteDuenio(lista[index]['idMascota'], token!).then(
                        (value) {
                          //print(value);
                          Navigator.pushReplacementNamed(context, 'duenios');
                        },
                      );
                    },
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
