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
class CardConsulta extends StatefulWidget {

  const CardConsulta({Key? key,required this.consultas}) : super(key: key);
  final  List<Consulta> consultas;


  @override
  State<CardConsulta> createState() => _CardConsultaState();
}

class _CardConsultaState extends State<CardConsulta> {

  @override
  Widget build(BuildContext context) {



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

      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Row(

                children: [

                 Expanded(
                     child:
                     Center(child: Text("Você tem ${widget.consultas.length} consultas agendadas", style: TextStyle(fontSize: 15, color: Colors.white),))
                 )
              ],),
            ),
            for(Consulta item in widget.consultas)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Adicionar Lembrete'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: <Widget>[
                                  Text('Defina a data e a hora que deseja ser lembrado'),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Data',
                                    ),
                                    onTap: () async {
                                      FocusScope.of(context).requestFocus(new FocusNode()); // to prevent opening default keyboard
                                      DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );
                                      if (pickedDate != null) {
                                        // format and set pickedDate to the input field
                                      }
                                    },
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Hora',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white30),
                                        borderRadius: BorderRadius.all(Radius.circular(18)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(18)),
                                      ),
                                    ),
                                    onTap: () async {
                                      FocusScope.of(context).requestFocus(new FocusNode()); // to prevent opening default keyboard
                                      TimeOfDay? pickedTime = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      if (pickedTime != null) {
                                        // format and set pickedTime to the input field
                                      }
                                    },
                                  )
                                ],
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Fechar'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ElevatedButton(
                                child: Text('Adicionar'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.green,
                                ),
                              ),
                            ],
                            shape: RoundedRectangleBorder( // Define a forma do AlertDialog
                              borderRadius: BorderRadius.all(Radius.circular(6.0)), // Arredonda as bordas
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                          );

                        },
                      );

                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width, // largura da tela
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
                                            color: Colors.green, // Define a cor de fundo
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey, // Define a cor da borda inferior
                                                width: 3.0, // Define a largura da borda inferior
                                              ),
                                            ),
                                          ),
                                          child:
                                          Padding(
                                            padding: const EdgeInsets.all(10),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: LayoutBuilder(
                                                    builder: (BuildContext context, BoxConstraints constraints) {
                                                      return Text("Especialidade: ${item.especialidade}", style: TextStyle(color: Colors.white, fontSize: constraints.maxWidth / 20, fontWeight: FontWeight.bold));

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
                                // Padding(
                                //   padding: const EdgeInsets.all(8.0),
                                //   child: Row(
                                //     children: [
                                //       Expanded(
                                //         child: LayoutBuilder(
                                //             builder: (BuildContext context, BoxConstraints constraints) {
                                //               return Text("Paciente: ${item.nomePaciente}", style: TextStyle(color: Colors.white, fontSize: constraints.maxWidth / 25, fontWeight: FontWeight.bold));
                                //
                                //             }
                                //         ),
                                //       ),
                                //       Expanded(
                                //         child: LayoutBuilder(
                                //             builder: (BuildContext context, BoxConstraints constraints) {
                                //               return Text("Matricula: ${item.matriculaPaciente}", style: TextStyle(color: Colors.white, fontSize: constraints.maxWidth / 25, fontWeight: FontWeight.bold));
                                //
                                //             }
                                //         ),
                                //       ),
                                //       // Expanded(child: Text("Paciente: ${item.nomePaciente}", style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold))),
                                //       // Text("Matricula: ${item.matriculaPaciente}", style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold))
                                //     ],
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: LayoutBuilder(
                                            builder: (BuildContext context, BoxConstraints constraints) {
                                              return Text("Médico: ${item.nomePrestador}", style: TextStyle(color: Colors.black, fontSize: constraints.maxWidth / 21, fontWeight: FontWeight.bold));

                                            }
                                        ),
                                      ),
                                      // Text("Matricula: ${item.matriculaPaciente}", style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                  child: Row(
                                    children: [
                                      Text("Data: ${item.dataAgendamento}", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        width: 35,
                                      ),
                                       Text("Hora : ${item.horaInicial}", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold)),

                                       // Text("Situação: ${item.situacaoAgendamento}", style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
                                  child: Row(
                                    children: [
                                      Expanded(child: Text("Situação: ${item.situacaoAgendamento}", style: TextStyle(color: Colors.black, fontSize: 15,fontWeight: FontWeight.bold))),
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
              ),

          ],
        ),
      ),
    );
  }
}
