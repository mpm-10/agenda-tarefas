import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matheus_melo_trabalho_final_opta2/view/lista_tarefas.dart';
import '../model/agenda.dart';
import '../component/dropdown_component.dart';
import '../component/textfield_component.dart';
import '../controller/agenda_controller.dart';

class InserirTarefa extends StatefulWidget {
  final Agenda? tarefa;

  InserirTarefa({this.tarefa});

  @override
  _InserirTarefaState createState() => _InserirTarefaState();
}

class _InserirTarefaState extends State<InserirTarefa> {
  AgendaController _agendaController = AgendaController();
  String? _id;

  TextEditingController _tituloController = TextEditingController();
  TextEditingController _descricaoController = TextEditingController();
  TextEditingController _localController = TextEditingController();
  TextEditingController _prioridadeController = TextEditingController();
  TextEditingController _lembreteController = TextEditingController();
  TextEditingController _diaTarefaController = TextEditingController();
  TextEditingController _mesTarefaController = TextEditingController();
  TextEditingController _anoTarefaController = TextEditingController();

  var _dias = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
    "11", "12", "13", "14", "15", "16", "17", "18", "19", "20",
    "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31",
  ];
  var _meses = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho",
    "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro",
  ];

  var _prioridades = ["Baixa", "Normal", "Alta"];

  var _lembretes = ["Ativado", "Desativado"];

  var _diaTarefaSelecionado = "1";
  var _mesTarefaSelecionado = "Janeiro";
  var _prioridadeSelecionada = "Normal";
  var _lembreteSelecionado = "Ativado";

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  _alterarDiaTarefa(String novoDiaTarefaSelecionado) {
    _dropDownDiaTarefaSelected(novoDiaTarefaSelecionado);
    setState(() {
      this._diaTarefaSelecionado = novoDiaTarefaSelecionado;
      _diaTarefaController.text = this._diaTarefaSelecionado;
    });
  }

  _dropDownDiaTarefaSelected(String novoDiaTarefa) {
    setState(() {
      this._diaTarefaSelecionado = novoDiaTarefa;
    });
  }

  _alterarMesTarefa(String novoMesTarefaSelecionado) {
    _dropDownMesTarefaSelected(novoMesTarefaSelecionado);
    setState(() {
      this._mesTarefaSelecionado = novoMesTarefaSelecionado;
      _mesTarefaController.text = this._mesTarefaSelecionado;
    });
  }

  _dropDownMesTarefaSelected(String novoMesTarefa) {
    setState(() {
      this._mesTarefaSelecionado = novoMesTarefa;
    });
  }

  _alterarPrioridade(String novaPrioridadeSelecionada) {
    _dropDownPrioridadeSelected(novaPrioridadeSelecionada);
    setState(() {
      this._prioridadeSelecionada = novaPrioridadeSelecionada;
      _prioridadeController.text = this._prioridadeSelecionada;
    });
  }

  _dropDownPrioridadeSelected(String novaPrioridade) {
    setState(() {
      this._prioridadeSelecionada = novaPrioridade;
    });
  }

  _alterarLembrete(String novoLembrete) {
    _dropDownLembreteSelected(novoLembrete);
    setState(() {
      this._lembreteSelecionado = novoLembrete;
      _lembreteController.text = this._lembreteSelecionado;
    });
  }

  _dropDownLembreteSelected(String novoLembrete) {
    setState(() {
      this._lembreteSelecionado = novoLembrete;
    });
  }

  _displaySnackBar(BuildContext context, String mensagem) {
    final snackBar = SnackBar(
      content: Text(mensagem),
      backgroundColor: Colors.green[900],
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _salvar(BuildContext context) {

    DateTime date = DateTime.now();

    final tarefa = Agenda(
        _tituloController.text,
        _descricaoController.text,
        _localController.text,
        _prioridadeSelecionada,
        _lembreteSelecionado,
        int.parse(_diaTarefaSelecionado),
        _mesTarefaSelecionado,
        int.parse(_anoTarefaController.text),
        date.day,
        date.month.toString(),
        date.year,
        date.hour,
        date.minute,
        date.second
    );

    setState(() {
      _agendaController.salvar(tarefa).then((res) {
        _displaySnackBar(context, res.toString());
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ListaTarefas(),
          ),
        );
      });
    });

  }

  @override
  void initState() {
    if (widget.tarefa != null) {
      _id = widget.tarefa!.id;

      _tituloController.text = widget.tarefa!.titulo;
      _descricaoController.text = widget.tarefa!.descricao;
      _localController.text = widget.tarefa!.local;
      _prioridadeSelecionada = widget.tarefa!.prioridade;
      _lembreteController.text = widget.tarefa!.lembrete;
      _diaTarefaSelecionado = widget.tarefa!.diaTarefa.toString();
      _mesTarefaSelecionado = widget.tarefa!.mesTarefa.toString();
      _anoTarefaController.text = widget.tarefa!.anoTarefa.toString();

    } else {
      _id = null;
      _anoTarefaController.text = "2024";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Inserir Nova Tarefa"),
        foregroundColor: Colors.black,
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListaTarefas()),
              );
            });
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldComponent(
                  label: "Título: ",
                  controller: _tituloController,
                  maxLines: 1,
                  minLines: 1,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldComponent(
                  label: "Descrição: ",
                  controller: _descricaoController,
                  minLines: 1,
                  maxLines: 3,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldComponent(
                  label: "Local: ",
                  controller: _localController,
                  minLines: 1,
                  maxLines: 1,
                  textInputType: TextInputType.text),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Prioridade:",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DropdownComponent(
                      elementos: _prioridades,
                      itemSelecionado: _prioridadeSelecionada,
                      onChanged: (novaPrioridade) {
                        setState(() => _prioridadeSelecionada = novaPrioridade);
                      },
                    ),
                  ),
                  Text(
                    "Lembrete:",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DropdownComponent(
                      elementos: _lembretes,
                      itemSelecionado: _lembreteSelecionado,
                      onChanged: (novoLembrete) {
                        setState(() => _lembreteSelecionado = novoLembrete);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Text(
                    "Dia:",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DropdownComponent(
                      elementos: _dias,
                      itemSelecionado: _diaTarefaSelecionado,
                      onChanged: (novoDiaTarefa) {
                        setState(() => _diaTarefaSelecionado = novoDiaTarefa);
                      },
                    ),
                  ),
                  Text(
                    "Mês:",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: DropdownComponent(
                      elementos: _meses,
                      itemSelecionado: _mesTarefaSelecionado,
                      onChanged: (novoMesTarefa) {
                        setState(() => _mesTarefaSelecionado = novoMesTarefa);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFieldComponent(
                  label: "Ano: ",
                  controller: _anoTarefaController,
                  minLines: 1,
                  maxLines: 1,
                  textInputType: TextInputType.text),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _salvar(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                  label: const Text(
                    'Salvar',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  icon: const Icon(
                    Icons.save,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
