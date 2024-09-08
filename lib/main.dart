import 'package:matheus_melo_trabalho_final_opta2/firebase_options.dart';
import 'package:matheus_melo_trabalho_final_opta2/view/lista_tarefas.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(AgendaApp());
}

class AgendaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          hintColor: Colors.green,
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green)),
            hintStyle: TextStyle(color: Colors.green),
          )),
      home: ListaTarefas(),
    );
  }
}
