import 'dart:typed_data';
import 'package:carteirasismepe/models/DadosGlobais.dart';
import 'package:carteirasismepe/models/login_state.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:carteirasismepe/repositories/beneficiario_repository.dart';

import 'package:carteirasismepe/screens/HomeScreen.dart';

import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

import 'package:async_button_builder/async_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:loading_icon_button/loading_icon_button.dart';
import 'package:provider/provider.dart';

//
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> with WidgetsBindingObserver {
  bool _obscureText = true;
  final TextEditingController loginController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DadosGlobais dadosGlobais  = Provider.of<DadosGlobais>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Builder(builder: (context) {

        return Stack(children: [
          Positioned.fill(
            child: Image.asset(
              'assets/img/login2.png',
              fit: BoxFit.fill,
            ),
          ),
          Center(
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 25, 10, 0),
                  // child: Card(
                  //   elevation: 7,
                  //   color: Colors.white.withOpacity(0.7),
                  //
                  //   shape: RoundedRectangleBorder(
                  //     side: BorderSide(
                  //       color: Colors.white.withOpacity(0.9),
                  //     ),
                  //     borderRadius: const BorderRadius.all(Radius.circular(12)),
                  //   ),
                  //   child: SizedBox(
                  //     width: 370,
                  //     height: 300,
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          TextField(
                            controller: loginController,
                            decoration: const InputDecoration(
                              label: Text("Login", style: TextStyle(
                                  color: Colors.grey, fontSize: 18)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(18))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(18))

                              ),
                              //Color.fromRGBO(0, 122, 255, 0.1),
                              prefixIcon: Icon(
                                  Icons.person, color: Colors.blue),
                              fillColor: Colors.white,
                              filled: true,
                              constraints: BoxConstraints(maxWidth: 340),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 11.0),
                            ),
                            style: TextStyle(fontSize: 18,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                          const SizedBox(
                            height: 16,
                          ),


                          TextField(
                            controller: senhaController,
                            decoration: InputDecoration(
                              label: Text("Senha", style: TextStyle(
                                  color: Colors.grey, fontSize: 18)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(18))
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.lightBlueAccent),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(18))
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.key, color: Colors.blue,),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _obscureText ? Icons.visibility : Icons
                                      .visibility_off,
                                  color: Theme
                                      .of(context)
                                      .primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                              constraints: BoxConstraints(maxWidth: 340),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 11.0),
                            ),
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _obscureText,
                          ),

                          Row(
                            children: [
                              Expanded(child: TextButton(onPressed: (){}, child: Text("Esqueceu sua senha? Clique Aqui!", style: TextStyle(color: Colors.white, fontSize: 15),))),
                            ],
                          ),

                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 250,
                                child: ArgonButton(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                  height: 50,
                                  roundLoadingShape: true,
                                  width: 150,
                                  onTap: (startLoading, stopLoading,
                                      btnState) async {
                                    startLoading();
                                    if (loginController.text != null ||
                                        senhaController.text != null) {
                                      await loginUser(loginController.text,
                                          senhaController.text, context, dadosGlobais);
                                      stopLoading();
                                    } else {
                                      stopLoading();
                                    }
                                    // Future.delayed(const Duration(seconds: 3), () {
                                    //   stopLoading();
                                    // });
                                  },
                                  loader: const Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Entrar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 19,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  borderRadius: 15,
                                  color: Colors.blue[700],
                                ),
                              )
                            ],
                          ),


                        ],
                  //     ),
                  //   ),
                   )
              ),
            ),

        ]);
      }),
    );
  }
}

Future<Object?> loginUser(String login, String senha,
    BuildContext context, DadosGlobais  dadosGlobais) async {
  // Carregue o certificado
  ByteData data = await rootBundle.load(
      'assets/certificado/www_sismepe_pe_gov_br.crt');
  SecurityContext securityContext = SecurityContext.defaultContext;
  securityContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

  // Crie o HttpClient com o SecurityContext
  HttpClient client = HttpClient(context: securityContext);

  // Crie o Dio com o HttpClient
  final dio = Dio(BaseOptions(
    baseUrl: 'https://www.sismepe.pe.gov.br:8099',
    // Substitua pela URL de login real
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
  ));
  (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
      (HttpClient client) {
    return client;
  };
  // // Dados de login
  // final loginData = {
  //   "login": login,
  //   "senha": senha,
  // };

  // Faça a solicitação de login
  // final response = await dio.post('/login', data: loginData);

  try {
    final response = await dio.post(
      '/login', // Substitua pelo caminho de login real
      data: {
        "login": login,
        "senha": senha,
      },


    );

    // Verifique o status da resposta
    if (response.statusCode == 200) {
      // Verifique o cabeçalho de autorização
      final List<String>? authorizationHeader = response
          .headers['authorization'];
      if (authorizationHeader != null && authorizationHeader.isNotEmpty) {
        final token = authorizationHeader[0];

        // Verifique se o token é um token Bearer
        if (token.startsWith('Bearer ')) {
          final tokenValue = token.substring(7); // Remove o prefixo 'Bearer '
          // Salve o token e o usuário nas preferências compartilhadas
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', tokenValue);
          prefs.setString('user', login);

          dadosGlobais.usuarioLogado(true);

          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
                (Route<dynamic> route) => false,
          );
        } else {
          print("Token 'Bearer' não encontrado no cabeçalho 'Authorization'");
          return null;
        }
      } else {
        print("Cabeçalho 'Authorization' não encontrado na resposta");
        return null;
      }
    } else {
      print(response);
      return false;
    }
    // Restante do seu código...
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text('Ocorreu um erro durante o login: $e'),
          actions: <Widget>[
            ElevatedButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

