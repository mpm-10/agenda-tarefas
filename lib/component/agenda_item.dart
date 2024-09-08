import 'package:flutter/material.dart';
import 'package:matheus_melo_trabalho_final_opta2/view/editar_tarefa.dart';
import 'package:matheus_melo_trabalho_final_opta2/view/lista_tarefas.dart';
import '../controller/agenda_controller.dart';
import '../model/agenda.dart';

class AgendaItem extends StatefulWidget {
  final Agenda _agenda;
  List<Agenda> _listaTarefas;
  int _index;

  AgendaItem(this._agenda, this._listaTarefas, this._index);

  @override
  _AgendaItemState createState() => _AgendaItemState();
}

class _AgendaItemState extends State<AgendaItem> {
  Agenda? _ultimoRemovido;
  AgendaController _agendaController = AgendaController();

  _atualizarLista() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListaTarefas(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var _subTitulo = widget._agenda.diaTarefa.toString() + " de " +
        widget._agenda.mesTarefa.toString() + " de " +
        widget._agenda.anoTarefa.toString();

    return Dismissible(
      key: Key(DateTime
          .now()
          .millisecondsSinceEpoch
          .toString()),
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment(0.9, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      direction: DismissDirection.endToStart,
      child: Card(
        color: Colors.green,
        child: ListTile(
          title: Text(
            widget._agenda.titulo,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
          subtitle: Text(
            _subTitulo,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.black,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    EditarTarefa(
                      tarefa: widget._listaTarefas[widget._index],
                    ),
              ),
            );
          },
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          mostrarAlerta(context);
        });
      },
    );
  }

  mostrarAlerta(BuildContext context) {
    Widget botaoNao = TextButton(
      child: const Text(
        "Não",
        style: TextStyle(color: Colors.black),
      ),
      onPressed: () {
        _atualizarLista();
      },
    );
    Widget botaoSim = TextButton(
      child: const Text(
        "Sim",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      onPressed: () {
        _ultimoRemovido = widget._listaTarefas[widget._index];
        widget._listaTarefas.removeAt(widget._index);
        _agendaController.excluir(_ultimoRemovido!.id!);
        _atualizarLista();
      },
    );
    AlertDialog alerta = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      backgroundColor: Colors.green,
      title: const Text(
        "Aviso",
        style: TextStyle(color: Colors.black),
      ),
      content: const Text(
        "Deseja apagar o registro?",
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        botaoSim,
        botaoNao,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}