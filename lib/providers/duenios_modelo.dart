class UsuarioList {
  final List<Usuario> usuario;

  UsuarioList({
    required this.usuario,
  });

  factory UsuarioList.fromJson(Map<String, dynamic> parsedJson) {
    Iterable list = parsedJson['user'];

    List<Usuario> usuario = list.map((i) => Usuario.fromJson(i)).toList();

    return new UsuarioList(usuario: usuario);
  }
}

class Usuario {
  final int idMascota;
  final String nombreMascota;
  // final String apellidos;
  final int idUsuario;
  final String tipo;
  final String edad;

  Usuario({
    required this.idMascota,
    required this.nombreMascota,
    // required this.apellidos,
    required this.idUsuario,
    required this.tipo,
    required this.edad,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idMascota: json['idMascota'],
        nombreMascota: json['nombreMascota'],
        idUsuario: json['idusuario'],
        tipo: json['tipo'],
        edad: json['edad'],
      );
}
