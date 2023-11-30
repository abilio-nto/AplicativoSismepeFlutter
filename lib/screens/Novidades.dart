import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/ConsultasAgendadasModel.dart';
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/repositories/consultas_repository.dart';
import 'package:carteirasismepe/screens/CardConsultas.dart';
import 'package:carteirasismepe/screens/Cardnovidades.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Novidades extends StatefulWidget {
  const Novidades({super.key});




  @override
  State<Novidades> createState() => _NovidadesState();
}

class _NovidadesState extends State<Novidades> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Novidades Sismepe", style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.cyanAccent, // Cor da borda
            height: 2.0, // Espessura da borda
          ),
        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.blue),
        //   onPressed: () {
        //     Navigator.pushAndRemoveUntil(
        //       context,
        //       SlideDownRoute(page: Servicos(titular:null, dependente: null)), // Use SlideDownRoute
        //           (Route<dynamic> route) => route is Servicos, // mantém apenas a rota da página de serviços
        //     );
        //
        //     // Navigator.push(context,
        //     //     MaterialPageRoute(builder: (context) => ));
        //   },
        // ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          image: DecorationImage(
            image: AssetImage('assets/img/2.png'), // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardNovidades(),
            // Center(
            //   child: SingleChildScrollView(
            //     child: FutureBuilder<List<Consulta>?>(
            //       future:FindConsultasAgendada(id),
            //       builder: (BuildContext context,
            //           AsyncSnapshot<List<Consulta>?> snapshot) {
            //         if (snapshot.connectionState == ConnectionState.waiting) {
            //           return  Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: <Widget>[
            //               SizedBox(
            //                 height: 250,
            //               ),
            //               CircularProgressIndicator(),
            //               SizedBox(height: 20),
            //               // Adiciona um espaço entre o CircularProgressIndicator e o texto
            //               Text('Carregando...'),
            //             ],
            //           );
            //         } else if (snapshot.hasError) {
            //           return Center(child: Text('Erro: ${snapshot.error}'));
            //         } else if (snapshot.hasData) {
            //           consultas = snapshot.data! as List<Consulta>;
            //
            //           // beneficiarioAtual =CardConsulta
            //           // (beneficiarioAtual ?? beneficiario.titular) as Beneficiario?;
            //
            //           if (snapshot.data! != null) {
            //
            //             return CardConsulta(consultas: consultas);
            //           } else {
            //             return Center(child: Text('Nenhum dado disponível'));
            //           }
            //         } else {
            //           return Center(child: Text('Nenhum dado disponível'));
            //         }
            //       },
            //     ),
            //   ),
            // ),
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