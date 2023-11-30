import 'package:flutter/material.dart';
class DuvidasFrequentes extends StatefulWidget {
  const DuvidasFrequentes({super.key});

  @override
  State<DuvidasFrequentes> createState() => _DuvidasFrequentesState();
}

class _DuvidasFrequentesState extends State<DuvidasFrequentes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Duvidas Frequentes"),
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
