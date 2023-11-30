// import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/screens/CarteiraPage.dart';
import 'package:flutter/material.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

//
// class BeneficiariosList extends StatelessWidget {
//   final Titular Beneficiario;
//
//   BeneficiariosList({required this.Beneficiario});
//
// // Resto do seu código aqui

class cardTitular extends StatefulWidget {
  const cardTitular({Key? key, required this.titular, required this.flash}) : super(key: key);
  final Titular titular;
  final bool flash;

//
//   BeneficiariosList({required this.Beneficiario});
  @override
  State<cardTitular> createState() => _cardTitularState();
}

class _cardTitularState extends State<cardTitular> {
  @override
  Widget build(BuildContext context) {
    var beneficiario = widget.titular;
    print(widget.flash);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0)),
               elevation: 7,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: widget.flash ?  Colors.blue :  Colors.blueGrey, width: 3))),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Titular",
                                          style: TextStyle(
                                              fontSize: 17, color: Colors.grey),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          beneficiario.nome,
                                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.blue),
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'N° Cartão:',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                  '${beneficiario.matricula}',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              //// Isso adiciona um padding de 8.0 em todas as direções
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.blue),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10) // Isso adiciona uma borda azul
                                                  ),
                                              child: Text(
                                                ' ${beneficiario.ativo == 'S' ? 'ATIVO' : beneficiario.ativo == 'C' ? 'CANCELADO' : 'BLOQUEADO'}',
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: RoundCheckBox(
                                    onTap: (selected) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CarteiraPage(
                                              titular: widget.titular),
                                        ),
                                      );
                                    },

                                    isChecked: widget.flash,
                                    size: 25,
                                    animationDuration: Duration(
                                      milliseconds: 50,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
