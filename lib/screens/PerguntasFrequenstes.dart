import 'package:flutter/material.dart';
class PerguntasFrenquentes extends StatefulWidget {
  const PerguntasFrenquentes({super.key});

  @override
  State<PerguntasFrenquentes> createState() => _PerguntasFrenquentesState();
}

class _PerguntasFrenquentesState extends State<PerguntasFrenquentes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas Frenquentes"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Em Contrução",style: TextStyle(fontSize: 50),),
          ],
        ),
      ),
    );

  }
}
