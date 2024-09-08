import '../persistence/agenda_dao.dart';
import '../model/agenda.dart';

class AgendaController {
  AgendaDao agendaDao = AgendaDao();

  Future<String> salvar(Agenda agenda) {
    if (agenda.id == null) {
      return agendaDao.inserir(agenda);
    } else {
      return agendaDao.alterar(agenda);
    }
  }

  Future<List<Agenda>> findAll() async {
    return agendaDao.findAll();
  }

  Future<String> excluir(String id) {
    return agendaDao.excluir(id);
  }
}
