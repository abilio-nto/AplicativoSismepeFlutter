import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/ConsultasAgendadasModel.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:carteirasismepe/screens/TelaDeLembrete.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CardHistoricoDeConsulta extends StatefulWidget {

  const CardHistoricoDeConsulta({Key? key,required this.consultas, this.situacao}) : super(key: key);
  final  List<Consulta> consultas;
  final  String? situacao;


  @override
  State<CardHistoricoDeConsulta> createState() => _CardHistoricoDeConsultaState();
}

class _CardHistoricoDeConsultaState extends State<CardHistoricoDeConsulta> {




  @override
  Widget build(BuildContext context) {



      return SingleChildScrollView(
            child: Column(
              children: widget.consultas.where((Consulta item) => item.situacaoAgendamento == widget.situacao).map((item){

                late Color backgroundColor;

                switch (item.situacaoAgendamento) {
                  case 'Agendado':
                    backgroundColor = Colors.lightBlueAccent;
                    break;
                  case 'Cancelado':
                    backgroundColor = Colors.red[200]!; // vermelho claro
                    break;
                  case 'Bloqueado':
                    backgroundColor = Colors.orange[200]!; // laranja claro
                    break;
                  case 'Realizado':
                    backgroundColor = Colors.green;
                    break;
                  case 'Transferido':
                  case 'Para ser tranferido':
                  case 'Falta do Prestador':
                    backgroundColor = Colors.purple; // cor automática
                    break;
                  default:
                    backgroundColor = Colors.grey; // cor padrão
                    break;
                }


                Widget _getPage(String pageName) {
                  switch (pageName) {
                    case 'CarteiraPage':
                      return CarteiraPage();
                  // case 'Page2':
                  //   return Page2();
                  // case 'Page3':
                  //   return Page3();
                    default:
                      return Servicos(); // A página padrão se o nome da página não corresponder
                  }
                }


                return Container(
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   // image: DecorationImage(
                    //   //   image: AssetImage('assets/img/fundo.png'), // Substitua pelo caminho da sua imagem
                    //   //   fit: BoxFit.cover,
                    //   // ),
                    // ),
                    height: 170,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            clipBehavior: Clip.hardEdge,
                            child: InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              onTap: () {
                              },
                              child: SizedBox(
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width, // largura da tela
                                  height: 145,
                                  child: Stack(
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(child:
                                              Container(

                                                  decoration: BoxDecoration(
                                                    color: backgroundColor,
                                                    // Define a cor de fundo
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: backgroundColor,
                                                        // Define a cor da borda inferior
                                                        width: 3.0, // Define a largura da borda inferior
                                                      ),
                                                    ),
                                                  ),
                                                  child:
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: LayoutBuilder(
                                                              builder: (
                                                                  BuildContext context,
                                                                  BoxConstraints constraints) {
                                                                return Text(
                                                                    "Especialidade: ${item
                                                                        .especialidade}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: constraints
                                                                            .maxWidth /
                                                                            20,
                                                                        fontWeight: FontWeight
                                                                            .bold));
                                                              }
                                                          ),
                                                        ),


                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        // Icon(
                                                        //   Icons.add_alarm_sharp,
                                                        //   size: 30,
                                                        //   color: Colors.white,
                                                        // ),
                                                      ],
                                                    ),

                                                  )
                                              )
                                              ),

                                            ],
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 3, 8, 3),
                                            child: Row(
                                              children: [
                                                Expanded(child: Text(
                                                    "Médico: ${item.nomePrestador}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold))),
                                                // Text("Matricula: ${item.matriculaPaciente}", style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold))
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 3, 8, 3),
                                            child: Row(
                                              children: [
                                                Text("Data: ${item.dataAgendamento}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold)),
                                                SizedBox(
                                                  width: 35,
                                                ),
                                                Text("Hora : ${item.horaInicial}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold)),

                                                // Text("Situação: ${item.situacaoAgendamento}", style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 3, 8, 3),
                                            child: Row(
                                              children: [
                                                Expanded(child: Text(
                                                    "Situação: ${item
                                                        .situacaoAgendamento}",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold))),
                                                // Text("Hora : ${item.horaInicial}", style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold)),
                                                // SizedBox(
                                                //   width: 25,
                                                // ),
                                                // Text("Situação: ${item.situacaoAgendamento}", style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                );
              }).toList(),
            ),
          );

  }
}
