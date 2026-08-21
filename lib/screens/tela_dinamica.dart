import 'package:flutter/material.dart';
import 'package:portfolio_app/styles/geral.dart';

/// Tela dinâmica (StatefulWidget) — o conteúdo ainda vai ser definido.
/// A estrutura de estado já está pronta: basta trocar o corpo do build
/// e adicionar os campos/métodos com setState.
class TelaDinamica extends StatefulWidget {
  const TelaDinamica({super.key});

  @override
  State<TelaDinamica> createState() => _TelaDinamicaState();
}

class _TelaDinamicaState extends State<TelaDinamica> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: fundo,
        elevation: 0,
        iconTheme: const IconThemeData(color: roxo),
        title: Text("Em construção", style: titulo),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.construction_rounded, size: 72, color: verde),
              const SizedBox(height: 20),
              Text("Área dinâmica", style: nome),
              const SizedBox(height: 10),
              Text(
                "Ainda não decidi o que colocar aqui. "
                "A tela já é StatefulWidget, então é só adicionar o estado.",
                textAlign: TextAlign.center,
                style: corpo,
              ),
              const SizedBox(height: 32),
              TextButton.icon(
                style: botao,
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_rounded),
                label: const Text("Voltar ao portfólio"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
