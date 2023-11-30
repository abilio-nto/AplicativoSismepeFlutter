import 'dart:convert';

class Usuario {
  final int id;
  final int matricula;
  final String nome;
  final String nomePai;
  final String nomeMae;
  final String sexo;
  final String cpf;
  final String rg;
  final String telefone;
  final String dataNascimento;
  final String dataCadastro;
  final String ativo;
  final String foto;

  Usuario({
    required this.id,
    required this.matricula,
    required this.nome,
    required this.nomePai,
    required this.nomeMae,
    required this.sexo,
    required this.cpf,
    required this.rg,
    required this.telefone,
    required this.dataNascimento,
    required this.dataCadastro,
    required this.ativo,
    required this.foto
  });

  Usuario.defaultValue()
      : id = 0,
  nome = 'Nome padrão',
        matricula = 0,
  nomePai= 'Nome do pai padrão',
  nomeMae= 'Nome da mãe padrão',
  sexo= 'Sexo padrão',
  cpf= 'CPF padrão',
  rg= 'RG padrão',
  telefone='Telefone padrão',
  dataNascimento= 'Data de nascimento padrão',
  dataCadastro= 'Data de cadastro padrão',
  ativo= 'Ativo padrão',
  foto = "Usuário sem foto";


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'matricula':matricula,
      'nome': nome,
      'nomePai': nomePai,
      'nomeMae': nomeMae,
      'sexo': sexo,
      'foto': foto,
      'cpf': cpf,
      'rg': rg,
      'telefone': telefone,
      'dataNascimento': dataNascimento,
      'dataCadastro': dataCadastro,
      'ativo': ativo
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'] ?? 0,
      matricula: map['matricula'] ?? 0,
      nome: map['nome'] ?? "",
      nomePai: map['nomePai'] ?? "",
      nomeMae: map['nomeMae']??"",
      sexo: map['sexo']??"",
      cpf: map['cpf']?? "",
      rg: map['rg']?? "",
      telefone: map['telefone']?? "",
      dataNascimento: map['dataNascimento']?? "",
      dataCadastro: map['dataCadastro']?? "",
      ativo: map['ativo']?? "",
      foto: map['foto']?? "",
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(jsonDecode(source));

  @override
  String toString() {
    return 'Usuario{id: $id, foto: $foto, matricula: $matricula, nome: $nome, nomePai: $nomePai, nomeMae: $nomeMae, sexo: $sexo, cpf: $cpf, rg: $rg, telefone: $telefone, dataNascimento: $dataNascimento, dataCadastro: $dataCadastro, ativo: $ativo}';
  }

}
