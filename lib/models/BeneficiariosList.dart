// import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/models/cardDependente.dart';
import 'package:carteirasismepe/models/cardTitular.dart';
import 'package:flutter/material.dart';



class BeneficiariosList extends StatefulWidget {
  const BeneficiariosList({Key? key,required this.titularComDependentes, required this.beneficiario}) :super(key:key);
  final Beneficiario? beneficiario;
  final TitularComDependentes titularComDependentes;

//
//   BeneficiariosList({required this.Beneficiario});
  @override
  State<BeneficiariosList> createState() => _BeneficiariosListState();
}

class _BeneficiariosListState extends State<BeneficiariosList> {
  @override
  Widget build(BuildContext context) {
    Titular titular = widget.titularComDependentes.titular;
    List<Dependente> dependentes = widget.titularComDependentes.dependentes;
    return Scaffold(
      appBar: AppBar(title: Text("Escolha o Beneficiário", style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.cyanAccent, // Cor da borda
            height: 2.0,
            // Espessura da borda
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close,color: Colors.blue),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          image: DecorationImage(
            image: AssetImage('assets/img/2.png'), // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [

            if (widget.beneficiario is Titular && widget.beneficiario!.id == titular.id)
              cardTitular(titular: titular, flash: true)
            else
               cardTitular(titular: titular, flash: false),
            for (var dependente in dependentes)
            if (widget.beneficiario is Dependente && widget.beneficiario!.id == dependente.id)
            cardDependente(dependente: dependente, flash: true)
            else
            cardDependente(dependente: dependente, flash: false),
          ],
        ),
      ),
    );
  }
}
class SlideDownRoute extends PageRouteBuilder {
  final Widget page;
  SlideDownRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, -1.0);
      var end = Offset.zero;
      var curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}