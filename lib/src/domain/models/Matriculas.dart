import 'dart:convert';

Matriculas matriculasFromJson(String str) =>
    Matriculas.fromJson(json.decode(str));

String matriculasToJson(Matriculas data) => json.encode(data.toJson());

class Matriculas {
  int? id;
  String curso;
  String estudiante;
  String? nhoras;
  String? ncreditos;
  String? estado;

  Matriculas({
    this.id,
    required this.curso,
    required this.estudiante,
    this.nhoras,
    this.ncreditos,
    this.estado,
  });

  static List<Matriculas> fromJsonList(List<dynamic> jsonList) {
    List<Matriculas> toList = [];
    jsonList.forEach((item) {
      Matriculas matriculas = Matriculas.fromJson(item);
      toList.add(matriculas);
    });
    return toList;
  }

  factory Matriculas.fromJson(Map<String, dynamic> json) => Matriculas(
        id: json["id"],
        curso: json["curso"],
        estudiante: json["estudiante"],
        nhoras: json["nhoras"],
        ncreditos: json["ncreditos"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "curso": curso,
        "estudiante": estudiante,
        "nhoras": nhoras,
        "ncreditos": ncreditos,
        "estado": estado,
      };
}
