import 'package:carteirasismepe/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:material_dialogs/dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Logout extends StatefulWidget {
  const Logout({super.key});

  @override
  State<Logout> createState() => _LogoutState();
}

class _LogoutState extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),

    //   child: Dialogs.bottomMaterialDialog(
    //     msg: 'Tem certeza que deseja sair do Aplicativo?',
    //     title: 'Sair Do aplicativo',
    //     context: context,
    //     actions: [
    //       IconsOutlineButton(
    //         onPressed: () {
    //           Navigator.pop(context);
    //         },
    //         text: 'Cancelar',
    //         iconData: Icons.cancel_outlined,
    //         textStyle: TextStyle(color: Colors.grey),
    //         iconColor: Colors.grey,
    //       ),
    //       IconsButton(
    //         onPressed: () async {
    //           // Obtém a instância do SharedPreferences
    //           final prefs =
    //           await SharedPreferences.getInstance();
    //
    //           // Remove o token
    //           prefs.remove('token');
    //
    //           // // Atualize o valor de _isLoggedIn para false
    //           // _isLoggedIn.value = false;
    //
    //           // Navega para a página de login
    //           Navigator.pushAndRemoveUntil(
    //             context,
    //             MaterialPageRoute(builder: (context) => login()),
    //                 (Route<dynamic> route) => false,
    //           );
    //         },
    //         text: 'Sair',
    //         iconData: Icons.exit_to_app,
    //         color: Colors.red,
    //         textStyle: TextStyle(color: Colors.white),
    //         iconColor: Colors.white,
    //       ),
    //     ]
    // ),
    );

  }
}
