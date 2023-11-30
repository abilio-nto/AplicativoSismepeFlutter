import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/ConsultasAgendadasModel.dart';
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/repositories/consultas_repository.dart';
import 'package:carteirasismepe/screens/CardConsultas.dart';
import 'package:carteirasismepe/screens/CardHistoricoDeConsultas.dart';
import 'package:carteirasismepe/screens/Servicos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class HistoricoConsultas extends StatefulWidget {
  const HistoricoConsultas({super.key});




  @override
  State<HistoricoConsultas> createState() => _HistoricoConsultasState();
}

class _HistoricoConsultasState extends State<HistoricoConsultas> {
  final consultasRepository = ConsultasRepository();
  // static const List<String> list = <String>['Agendado', 'Cancelado', 'Bloqueado', 'Realizado','Transferido','Para ser tranferido','Falta do Prestador'];
  String dropdownValue = "";
  Future<List<Consulta>?> FindConsultasHistorico(id) async {
    final resp = await consultasRepository.FindConsultasHistorico(id);

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
    const List<String> list = <String>[ 'Cancelado', 'Bloqueado', 'Realizado','Transferido','Para ser tranferido','Falta do Prestador'];

    // Agora você pode acessar titularComDependentes
    final titularComDependentes = dadosGlobais.titularComDependentes;
    int id = titularComDependentes!.titular.id;

    // Titular? titular =  widget.titular ?? Titular.defaultValues();
    // Dependente? dependente =  widget.dependente ?? Dependente.defaultValues();
    // beneficiarioAtual = titular.id != 0 ? titular : dependente ;
    List<Consulta> consultas;
    print(dropdownValue);
    return Scaffold(
      appBar: AppBar(
        title: Text("Historico de Consultas", style: TextStyle(color: Colors.blue),),
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
                  future:FindConsultasHistorico(id),
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
                          CircularProgressIndicator(color: Colors.white,),
                          SizedBox(height: 20),
                          // Adiciona um espaço entre o CircularProgressIndicator e o texto
                          Text('Carregando...', style: TextStyle(color: Colors.white),),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Erro: ${snapshot.error}'));
                    } else if (snapshot.hasData) {
                      consultas = snapshot.data! as List<Consulta>;

                      // beneficiarioAtual =CardConsulta
                      // (beneficiarioAtual ?? beneficiario.titular) as Beneficiario?;

                      if (snapshot.data! != null) {

                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
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
                                                color: Colors.blue,
                                                width: 5))),
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Row(
                                              children: [
                                                Expanded(

                                                  child:DropdownMenu<String>(
                                                    width: MediaQuery.of(context).size.width-70,
                                                    label: Text("Filtro"),
                                                    initialSelection: dropdownValue,
                                                    onSelected: (String? value) {
                                                      // This is called when the user selects an item.
                                                      setState(() {
                                                        print(value);
                                                        dropdownValue = value!;
                                                      });
                                                    },

                                                    dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
                                                      return DropdownMenuEntry<String>(value: value, label: value);
                                                    }).toList(),
                                                  )
                                                ),


                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),

                            CardHistoricoDeConsulta(consultas: consultas, situacao:dropdownValue),
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