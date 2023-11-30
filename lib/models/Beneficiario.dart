import 'dart:convert';

import 'Dependente.dart';
import 'Titular.dart';

class Beneficiario {


  int id;
  String nome;
  int matricula;
  // int digito;
  String dataNascimento;
  int corporacao;
  String ativo;
  bool isCheck;
  // String dataInclusao;
  // List<Dependente> dependentes;

  Beneficiario({required this.id,
    required this.nome,
    required this.matricula,
    required this.dataNascimento,
    required this.corporacao,
    required this.ativo,
    required this.isCheck
  });

  Beneficiario.defaultValues()
      : id = 0,
        nome = 'Nome padrão',
        matricula = 0,
        dataNascimento = 'Data padrão',
        corporacao = 0,
        isCheck = false,
        ativo = 'Ativo padrão';



  //Metodo que pega o obj dependente e transforma em um obj Map<String,dynamic>
  //toMap()
  //passo 1
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'matricula': matricula,
      'dataNascimento':dataNascimento,
      'corporacao':corporacao,
      'ativo':ativo,
      'isCheck':isCheck
    };
  }

  //Metodo que pega o obj Map<String,dynamic>  e transforma em um json pelo pacote dart:convert  (jsonEncode)
  //toJson()
  //passo 2
  String toJson() => jsonEncode(toMap());

  factory Beneficiario.fromMap(Map<String,dynamic> map){
    return Beneficiario(id: map['id'] ?? 0,
        nome: map['nome'] ?? "",
        matricula: map['matricula'] ?? 0,
        dataNascimento: map['dataNascimento'] ?? "",
        corporacao: map['corporacao'] ?? 0,
        ativo: map['ativo'] ??"",
        isCheck:map['isCheck'] ?? false
    );
  }

  factory Beneficiario.fromJson(String json){
    final jsonMap = jsonDecode(json);
    return Beneficiario.fromMap(jsonMap);
  }

  @override
  String toString() {
    return 'Beneficiario{id: $id, nome: $nome, matricula: $matricula, dataNascimento: $dataNascimento, corporacao: $corporacao, ativo: $ativo, isCheck:$isCheck}';
  }



// final Titular titular;
  // final List<Dependente> dependentes;
  //
  // Beneficiario({
  //   required this.titular,
  //   required this.dependentes
  // });
  //
  // Beneficiario.defaultValues()
  //     : titular = Titular.defaultValues(),
  //       dependentes = [];
  //
  //
  //
  // Map<String, dynamic> toMap() {
  //   return {
  //     'titular': titular.toMap(),
  //     'dependentes': dependentes.map((dependente) => dependente.toMap()).toList(),
  //   };
  // }
  //
  // String toJson() => jsonEncode(toMap());
  //
  // factory Beneficiario.fromMap(Map<String,dynamic> map){
  //   return Beneficiario(
  //       titular: Titular.fromMap(map['titular']),
  //       dependentes: (map['dependentes'] as List).map((item) => Dependente.fromMap(item)).toList());
  // }
  //
  // factory Beneficiario.fromJson(String json){
  //   final jsonMap = jsonDecode(json);
  //   return Beneficiario.fromMap(jsonMap);
  // }
  //
  // @override
  // String toString() {
  //   return 'Beneficiario{titular: $titular, dependentes: $dependentes}';
  // }
}
