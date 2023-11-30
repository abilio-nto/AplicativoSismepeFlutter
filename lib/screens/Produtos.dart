import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';

class Produtos extends StatefulWidget {
  const Produtos({super.key});

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  @override
  Widget build(BuildContext context) {
    var beneficiario = Beneficiario.defaultValues();
    var titular =  Titular.defaultValues();
    var dependente =  Dependente.defaultValues();
    return MaterialApp(
      home: Scaffold(
        
        body: Servicos(titular: titular,dependente: dependente,),
      ),
    );
  }
}
