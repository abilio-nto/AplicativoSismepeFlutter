import 'dart:convert';

class Parentesco {
  int id;
  String descricao;

  Parentesco({required this.id, required this.descricao});

  //Metodo que pega o obj dependente e transforma em um obj Map<String,dynamic>
  //toMap()
  //passo 1
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,

    };
  }

  Parentesco.defaultValues()
      : id = 0, descricao="";


  //Metodo que pega o obj Map<String,dynamic>  e transforma em um json pelo pacote dart:convert  (jsonEncode)
  //toJson()
  //passo 2
  String toJson() => jsonEncode(toMap());

  //passo 2 da deserialização
  factory Parentesco.fromMap(Map<String,dynamic> map){
    return Parentesco(   id: map['id'] ?? 0, // Use 0 como valor padrão se o id for null
        descricao: map['descricao'].toString(),

    );
  }

  factory Parentesco.fromJson(String json){
    final jsonMap = jsonDecode(json);
    return Parentesco.fromMap(jsonMap);
  }

  @override
  String toString() {
    return 'Parentesco{id: $id, descricao: $descricao}';
  }

}
