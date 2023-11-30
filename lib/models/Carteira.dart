// import 'dart:io';
//
// import 'package:carteirasismepe/models/Beneficiario.dart';
// import 'package:carteirasismepe/models/BeneficiariosList.dart';
// import 'package:carteirasismepe/models/Dependente.dart';
// import 'package:carteirasismepe/models/Titular.dart';
// import 'package:carteirasismepe/repositories/beneficiario_repository.dart';
// import 'package:dio/adapter.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:image_card/image_card.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CarteiraPage extends StatefulWidget {
//   // const CarteiraPage({super.key});
//   const CarteiraPage({Key? key, required this.beneficiarioSelecionado})
//       :super(key: key);
//   final Beneficiario beneficiarioSelecionado;
//
//   @override
//   State<CarteiraPage> createState() => _CarteiraPageState();
// }
//
// class _CarteiraPageState extends State<CarteiraPage>
//     with WidgetsBindingObserver {
//
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//
//   Widget build(BuildContext context) {
//     Beneficiario beneficiarioAtual;
//     Titular? titular;
//     Dependente? dependente;
//
//     if (widget.beneficiarioSelecionado is Titular) {
//       titular = widget.beneficiarioSelecionado.titular;
//       beneficiarioAtual = titular as Beneficiario;
//     } else if (widget.beneficiarioSelecionado is Dependente) {
//       dependente = widget.beneficiarioSelecionado as Dependente;
//       beneficiarioAtual = dependente;
//     }
//     return Padding(
//         padding: const EdgeInsets.fromLTRB(9, 5, 9, 0),
//         child: Container(
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Card(
//                         clipBehavior: Clip.hardEdge,
//                         child: InkWell(
//                           splashColor: Colors.blue.withAlpha(30),
//                           onTap: () {
//                             debugPrint('Card tapped.');
//                           },
//                           child: Container(
//
//                             width: 300,
//                             height: 80,
//                             decoration: BoxDecoration(
//                                 border: Border(
//                                     left: BorderSide(
//                                         color: Colors.blue,
//                                         width: 3
//                                     )
//                                 )
//                             ),
//                             child: Stack(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                       child: Center(
//                                           child: Text(
//                                             widget.beneficiarioSelecionado is Titular
//                                                 ? 'Titular: ${titular?.nome}' // Imprime os atributos do titular
//                                                 :  dependente != null ? 'Dependente: ${dependente.nome}' : 'Dependente: desconhecido',
//                                             // Imprime os atributos do dependente
//                                             style: TextStyle(fontSize: 15),
//                                           )
//
//                                       ),
//                                     ),
//                                     TextButton(onPressed: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(builder: (context) =>
//                                             BeneficiariosList(
//                                               Beneficiario: beneficiario,)),
//                                       );
//                                     }, child: Text("trocar"))
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0)),
//                         clipBehavior: Clip.hardEdge,
//                         child: InkWell(
//                           splashColor: Colors.blue.withAlpha(30),
//                           onTap: () {
//                             debugPrint('Card tapped.');
//                           },
//                           child: SizedBox(
//                             width: 300,
//                             height: 500,
//                             child: Stack(
//                               children: [
//                                 Image.asset(
//                                   'assets/img/principal.png',
//                                   fit: BoxFit.fill,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                                 Center(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment
//                                           .center,
//                                       mainAxisAlignment: MainAxisAlignment
//                                           .start,
//                                       children: [
//                                         SizedBox(
//                                           height: 45,
//                                         ),
//                                         Text("N° CARTEIRA: ${beneficiario
//                                             .matricula}", style: TextStyle(
//                                             fontSize: 28, color: Colors.white)),
//                                         SizedBox(
//                                           height: 35,
//                                         ),
//
//                                         Text("Nome: ${beneficiario.nome}",
//                                             style: TextStyle(fontSize: 15,
//                                                 color: Colors.white)),
//
//                                         SizedBox(
//                                           height: 50,
//                                         ),
//                                         Row(
//                                           children: [
//                                             SizedBox(
//                                               height: 120,
//                                             ),
//                                             Expanded(
//                                               child: Column(
//                                                 children: [
//                                                   Text("Nascimento:",
//                                                       style: TextStyle(
//                                                           fontSize: 20,
//                                                           color: Colors.white)),
//                                                   Text(beneficiario
//                                                       .dataNascimento,
//                                                       style: TextStyle(
//                                                           fontSize: 25,
//                                                           color: Colors.white)),
//                                                 ],
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Column(
//                                                 children: [
//                                                   Text("Vinculo:",
//                                                       style: TextStyle(
//                                                           fontSize: 20,
//                                                           color: Colors.white)),
//                                                   Text("Titular",
//                                                       style: TextStyle(
//                                                           fontSize: 25,
//                                                           color: Colors.white)),
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                         Row(
//                                           children: [
//                                             Expanded(
//                                               child: Column(
//                                                 children: [
//                                                   Text("Corporação:",
//                                                       style: TextStyle(
//                                                           fontSize: 20,
//                                                           color: Colors.white)),
//                                                   Text("PM", style: TextStyle(
//                                                       fontSize: 25,
//                                                       color: Colors.white)),
//                                                 ],
//                                               ),
//                                             ),
//                                             Expanded(
//                                               child: Column(
//                                                 children: [
//                                                   Text("Data de Inclusão:",
//                                                       style: TextStyle(
//                                                           fontSize: 20,
//                                                           color: Colors.white)),
//                                                   Text(
//                                                       beneficiario.dataInclusao,
//                                                       style: TextStyle(
//                                                           fontSize: 25,
//                                                           color: Colors.white)),
//                                                 ],
//                                               ),
//                                             )
//                                           ],
//                                         ),
//                                       ],
//                                     )),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//
//     );
//   }
//
// }
