import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:flutter/material.dart';

class DadosGlobais extends ChangeNotifier {
  TitularComDependentes? titularComDependentes;
  ValueNotifier<int> selectedIndex = ValueNotifier<int>(0); // Este é o seu ValueNotifier
  ValueNotifier<bool> userLogado = ValueNotifier<bool>(false); //

  void atualizarTitularComDependentes(TitularComDependentes novoTitularComDependentes) {
    titularComDependentes = novoTitularComDependentes;
    notifyListeners();
  }

  void atualizarSelectedIndex(int index) {
    selectedIndex.value = index; // Atualize o valor aqui
    notifyListeners();
  }

  void usuarioLogado(bool isLogger){
    userLogado.value = isLogger;
    notifyListeners();
  }

  @override
  String toString() {
    return 'DadosGlobais: { titularComDependentes: $titularComDependentes }';
  }
}