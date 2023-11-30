import 'dart:convert';

import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Parentesco.dart';



class Dependente extends Beneficiario {
  final int sequencial;
  final String dataConcessao;

  Dependente({required super.id, required super.nome, required super.matricula, required super.dataNascimento, required super.corporacao, required super.ativo, required this.sequencial, required this.dataConcessao, required super.isCheck});

  factory Dependente.fromMap(Map<String,dynamic> map){
    return Dependente(
        id: map['id'] ?? 0,
        nome: map['nome'] ?? "",
        matricula: map['matricula'] ?? 0,
        dataNascimento: map['dataNascimento'] ?? "",
        corporacao: map['corporacao'] ?? 0,
        ativo: map['ativo'] ?? "",
        sequencial: map['sequencial'] ?? 0,
        dataConcessao: map['dataConcessao'] ?? "",
        isCheck:map['isCheck'] ?? false
    );
  }

  Dependente.defaultValues()
      : sequencial = 0,
        dataConcessao = 'Data padrão',
        super.defaultValues();

  factory Dependente.fromJson(String json){
    final jsonMap = jsonDecode(json);
    return Dependente.fromMap(jsonMap);
  }

  static List<Dependente> fromMapList(List<Map<String, dynamic>> mapList) {
    return mapList.map((map) => Dependente.fromMap(map)).toList();
  }

  // int id;
  // String nome;
  // int matricula;
  // int sequencial;
  // String dataConcessao;
  // String dataNascimento;
  // int corporacao;
  // String ativo;
  // Parentesco parentesco;
  //
  // Dependente(
  //     {required this.id,
  //     required this.nome,
  //     required this.matricula,
  //     required this.sequencial,
  //     required this.dataConcessao,
  //     required this.dataNascimento,
  //     required this.corporacao,
  //     required this.ativo,
  //     required this.parentesco});
  //
  // Dependente.defaultValues()
  //     : id = 0,
  //       nome = 'Nome padrão',
  //       matricula = 0,
  //       sequencial = 0,
  //       dataConcessao = 'Data padrão',
  //       dataNascimento = 'Data padrão',
  //       corporacao = 0,
  //       ativo = 'Ativo padrão',
  //       parentesco = Parentesco.defaultValues();
  //
  // //Metodo que pega o obj dependente e transforma em um obj Map<String,dynamic>
  // //toMap()
  // //passo 1
  // Map<String, dynamic> toMap() {
  //   return {
  //         'id': id,
  //         'nome': nome,
  //         'matricula': matricula,
  //         'sequencial':sequencial,
  //         'dataConcessao':dataConcessao,
  //         'corporacao':corporacao,
  //         'ativo':ativo,
  //         'parentesco':parentesco,
  //          'dataNascimento':dataNascimento,
  //   };
  // }
  //
  // //Metodo que pega o obj Map<String,dynamic>  e transforma em um json pelo pacote dart:convert  (jsonEncode)
  // //toJson()
  // //passo 2
  // String toJson() => jsonEncode(toMap());
  //
  // //passo 2 da deserialização
  // factory Dependente.fromMap(Map<String,dynamic> map){
  //   return Dependente(
  //     id: map['id'] ?? 0,
  //     nome: map['nome']?? "",
  //     matricula: map['matricula'] ?? 0,
  //     sequencial: map['sequencial']?? 0,
  //     dataConcessao: map['dataConcessao']??"",
  //     dataNascimento: map['dataNascimento']??"",
  //     corporacao: map['corporacao']??0,
  //     ativo: map['ativo']??"",
  //     parentesco: Parentesco.fromMap(map['parentesco'] ?? <String, dynamic>{}),
  //   );
  // }
  //  factory Dependente.fromJson(String json){
  //     final jsonMap = jsonDecode(json);
  //     return Dependente.fromMap(jsonMap);
  //  }
  // @override
  // String toString() {
  //   return 'Dependente{id: $id, nome: $nome, matricula: $matricula, sequencial: $sequencial, dataConcessao: $dataConcessao, dataNascimento : $dataNascimento ,corporacao: $corporacao, ativo: $ativo, parentesco: $parentesco}';
  // }
}
