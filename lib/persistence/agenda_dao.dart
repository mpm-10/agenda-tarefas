import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/agenda.dart';

class AgendaDao {
  final databaseReference = FirebaseFirestore.instance;
  final String COLECAO = "tarefas";

  Future<String> inserir(Agenda agenda) async {
    try {
      DocumentReference ref =
      await databaseReference.collection(COLECAO).add(agenda.toMap());
      return ref.id;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> alterar(Agenda agenda) async {
    try {
      await databaseReference
          .collection(COLECAO)
          .doc(agenda.id)
          .update(agenda.toMap());
      return "Registro atualizado";
    } catch (e) {
      return e.toString();
    }
  }

  Future<List<Agenda>> findAll() async {
    QuerySnapshot tarefas = await databaseReference.collection(COLECAO).get();
    List<Agenda> listaTarefas = [];
    tarefas.docs.forEach((elemento) {
      listaTarefas.add(Agenda.fromJson(
          elemento.data() as Map<String, dynamic>, elemento.id));
    });

    return listaTarefas;
  }

  Future<String> excluir(String id) async {
    try {
      await databaseReference.collection(COLECAO).doc(id).delete();
      return "Registro excluído com projeto";
    } catch (e) {
      return e.toString();
    }
  }
}
