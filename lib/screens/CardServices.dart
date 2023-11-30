import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/ConsultasAgendadas.dart';
import 'package:carteirasismepe/screens/HistoricoConsultas.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardService extends StatefulWidget {
  const CardService(
      {Key? key,
      required this.icon,
      required this.desc,
      required this.pageName,
      required this.titularComDependentes,
      required this.beneficiario})
      : super(key: key);
  final String icon;
  final String desc;
  final String pageName;
  final Beneficiario? beneficiario;
  final TitularComDependentes titularComDependentes;

  @override
  State<CardService> createState() => _CardServiceState();
}

class _CardServiceState extends State<CardService> {
  @override
  Widget build(BuildContext context) {
    Titular titular = widget.titularComDependentes.titular;
    List<Dependente> dependentes = widget.titularComDependentes.dependentes;

    Widget _getPage(String pageName) {
      switch (pageName) {
        case 'CarteiraPage':
          return CarteiraPage();
        case 'HistoricoConsultas':
          return HistoricoConsultas();
        case 'ConsultasAgendadas':
          return ConsultasAgendadas();
        default:
          return Servicos(); // A página padrão se o nome da página não corresponder
      }
    }

    return Padding(
      padding: const EdgeInsets.all(.0),
      child: Column(
        children: [
          Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
              clipBehavior: Clip.hardEdge,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(
                    color: Colors.cyanAccent, // Cor da borda
                    width: 3.0, // Espessura da borda
                  ),
                )),
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      SlideUpRoute(page: _getPage(widget.pageName)),
                      // Use SlideDownRoute
                      (Route<dynamic> route) => route
                          is Servicos, // mantém apenas a rota da página de serviços
                    );
                  },
                  child: SizedBox(
                    width: 180,
                    height: 110,
                    child: Stack(
                      children: [

                            Row(
                              children: [

                                      // SizedBox(width: 8),
                                      Image(image: AssetImage('assets/img/${widget.icon}'), fit: BoxFit.cover, ),
                                      // SvgPicture.asset(
                                      //   'assets/svg/${widget.icon}',
                                      //   color: Colors.blue,
                                      //   width: 30,
                                      // ),
                                      // SizedBox(width: 10),
                                      // Flexible(
                                      //   child: Text(
                                      //     "${widget.desc}",
                                      //     style: TextStyle(
                                      //         fontSize: 23, color: Colors.grey),
                                      //     textAlign: TextAlign.center,
                                      //   ),
                                      // ),

                              ],
                            ),
                          ],

                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}

class SlideUpRoute extends PageRouteBuilder {
  final Widget page;

  SlideUpRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
