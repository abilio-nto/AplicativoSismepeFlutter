import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/BeneficiariosList.dart';
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/models/Usuario.dart';
import 'package:carteirasismepe/repositories/beneficiario_repository.dart';
import 'package:carteirasismepe/screens/CardServices.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:carteirasismepe/screens/Drawer.dart';
import 'package:carteirasismepe/screens/HomeScreen.dart';
import 'package:carteirasismepe/screens/Principal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Servicos extends StatefulWidget {
  final Titular? titular;
  final Dependente? dependente;

  const Servicos({Key? key, this.titular, this.dependente}) : super(key: key);

  @override
  State<Servicos> createState() => _ServicosState();
}

final beneficiarioRepository = BeneficiarioRepository();
late Beneficiario beneficiario;

// @override
// void initState() {
//   super.initState();
//
// }

Future<Object?> Titularfind() async {
  final resp = await beneficiarioRepository.FindTitular();
  if (resp != null) {
    if (resp is Beneficiario) {
      beneficiario = resp;
    } else {
      // Trate o caso em que resp não é um Beneficiario
    }
  } else {
    print('Beneficiario é null');
  }
}

Future<TitularComDependentes?> findTitularComDependentes() async {
  final resp = await beneficiarioRepository.FindTitular();

  if (resp != null && resp is TitularComDependentes) {
    return resp;
  } else {
    print('Beneficiario é null');
    return null;
  }
}

class _ServicosState extends State<Servicos> {
  @override
  Widget build(BuildContext context) {
    TitularComDependentes titularComDependentes;
    Beneficiario? beneficiarioAtual;
    Titular? titular = widget.titular ?? Titular.defaultValues();
    Dependente? dependente = widget.dependente ?? Dependente.defaultValues();
    beneficiarioAtual = titular.id != 0 ? titular : dependente;
    return Scaffold(
      appBar: AppBar(
        title: Text("Serviços", style: TextStyle(color:Colors.blue),),
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
          icon: Icon(Icons.arrow_back, color: Colors.blue,),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Principal()),
                  (Route<dynamic> route) => route is Principal, // mantém apenas a rota da página de serviços
            );
            DadosGlobais dadosGlobais = Provider.of<DadosGlobais>(context, listen: false);
            dadosGlobais.atualizarSelectedIndex(0);

          },
        ),
      ),
      body: Container(

        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/img/2.png', ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SingleChildScrollView(
                child: FutureBuilder<Object?>(
                  future: findTitularComDependentes(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Object?> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 250,
                          ),
                          CircularProgressIndicator(color: Colors.white),
                          SizedBox(height: 20),
                          // Adiciona um espaço entre o CircularProgressIndicator e o texto
                          Text('Carregando...', style: TextStyle(color: Colors.white),),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      titularComDependentes =
                          snapshot.data! as TitularComDependentes;
                      if (titular.id == 0 && dependente.id == 0) {
                        Titular titular = titularComDependentes.titular;
                        List<Dependente> dependentes =
                            titularComDependentes.dependentes;
                        beneficiarioAtual = titular;
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Provider.of<DadosGlobais>(context, listen: false)
                              .atualizarTitularComDependentes(
                                  titularComDependentes);
                        });
                      }
                      // beneficiarioAtual =
                      // (beneficiarioAtual ?? beneficiario.titular) as Beneficiario?;

                      if (snapshot.data! != null) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(9, 5, 9, 0),
                              child: Container(

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Card(
                                            elevation: 5,
                                            clipBehavior: Clip.hardEdge,
                                            child: InkWell(
                                              splashColor:
                                                  Colors.blue.withAlpha(30),
                                              onTap: () {
                                                debugPrint('Card tapped.');
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 85,
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        left: BorderSide(
                                                            color: Colors.cyanAccent,
                                                            width: 8))),
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Center(
                                                              child: Text(
                                                            beneficiarioAtual!
                                                                .nome,
                                                            // Imprime os atributos do dependente
                                                            style: TextStyle(
                                                                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
                                                          )),
                                                        ),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder: (context) => BeneficiariosList(
                                                                        beneficiario:
                                                                            beneficiarioAtual,
                                                                        titularComDependentes:
                                                                            titularComDependentes)),
                                                              );
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                    color: Colors.blue,
                                                                  ),
                                                                  borderRadius: BorderRadius.circular(12),
                                                                ),
                                                                child: Padding(
                                                                  padding: const EdgeInsets.all(6.0),
                                                                  child: Text("trocar", style: TextStyle(fontSize: 16),),
                                                                )))
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Wrap(
                                            children: [
                                              CardService(
                                                icon: "carteiraMenuImg.png",
                                                desc: "Carteira Digital",
                                                pageName: "CarteiraPage",
                                                beneficiario: beneficiarioAtual,
                                                titularComDependentes: titularComDependentes,
                                              ),
                                              CardService(
                                                icon: "ConsultasAgendadasMenuImg.png",
                                                desc: "Consultas Agendadas",
                                                pageName: "ConsultasAgendadas",
                                                beneficiario: beneficiarioAtual,
                                                titularComDependentes: titularComDependentes,
                                              ),
                                              CardService(
                                                icon: "historicodeConsultasMenuImg.png",
                                                desc: "Historico de Consultas",
                                                pageName: "HistoricoConsultas",
                                                beneficiario: beneficiarioAtual,
                                                titularComDependentes: titularComDependentes,
                                              ),
                                              // Adicione mais CardServices aqui...
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
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
class SlideUpRoute extends PageRouteBuilder {
  final Widget page;
  SlideUpRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(-1.0, 0.0);
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