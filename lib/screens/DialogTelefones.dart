import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogTelefone extends StatefulWidget {
  const DialogTelefone({super.key});

  @override
  State<DialogTelefone> createState() => _DialogTelefoneState();
}

class _DialogTelefoneState extends State<DialogTelefone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fale Conosco", style: TextStyle(color:Colors.blue),),
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
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(builder: (context) => Principal()),
            //       (Route<dynamic> route) => route is Principal, // mantém apenas a rota da página de serviços
            // );
            // DadosGlobais dadosGlobais = Provider.of<DadosGlobais>(context, listen: false);
            // dadosGlobais.atualizarSelectedIndex(0);

          },
        ),
      ),
         body: Container(
           width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
             color: Colors.white,
             image: DecorationImage(
               image: AssetImage('assets/img/2.png', ),
               fit: BoxFit.cover,
             ),
           ),
           child: Column(
             children: [

             ],
           ),
         ),
    );
  }
}
