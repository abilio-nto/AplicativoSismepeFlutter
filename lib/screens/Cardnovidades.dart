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
class CardNovidades extends StatefulWidget {

  const CardNovidades({Key? key}) : super(key: key);



  @override
  State<CardNovidades> createState() => _CardNovidadesState();
}

class _CardNovidadesState extends State<CardNovidades> {

  @override
  Widget build(BuildContext context) {


    return Container(

      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(

          children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {


                    },
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width, // largura da tela
                        height: 145,
                        child: Stack(
                          children: [
                              Row(children: [
                                Container(
                                   width: 130,
                                  height:MediaQuery.of(context).size.height,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/img/logo_sismepe.png'),
                                      fit: BoxFit.cover
                                    )
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                       Text("Chegou o Aplicativo Sismepe", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 17),),
                                       Text("Estamos muito animados em anunciar o lançamento do nosso novo aplicativo móvel, SISMEPE! Como o plano de saúde confiável da Polícia Militar de Pernambuco,...", style: TextStyle(fontWeight:FontWeight.bold, fontSize: 12))
                                  ],),
                                )
                              ],
                              )
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
