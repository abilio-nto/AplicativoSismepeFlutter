import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/ConsultasAgendadasModel.dart';
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/repositories/consultas_repository.dart';
import 'package:carteirasismepe/screens/CardConsultas.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ConsultasAgendadas extends StatefulWidget {
  const ConsultasAgendadas({super.key});




  @override
  State<ConsultasAgendadas> createState() => _ConsultasAgendadasState();
}

class _ConsultasAgendadasState extends State<ConsultasAgendadas> {
  final consultasRepository = ConsultasRepository();

  Future<List<Consulta>?> FindConsultasAgendada(id) async {
    final resp = await consultasRepository.FindConsultasAgendada(id);

    if (resp != null && resp.isNotEmpty) {
      print(resp);
      return resp;
    } else {
      print('Beneficiario é null');
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
// Obtenha os dados globais do Provider
    final dadosGlobais = Provider.of<DadosGlobais>(context);

    // Agora você pode acessar titularComDependentes
    final titularComDependentes = dadosGlobais.titularComDependentes;
     int id = titularComDependentes!.titular.id;

    // Titular? titular =  widget.titular ?? Titular.defaultValues();
    // Dependente? dependente =  widget.dependente ?? Dependente.defaultValues();
    // beneficiarioAtual = titular.id != 0 ? titular : dependente ;
      List<Consulta> consultas;

    return Scaffold(
      appBar: AppBar(
        title: Text("Consultas Agendadas", style: TextStyle(color: Colors.blue),),
        backgroundColor: Colors.white,
        toolbarHeight: 60,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.cyanAccent, // Cor da borda
            height: 2.0, // Espessura da borda
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.blue),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              SlideDownRoute(page: Servicos(titular:null, dependente: null)), // Use SlideDownRoute
                  (Route<dynamic> route) => route is Servicos, // mantém apenas a rota da página de serviços
            );

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => ));
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
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SingleChildScrollView(
                child: FutureBuilder<List<Consulta>?>(
                  future:FindConsultasAgendada(id),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Consulta>?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 250,
                          ),
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          // Adiciona um espaço entre o CircularProgressIndicator e o texto
                          Text('Carregando...'),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      consultas = snapshot.data! as List<Consulta>;

                      // beneficiarioAtual =CardConsulta
                      // (beneficiarioAtual ?? beneficiario.titular) as Beneficiario?;

                      if (snapshot.data! != null) {

                        return CardConsulta(consultas: consultas);
                      } else {
                        return Center(child: Text('Nenhum dado disponível'));
                      }
                    } else {
                      return Center(child: Text('Nenhum dado disponível'));
                    }
                  },
                ),
              ),
            ),
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