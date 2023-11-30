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
import 'package:url_launcher/url_launcher.dart';
class CardTelefoneFaleConosco extends StatefulWidget {

  const CardTelefoneFaleConosco({Key? key, this.img, this.Telefone,this.titulo}) : super(key: key);
  final  String? img;
  final  String? Telefone;
  final  String? titulo;


  @override
  State<CardTelefoneFaleConosco> createState() => _CardTelefoneFaleConoscoState();
}

class _CardTelefoneFaleConoscoState extends State<CardTelefoneFaleConosco> {

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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('${widget.titulo}'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('${widget.Telefone}'),
                                SizedBox(width: 10,),
                                ElevatedButton(
                                  child: Row(
                                    children: [
                                      Text("Ligar"),
                                      Icon(Icons.phone_rounded),
                                    ],
                                  ),
                                  onPressed: () {
                                    _makePhoneCall("tel:${widget.Telefone}");
                                  },

                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Fechar',style: (TextStyle(color: Colors.red)),),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),

                      ],
                      shape: RoundedRectangleBorder( // Define a forma do AlertDialog
                        borderRadius: BorderRadius.all(Radius.circular(6.0)), // Arredonda as bordas
                      ),
                      contentPadding: EdgeInsets.all(10.0),
                    );
                  }
              );
            },

            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 80,
              child: Stack(
                children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(width: 8),
                      Image(image: AssetImage('assets/img/${widget.img}'), fit: BoxFit.cover, ),


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

_makePhoneCall(String url) async {
  print(url);
  // const url = 'tel:+1 555 010 999';  // Substitua pelo número que você quer discar
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Não foi possivel ligar para $url';
  }
}