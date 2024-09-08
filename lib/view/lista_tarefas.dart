import 'package:flutter/material.dart';
import '../component/agenda_item.dart';
import '../controller/agenda_controller.dart';
import '../model/agenda.dart';
import 'inserir_tarefa.dart';

class ListaTarefas extends StatefulWidget {
  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  List<Agenda> _listaTarefas = [];
  AgendaController _agendaController = AgendaController();

  @override
  void initState() {
    super.initState();
    _agendaController.findAll().then((dados) {
      setState(() {
        _listaTarefas = dados;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Agenda>>(
        initialData: _listaTarefas,
        future: _agendaController.findAll(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando..."),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Agenda>? tarefas = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Agenda tarefa = tarefas![index];
                  return AgendaItem(tarefa, _listaTarefas, index);
                },
                itemCount: tarefas!.length,
              );
              break;
          }
          return Text("Erro");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => InserirTarefa(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        foregroundColor: Colors.black,
      ),
    );
  }
}
