import 'dart:convert';

class Consulta {
  final int id;
  final String dataAgendamento;
  final String horaInicial;
  final String situacaoAgendamento;
  final int idPrestador;
  final String nomePrestador;
  final int idEspecialidade;
  final String especialidade;
  final String permiteEncaixe;
  final int idPaciente;
  final String nomePaciente;
  final String matriculaPaciente;
  final int? situacaoAtendimento;
  final int? atendimentoId;
  final String? dataCancelamento;

  Consulta({
    this.id = 0,
    this.dataAgendamento = '',
    this.horaInicial = '',
    this.situacaoAgendamento = '',
    this.idPrestador = 0,
    this.nomePrestador = '',
    this.idEspecialidade = 0,
    this.especialidade = '',
    this.permiteEncaixe = '',
    this.idPaciente = 0,
    this.nomePaciente = '',
    this.matriculaPaciente = '',
    this.situacaoAtendimento,
    this.atendimentoId,
    this.dataCancelamento,
  });

  factory Consulta.fromJson(Map<String, dynamic> json) {
    return Consulta(
      id: json['id'] ?? 0,
      dataAgendamento: json['dataAgendamento'] ?? '',
      horaInicial: json['horaInicial'] ?? '',
      situacaoAgendamento: json['situacaoAgendamento'] ?? '',
      idPrestador: json['idPrestador'] ?? 0,
      nomePrestador: json['nomePrestador'] ?? '',
      idEspecialidade: json['idEspecialidade'] ?? 0,
      especialidade: json['especialidade'] ?? '',
      permiteEncaixe: json['permiteEncaixe'] ?? '',
      idPaciente: json['idPaciente'] ?? 0,
      nomePaciente: json['nomePaciente'] ?? '',
      matriculaPaciente: json['matriculaPaciente'] ?? '',
      situacaoAtendimento: json['situacaoAtendimento'],
      atendimentoId: json['atendimentoId'],
      dataCancelamento: json['dataCancelamento'],
    );
  }

  factory Consulta.fromMap(Map<String, dynamic> map) {
    return Consulta(
      id: map['id'] ?? 0,
      dataAgendamento: map['dataAgendamento'] ?? '',
      horaInicial: map['horaInicial'] ?? '',
      situacaoAgendamento: map['situacaoAgendamento'] ?? '',
      idPrestador: map['idPrestador'] ?? 0,
      nomePrestador: map['nomePrestador'] ?? '',
      idEspecialidade: map['idEspecialidade'] ?? 0,
      especialidade: map['especialidade'] ?? '',
      permiteEncaixe: map['permiteEncaixe'] ?? '',
      idPaciente: map['idPaciente'] ?? 0,
      nomePaciente: map['nomePaciente'] ?? '',
      matriculaPaciente: map['matriculaPaciente'] ?? '',
      situacaoAtendimento: map['situacaoAtendimento'],
      atendimentoId: map['atendimentoId'],
      dataCancelamento: map['dataCancelamento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataAgendamento': dataAgendamento,
      'horaInicial': horaInicial,
      'situacaoAgendamento': situacaoAgendamento,
      'idPrestador': idPrestador,
      'nomePrestador': nomePrestador,
      'idEspecialidade': idEspecialidade,
      'especialidade': especialidade,
      'permiteEncaixe': permiteEncaixe,
      'idPaciente': idPaciente,
      'nomePaciente': nomePaciente,
      'matriculaPaciente': matriculaPaciente,
      'situacaoAtendimento': situacaoAtendimento,
      'atendimentoId': atendimentoId,
      'dataCancelamento': dataCancelamento,
    };
  }

  @override
  String toString() {
    return 'Consulta{id: $id, dataAgendamento: $dataAgendamento, horaInicial: $horaInicial, situacaoAgendamento: $situacaoAgendamento, idPrestador: $idPrestador, nomePrestador: $nomePrestador, idEspecialidade: $idEspecialidade, especialidade: $especialidade, permiteEncaixe: $permiteEncaixe, idPaciente: $idPaciente, nomePaciente: $nomePaciente, matriculaPaciente: $matriculaPaciente, situacaoAtendimento: $situacaoAtendimento, atendimentoId: $atendimentoId, dataCancelamento: $dataCancelamento}';
  }
}
