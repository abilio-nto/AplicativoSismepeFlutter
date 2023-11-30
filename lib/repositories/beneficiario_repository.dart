import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/models/Usuario.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BeneficiarioRepository{

  Future<Object?> FindTitular() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');

    // // Carregue o certificado
    // ByteData data = await rootBundle.load('assets/certificado/www_sismepe_pe_gov_br.crt');
    // SecurityContext securityContext = SecurityContext.defaultContext;
    // securityContext.setTrustedCertificatesBytes(data.buffer.asUint8List());
    //
    // // Crie o HttpClient com o SecurityContext
    // HttpClient client = HttpClient(context: securityContext);

    // Crie o Dio com o HttpClient
    final dio = Dio(BaseOptions(
      baseUrl: 'https://www.sismepe.pe.gov.br:8099', // Substitua pela URL de login real
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ));

    final response = await dio.get(
      '/aplicativo-sismepe/titular-dependentes-matricula-por-login', // Substitua pelo caminho de login real
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = response.data;
      List<Dependente> dependentes = [];
      Titular? titular;

      // Verifique se a chave 'titular' existe no mapa
      if (jsonMap.containsKey('titular')) {
        // Preencha os dados do titular
        titular = Titular.fromMap(jsonMap['titular']);
      }

      // Verifique se a chave 'dependentes' existe no mapa
      if (jsonMap.containsKey('dependentes')) {
        // 'dependentes' é uma lista, então vamos iterar sobre ela
        for (var item in jsonMap['dependentes']) {
          Dependente dependente = Dependente.fromMap(item);
          dependentes.add(dependente);
        }
      }

      if (titular != null) {
        return TitularComDependentes(titular: titular, dependentes: dependentes);
      }
    } else {
      // Trate o caso em que a resposta não é 200 OK
    }
  }

  Future<Usuario?> FindUserLogado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');

    // // Carregue o certificado
    // ByteData data = await rootBundle.load('assets/certificado/www_sismepe_pe_gov_br.crt');
    // SecurityContext securityContext = SecurityContext.defaultContext;
    // securityContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

    // Crie o HttpClient com o SecurityContext
    // HttpClient client = HttpClient(context: securityContext);

    // Crie o Dio com o HttpClient
    final dio = Dio(BaseOptions(
      baseUrl: 'https://www.sismepe.pe.gov.br:8099', // Substitua pela URL de login real
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ));

    final response = await dio.get(
      '/usuario', // Substitua pelo caminho de login real
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = response.data;
      Usuario? user;

      // Verifique se a chave 'titular' existe no mapa
      if (jsonMap.containsKey('pessoa')) {
        // Preencha os dados do titular
        user = Usuario.fromMap(jsonMap['pessoa']);

        return user;
      }

    } else {
      // Trate o caso em que a resposta não é 200 OK
    }
  }




}