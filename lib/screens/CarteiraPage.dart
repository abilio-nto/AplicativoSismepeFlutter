import 'dart:developer';
import 'dart:io';

import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/BeneficiariosList.dart';
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/models/Usuario.dart';
import 'package:carteirasismepe/repositories/beneficiario_repository.dart';
import 'package:carteirasismepe/screens/Drawer.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CarteiraPage extends StatefulWidget {
   // const CarteiraPage({super.key});

  final Titular? titular;
  final Dependente? dependente;
  const CarteiraPage({Key? key,this.titular, this.dependente}) : super(key: key);

  @override
  State<CarteiraPage> createState() => _CarteiraPageState();
}

class _CarteiraPageState extends State<CarteiraPage>
    with WidgetsBindingObserver {

  final beneficiarioRepository = BeneficiarioRepository();
  late Beneficiario beneficiario;




  @override
  void initState() {
    super.initState();

  }

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

  Widget build(BuildContext context) {
    TitularComDependentes titularComDependentes;
    Beneficiario? beneficiarioAtual ;
    Titular? titular =  widget.titular ?? Titular.defaultValues();
    Dependente? dependente =  widget.dependente ?? Dependente.defaultValues();
    beneficiarioAtual = titular.id != 0 ? titular : dependente ;


    return Scaffold(
      appBar: AppBar(
        title: Text("Carteira Digital", style: TextStyle(color: Colors.blue),),
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            color: Colors.cyanAccent, // Cor da borda
            height: 2.0, // Espessura da borda
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.clear,color: Colors.blue),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              SlideDownRoute(page: Servicos(titular:titular, dependente: dependente)), // Use SlideDownRoute
                  (Route<dynamic> route) => route is Servicos, // mantém apenas a rota da página de serviços
            );

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => ));
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white54,
          image: DecorationImage(
            image: AssetImage('assets/img/2.png'), // Substitua pelo caminho da sua imagem
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: FutureBuilder<Object?>(
              future:findTitularComDependentes(),
              builder: (BuildContext context,
                  AsyncSnapshot<Object?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(color: Colors.white),
                        SizedBox(height: 20),
                        // Adiciona um espaço entre o CircularProgressIndicator e o texto
                        Text('Carregando...', style: TextStyle(color: Colors.white),),
                      ],
                    ),);
                } else if (snapshot.hasError) {
                  return Center(child: Text('Erro: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  titularComDependentes = snapshot.data! as TitularComDependentes;
                   if(titular.id == 0 && dependente.id == 0){
                     Titular titular = titularComDependentes.titular;
                     List<Dependente> dependentes = titularComDependentes.dependentes;
                     beneficiarioAtual = titular;


                   }
                  // beneficiarioAtual =
                  // (beneficiarioAtual ?? beneficiario.titular) as Beneficiario?;

                  if (snapshot.data! != null) {

                    return Padding(
                        padding: const EdgeInsets.fromLTRB(9, 5, 9, 0),
                        child: Container(
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(9.0)),
                                        clipBehavior: Clip.hardEdge,
                                        child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            debugPrint('Card tapped.');
                                          },
                                          child: Container(

                                            width: 300,
                                            height: 80,
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    left: BorderSide(
                                                        color: Colors.blue,
                                                        width: 3
                                                    )
                                                )
                                            ),
                                            child: Stack(
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Center(
                                                        child: Text(
                                                          beneficiarioAtual!.nome,  // Imprime os atributos do dependente
                                                          style: TextStyle(fontSize: 18, color: Colors.blue),
                                                        )

                                                      ),
                                                    ),
                                                    TextButton(onPressed: () {
                                                      Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => BeneficiariosList(beneficiario: beneficiarioAtual, titularComDependentes:titularComDependentes )),
                                                    );}, child: Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.blue
                                                        ),
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Text("trocar"),
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: Card(
                                        elevation: 7,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0)),
                                        clipBehavior: Clip.hardEdge,
                                        child: InkWell(
                                          splashColor: Colors.blue.withAlpha(30),
                                          onTap: () {
                                            debugPrint('Card tapped.');
                                          },
                                          child: SizedBox(
                                            width: 300,
                                            height: 500,
                                            child: Stack(
                                              children: [
                                                Image.asset(
                                                  'assets/img/principal.png',
                                                  fit: BoxFit.fill,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                ),
                                                 Center(
                                                    child:  Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      children: [
                                                        SizedBox(
                                                          height: 45,
                                                        ),
                                                        Text("N° CARTEIRA: ${beneficiarioAtual!.matricula} " , style: TextStyle(fontSize: 28, color: Colors.white)),
                                                        SizedBox(
                                                          height: 35,
                                                        ),

                                                            Text("Nome: ${beneficiarioAtual!.nome}", style: TextStyle(fontSize: 15, color: Colors.white)),

                                                        SizedBox(
                                                          height: 50,
                                                        ),
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 120,
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text("Nascimento:", style: TextStyle(fontSize: 20, color: Colors.white)),
                                                                  Text(beneficiarioAtual!.dataNascimento, style: TextStyle(fontSize: 25, color: Colors.white)),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text("Vinculo:", style: TextStyle(fontSize: 20, color: Colors.white)),
                                                                  Text(beneficiarioAtual! is Titular ? "Titular": "Dependente", style: TextStyle(fontSize: 25, color: Colors.white)),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text("Corporação:", style: TextStyle(fontSize: 20, color: Colors.white)),
                                                                  Text('${beneficiarioAtual!.corporacao == 6  ?  "PM" : "BM"}' , style: TextStyle(fontSize: 25, color: Colors.white)),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text("Data de Inclusão:", style: TextStyle(fontSize: 20, color: Colors.white)),
                                                                  Text(beneficiarioAtual! is Titular ? titular.dataInclusao : dependente.dataConcessao, style: TextStyle(fontSize: 25, color: Colors.white)),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
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