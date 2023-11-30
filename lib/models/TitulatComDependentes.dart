import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';

class TitularComDependentes {
  final Titular titular;
  final List<Dependente> dependentes;

  TitularComDependentes({required this.titular, required this.dependentes});
  @override
  String toString() {
    return 'Titular: $titular, Dependentes: $dependentes';
  }
}