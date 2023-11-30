import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CardService extends StatefulWidget {

  const CardService({Key? key,required this.icon, required this.desc, required this.pageName}) : super(key: key);
  final  String icon;
  final String desc;
  final String pageName;

  @override
  State<CardService> createState() => _CardServiceState();
}

class _CardServiceState extends State<CardService> {

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


    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {

          Navigator.pushAndRemoveUntil(
            context,
            SlideUpRoute(page: _getPage(widget.pageName)), // Use SlideDownRoute
                (Route<dynamic> route) => route is Servicos, // mantém apenas a rota da página de serviços
          );
          // Navigator.of(context).push(SlideUpRoute(page: _getPage(widget.pageName)));
        },
        child: SizedBox(
          width: 200,
          height: 80,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/svg/${widget.icon}',),
                          SizedBox(width: 10),
                          Text("${widget.desc}", style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
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