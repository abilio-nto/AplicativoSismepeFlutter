import 'package:carteirasismepe/models/Usuario.dart';
import 'package:carteirasismepe/models/login_state.dart';
import 'package:carteirasismepe/repositories/beneficiario_repository.dart';
import 'package:carteirasismepe/screens/Drawer.dart';
import 'package:carteirasismepe/screens/FaleConosco.dart';
import 'package:carteirasismepe/screens/PerguntasFrequenstes.dart';
import 'package:carteirasismepe/screens/carouselPage.dart';
import 'package:carteirasismepe/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  late Usuario? user;

  String usuarioNome = "";
  final beneficiarioRepository = BeneficiarioRepository();
  ValueNotifier<bool> _isLoggedIn = ValueNotifier<bool>(false);
  Future<Usuario?> findUser() async {
    final response = await beneficiarioRepository.FindUserLogado();
    if (response != null) {
      user = response;
      List<String> nome = response.nome.split(' ');
      usuarioNome = nome[0];
      print(usuarioNome);
    } else {
      user = Usuario.defaultValue();
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(user!.foto);
    return FutureBuilder<Object?>(
      future: findUser(),
      builder: (BuildContext context, AsyncSnapshot<Object?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
              home: Scaffold(body: Center(child: CircularProgressIndicator())));
        } else if (snapshot.hasError) {
          return MaterialApp(
              home: Scaffold(
                  body: Center(child: Text('Erro: ${snapshot.error}'))));
        } else {
          // O Future foi concluído com sucesso, retorne o widget que você deseja exibir
          return  CustomDrawer(userName:usuarioNome, user: user ?? Usuario.defaultValue());
            // MaterialApp(
            // home: Scaffold(
              // appBar: AppBar(
              //   title: Text("Olá, ${usuarioNome}"),
              // ),
              // drawer: CustomDrawer(),
              //drawer: Drawer(
              //               //   child: Column(
              //               //     children: <Widget>[
              //               //       Expanded(
              //               //         child: ListView(
              //               //           padding: EdgeInsets.zero,
              //               //           children: <Widget>[
              //               //             DrawerHeader(
              //               //               child: Column(
              //               //                 children: [
              //               //                   Stack(
              //               //                     alignment: Alignment.center,
              //               //                     children: <Widget>[
              //               //                       Container(
              //               //                         width: 65,
              //               //                         height: 65,
              //               //                         decoration: BoxDecoration(
              //               //                           color: Colors.black26,
              //               //                           borderRadius: BorderRadius.circular(50),
              //               //                         ),
              //               //                       ),
              //               //                       Image.network(
              //               //                         user!.foto,
              //               //                         width: 40,
              //               //                         height: 40,
              //               //                         errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              //               //                           return Icon(
              //               //                             Icons.person,
              //               //                             size: 40,
              //               //                             color: Colors.white,
              //               //                           );
              //               //                         },
              //               //                       ),
              //               //                     ],
              //               //                   ),
              //               //                   SizedBox(
              //               //                     height: 10,
              //               //                   ),
              //               //                   Text(
              //               //                     user!.nome,
              //               //                     style: TextStyle(
              //               //                         fontSize: 13,
              //               //                         color: Colors.black26,
              //               //                         fontWeight: FontWeight.bold),
              //               //                   ),
              //               //                   Text(
              //               //                     "CPF: ${user!.cpf}",
              //               //                     style: TextStyle(
              //               //                         fontSize: 13, color: Colors.black26),
              //               //                   ),
              //               //                   Text(
              //               //                     "Matricula: ${user!.matricula}",
              //               //                     style: TextStyle(
              //               //                         fontSize: 13, color: Colors.black26),
              //               //                   ),
              //               //                 ],
              //               //               ),
              //               //               decoration: BoxDecoration(
              //               //                 color: Colors.blue[50],
              //               //               ),
              //               //             ),
              //               //             ListTile(
              //               //               title: Text('Fale Conosco'),
              //               //               onTap: () {
              //               //                 Navigator.push(
              //               //                     context,
              //               //                     MaterialPageRoute(builder: (context) => FaleConosco())
              //               //                 );
              //               //               },
              //               //             ),
              //               //             ListTile(
              //               //               title: Text("Perguntas Frequentes"),
              //               //               onTap: () {
              //               //                 Navigator.push(
              //               //                     context,
              //               //                     MaterialPageRoute(builder: (context) => PerguntasFrenquentes())
              //               //                 );
              //               //               },
              //               //             ),
              //               //           ],
              //               //         ),
              //               //       ),
              //               //       Padding(
              //               //           padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              //               //           child: TextButton(
              //               //             onPressed: () => Dialogs.bottomMaterialDialog(
              //               //                 msg: 'Tem certeza que deseja sair do Aplicativo?',
              //               //                 title: 'Sair Do aplicativo',
              //               //                 context: context,
              //               //                 actions: [
              //               //                   IconsOutlineButton(
              //               //                     onPressed: () {
              //               //                       Navigator.pop(context);
              //               //                     },
              //               //                     text: 'Cancelar',
              //               //                     iconData: Icons.cancel_outlined,
              //               //                     textStyle: TextStyle(color: Colors.grey),
              //               //                     iconColor: Colors.grey,
              //               //                   ),
              //               //                   IconsButton(
              //               //                     onPressed: () async {
              //               //                       // Obtém a instância do SharedPreferences
              //               //                       final prefs =
              //               //                           await SharedPreferences.getInstance();
              //               //
              //               //                       // Remove o token
              //               //                       prefs.remove('token');
              //               //
              //               //                       // Atualize o valor de _isLoggedIn para false
              //               //                       _isLoggedIn.value = false;
              //               //
              //               //                       // Navega para a página de login
              //               //                       Navigator.pushAndRemoveUntil(
              //               //                         context,
              //               //                         MaterialPageRoute(builder: (context) => login()),
              //               //                             (Route<dynamic> route) => false,
              //               //                       );
              //               //                     },
              //               //                     text: 'Sair',
              //               //                     iconData: Icons.exit_to_app,
              //               //                     color: Colors.red,
              //               //                     textStyle: TextStyle(color: Colors.white),
              //               //                     iconColor: Colors.white,
              //               //                   ),
              //               //                 ]),
              //               //
              //               //             child: Row(
              //               //               mainAxisAlignment: MainAxisAlignment.center,
              //               //               children: <Widget>[
              //               //                 Icon(
              //               //                   Icons.logout,
              //               //                   size: 30,
              //               //                   color: Colors.red,
              //               //                 ),
              //               //                 SizedBox(width: 10),
              //               //                 // Espaço entre o ícone e o texto
              //               //                 // Text(
              //               //                 //   'Logout',
              //               //                 //   style: TextStyle(
              //               //                 //     fontSize: 15,
              //               //                 //     color: Colors.red,
              //               //                 //   ),
              //               //                 // ),
              //               //               ],
              //               //             ),
              //               //           ))
              //               //     ],
              //               //   ),
              //               // ),
              // body:CustomDrawer(),


          //
          //   ),
          //
          // );
        }
      },
    );
  }
}
