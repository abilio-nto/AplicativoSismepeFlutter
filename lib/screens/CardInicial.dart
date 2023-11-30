import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/ConsultasAgendadas.dart';
import 'package:carteirasismepe/screens/DialogTelefones.dart';
import 'package:carteirasismepe/screens/DuvidasFrequentes.dart';
import 'package:carteirasismepe/screens/FaleConosco.dart';
import 'package:carteirasismepe/screens/HistoricoConsultas.dart';
import 'package:carteirasismepe/screens/Principal.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CardInicial extends StatefulWidget {

  const CardInicial({Key? key,required this.pageName,this.icon, this.desc}) : super(key: key);
  final  String? desc;
  final  String? icon;
  final String pageName;

  @override
  State<CardInicial> createState() => _CardInicialState();
}

class _CardInicialState extends State<CardInicial> {

  @override
  Widget build(BuildContext context) {



    Widget _getPage(String pageName) {
      switch (pageName) {
        case 'FaleConosco':
          return FaleConosco();
        case 'DuvidasFrequentes':
          return DuvidasFrequentes();
        default:
          return Principal(); // A página padrão se o nome da página não corresponder
      }
    }


    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
        clipBehavior: Clip.hardEdge,
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xFF42A2E8),
              border: Border(
                bottom: BorderSide(
                  color: Colors.cyanAccent, // Cor da borda
                  width: 3.0, // Espessura da borda
                ),
              )),
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FaleConosco()));

                },

            child: SizedBox(
              width: 200,
              height: 70,
              child: Stack(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: 8),
                      Image(image: AssetImage('assets/img/falerConosco.png'), fit: BoxFit.cover, ),


                    ],
                  ),
                ],

              ),
            ),
          ),
        )
    );

  }
}
