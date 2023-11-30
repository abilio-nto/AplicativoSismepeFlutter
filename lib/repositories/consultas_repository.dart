import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:carteirasismepe/models/Beneficiario.dart';
import 'package:carteirasismepe/models/ConsultasAgendadasModel.dart';
import 'package:carteirasismepe/models/Dependente.dart';
import 'package:carteirasismepe/models/Titular.dart';
import 'package:carteirasismepe/models/TitulatComDependentes.dart';
import 'package:carteirasismepe/models/Usuario.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConsultasRepository{

  Future<List<Consulta>?> FindConsultasAgendada(int id) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');

    // Carregue o certificado
    ByteData data = await rootBundle.load('assets/certificado/www_sismepe_pe_gov_br.crt');
    SecurityContext securityContext = SecurityContext.defaultContext;
    securityContext.setTrustedCertificatesBytes(data.buffer.asUint8List());

    // Crie o HttpClient com o SecurityContext
    HttpClient client = HttpClient(context: securityContext);

    // Crie o Dio com o HttpClient
    final dio = Dio(BaseOptions(
      baseUrl: 'https://www.sismepe.pe.gov.br:8099', // Substitua pela URL de login real
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ));

    final response = await dio.get(
      '/paciente/pacienteID/${id}', // Substitua pelo caminho de login real
    );



    if (response.statusCode == 200) {

      int id = response.data['id'];

     if(id != null){
       final dio = Dio(BaseOptions(
         baseUrl: 'https://www.sismepe.pe.gov.br:8099', // Substitua pela URL de login real
         headers: <String, String>{
           'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',
         },
       ));

       final response = await dio.get(
         '/it-agenda-central/filtro?paciente=${id}&situacao=A', // Substitua pelo caminho de login real
       );



       if (response.statusCode == 200 ) {

         Map<String, dynamic> jsonMap = response.data;
         List<Consulta> consultas = [];


         // // Verifique se a chave 'titular' existe no mapa
         // if (jsonMap.containsKey('titular')) {
         //   // Preencha os dados do titular
         //   titular = Titular.fromMap(jsonMap['titular']);
         // }

         // Verifique se a chave 'dependentes' existe no mapa
         if (jsonMap.containsKey('content')) {
           // 'dependentes' é uma lista, então vamos iterar sobre ela
           for (var item in jsonMap['content']) {
             Consulta consulta = Consulta.fromMap(item);
             consultas.add(consulta);
           }
         }

         if (consultas.isNotEmpty) {
           return consultas;
         }else{
           return [];
         }

       }
     }



    } else {
      // Trate o caso em que a resposta não é 200 OK
    }
  }

  Future<List<Consulta>?> FindConsultasHistorico(int id) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');
    //
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
      '/paciente/pacienteID/${id}', // Substitua pelo caminho de login real
    );



    if (response.statusCode == 200) {

      int id = response.data['id'];

      if(id != null){
        final dio = Dio(BaseOptions(
          baseUrl: 'https://www.sismepe.pe.gov.br:8099', // Substitua pela URL de login real
          headers: <String, String>{
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ));

        final response = await dio.get(
          '/it-agenda-central/filtro?paciente=${id}', // Substitua pelo caminho de login real
        );



        if (response.statusCode == 200 ) {

          Map<String, dynamic> jsonMap = response.data;
          List<Consulta> consultas = [];


          // // Verifique se a chave 'titular' existe no mapa
          // if (jsonMap.containsKey('titular')) {
          //   // Preencha os dados do titular
          //   titular = Titular.fromMap(jsonMap['titular']);
          // }

          // Verifique se a chave 'dependentes' existe no mapa
          if (jsonMap.containsKey('content')) {
            // 'dependentes' é uma lista, então vamos iterar sobre ela
            for (var item in jsonMap['content']) {
              Consulta consulta = Consulta.fromMap(item);
              consultas.add(consulta);
            }
          }

          if (consultas.isNotEmpty) {
            return consultas;
          }else{
            return [];
          }

        }
      }



    } else {
      // Trate o caso em que a resposta não é 200 OK
    }
  }



}