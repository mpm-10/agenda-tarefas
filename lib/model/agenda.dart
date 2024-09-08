class Agenda {
  String? id;
  String titulo;
  String descricao;
  String local;
  String prioridade;
  String lembrete;

  int diaTarefa;
  String mesTarefa;
  int anoTarefa;

  int diaRegistro;
  String mesRegistro;
  int anoRegistro;

  int horaRegistro;
  int minutoRegistro;
  int segundoRegistro;

  Agenda(this.titulo, this.descricao, this.local, this.prioridade, this.lembrete,
      this.diaTarefa, this.mesTarefa, this.anoTarefa,
      this.diaRegistro, this.mesRegistro, this.anoRegistro,
      this.horaRegistro, this.minutoRegistro, this.segundoRegistro,
      {this.id});

  Map<String, dynamic> toMap() => {
    "titulo": titulo,
    "descricao": descricao,
    "local": local,
    "prioridade": prioridade,
    "lembrete": lembrete,
    "diaTarefa": diaTarefa,
    "mesTarefa": mesTarefa,
    "anoTarefa": anoTarefa,
    "diaRegistro": diaRegistro,
    "mesRegistro": mesRegistro,
    "anoRegistro": anoRegistro,
    "horaRegistro": horaRegistro,
    "minutoRegistro": minutoRegistro,
    "segundoRegistro": segundoRegistro,
  };

  @override
  String toString() {
    return "Título da Tarefa: $titulo \n " +
        "Descrição da Tarefa: $descricao \n" +
        "Local: $local \n" +
        "Prioridade: $prioridade \n" +
        "Lembrete : $lembrete \n" +
        "Dia: $diaTarefa \n" +
        "Mês: $mesTarefa \n" +
        "Ano: $anoTarefa \n" +
        "Dia de Registro: $diaRegistro \n" +
        "Mês de Registro: $mesRegistro \n" +
        "Ano de Registro: $anoRegistro \n" +
        "Hora de Registro: $horaRegistro \n" +
        "Minuto de Registro: $minutoRegistro \n" +
        "Segundo de Registro: $segundoRegistro";
  }

  Agenda.fromJson(Map<String, dynamic> json, String id_firebase)
      : titulo = json["titulo"],
        descricao = json["descricao"],
        local = json["local"],
        prioridade = json["prioridade"],
        lembrete = json["lembrete"],
        diaTarefa = json["diaTarefa"],
        mesTarefa = json["mesTarefa"],
        anoTarefa = json["anoTarefa"],
        diaRegistro = json["diaRegistro"],
        mesRegistro = json["mesRegistro"],
        anoRegistro = json["anoRegistro"],
        horaRegistro = json["horaRegistro"],
        minutoRegistro = json["minutoRegistro"],
        segundoRegistro = json["segundoRegistro"],
        id = id_firebase;
}
