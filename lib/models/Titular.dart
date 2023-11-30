import 'dart:convert';

import 'package:carteirasismepe/models/Beneficiario.dart';

import 'Dependente.dart';

class Titular extends Beneficiario {
  final int digito;
  final String dataInclusao;
  final String foto;

  Titular({required super.id,required this.foto, required super.nome, required super.matricula, required super.dataNascimento, required super.corporacao, required super.ativo, required this.digito, required this.dataInclusao, required super.isCheck});

  factory Titular.fromMap(Map<String,dynamic> map){
    return Titular(
        id: map['id'] ?? 0,
        nome: map['nome'] ?? "",
        matricula: map['matricula'] ?? 0,
        dataNascimento: map['dataNascimento'] ?? "",
        corporacao: map['corporacao'] ?? 0,
        ativo: map['ativo'] ?? "",
        digito: map['digito'] ?? 0,
        dataInclusao: map['dataInclusao'] ?? "",
        foto: map['foto'] ?? "",
        isCheck:map['isCheck'] ?? false
    );
  }
  Titular.defaultValues()
      : digito = 0,
        dataInclusao = 'Data padrão',
       foto = "Usuário sem foto",
        super.defaultValues();

  factory Titular.fromJson(String json){
    final jsonMap = jsonDecode(json);
    return Titular.fromMap(jsonMap);
  }


  // int id;
  // String nome;
  // int matricula;
  //  int digito;
  // String dataNascimento;
  // int corporacao;
  // String ativo;
  // String dataInclusao;
  // // List<Dependente> dependentes;
  //
  // Titular({required this.id,
  //   required this.nome,
  //   required this.matricula,
  //   required this.digito,
  //   required this.dataNascimento,
  //   required this.corporacao,
  //   required this.ativo,
  //   required this.dataInclusao,
  //   // required this.dependentes
  // });
  //
  // Titular.defaultValues()
  //     : id = 0,
  //       nome = 'Nome padrão',
  //       matricula = 0,
  //       digito = 0,
  //       dataNascimento = 'Data padrão',
  //       dataInclusao = 'Data padrão',
  //       corporacao = 0,
  //       ativo = 'Ativo padrão';
  //
  //
  // //Metodo que pega o obj dependente e transforma em um obj Map<String,dynamic>
  // //toMap()
  // //passo 1
  // Map<String, dynamic> toMap() {
  //   return {
  //     'id': id,
  //     'nome': nome,
  //     'matricula': matricula,
  //     'digito':digito,
  //     'dataNascimento':dataNascimento,
  //     'corporacao':corporacao,
  //     'ativo':ativo,
  //     'dataInclusao' : dataInclusao
  //   };
  // }
  //
  // //Metodo que pega o obj Map<String,dynamic>  e transforma em um json pelo pacote dart:convert  (jsonEncode)
  // //toJson()
  // //passo 2
  // String toJson() => jsonEncode(toMap());
  //
  // //passo 2 da deserialização
  // factory Titular.fromMap(Map<String,dynamic> map){
  //   return Titular(id: map['id'] ?? 0,
  //       nome: map['nome'] ?? "",
  //       matricula: map['matricula'] ?? 0,
  //       digito: map['digito'] ?? 0,
  //       dataNascimento: map['dataNascimento'] ?? "",
  //       corporacao: map['corporacao'] ?? 0,
  //       ativo: map['ativo'] ??"",
  //       dataInclusao: map['dataInclusao'] ??"");
  //
  // }
  //
  // factory Titular.fromJson(String json){
  //   final jsonMap = jsonDecode(json);
  //   return Titular.fromMap(jsonMap);
  // }
  //
  // @override
  // String toString() {
  //   return 'Titular{id: $id, nome: $nome, matricula: $matricula, digito: $digito,dataInclusao: $dataInclusao, dataNascimento: $dataNascimento, corporacao: $corporacao, ativo: $ativo}';
  // }

}
