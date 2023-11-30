import 'package:flutter/material.dart';
class ModalLembrete extends StatefulWidget {
  const ModalLembrete({Key? key}) : super(key: key);

  @override
  _ModalLembreteState createState() => _ModalLembreteState();
}

class _ModalLembreteState extends State<ModalLembrete> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _showDialog();
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ModalLembrete'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Você tem consultas agendadas.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(); // Retorna um widget vazio
  }
}
