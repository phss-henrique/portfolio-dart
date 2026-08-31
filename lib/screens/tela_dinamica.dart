import 'package:flutter/material.dart';
import 'package:portfolio_app/styles/geral.dart';

/// Tela dinamica (StatefulWidget): contador de repeticoes com feedback
/// que muda conforme o numero sobe.
class TelaDinamica extends StatefulWidget {
  const TelaDinamica({super.key});

  @override
  State<TelaDinamica> createState() => _TelaDinamicaState();
}

class _TelaDinamicaState extends State<TelaDinamica> {
  int reps = 0;

  // Cada faixa tem um limite minimo, uma frase e uma cor.
  static const faixas = [
    _Faixa(0, "Bora começar a série.", textoSuave),
    _Faixa(1, "Aquecendo o movimento.", verde),
    _Faixa(8, "Agora sim, torque bom.", verde),
    _Faixa(15, "Falha muscular chegando.", rosa),
    _Faixa(25, "Isso já virou Dark Souls.", roxo),
  ];

  _Faixa get faixaAtual =>
      faixas.lastWhere((faixa) => reps >= faixa.minimo, orElse: () => faixas.first);

  void acrescer() => setState(() => reps++);

  // Nao deixa negativar: nao existe repeticao negativa.
  void subtrair() => setState(() {
        if (reps > 0) reps--;
      });

  void resetar() => setState(() => reps = 0);

  @override
  Widget build(BuildContext context) {
    final faixa = faixaAtual;

    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: fundo,
        elevation: 0,
        iconTheme: const IconThemeData(color: roxo),
        title: Text("Contador", style: titulo),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Repetições", style: cargo),
              const SizedBox(height: 12),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 250),
                style: nome.copyWith(fontSize: 88, color: faixa.cor),
                child: Text("$reps"),
              ),
              const SizedBox(height: 12),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: Text(
                  faixa.frase,
                  // A key faz o AnimatedSwitcher perceber a troca de frase.
                  key: ValueKey(faixa.frase),
                  textAlign: TextAlign.center,
                  style: corpo,
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _BotaoRedondo(
                    icone: Icons.remove_rounded,
                    rotulo: "Diminuir",
                    aoTocar: reps > 0 ? subtrair : null,
                  ),
                  const SizedBox(width: 16),
                  _BotaoRedondo(
                    icone: Icons.restore_rounded,
                    rotulo: "Zerar",
                    aoTocar: reps > 0 ? resetar : null,
                  ),
                  const SizedBox(width: 16),
                  _BotaoRedondo(
                    icone: Icons.add_rounded,
                    rotulo: "Aumentar",
                    aoTocar: acrescer,
                    destaque: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),
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

class _Faixa {
  const _Faixa(this.minimo, this.frase, this.cor);

  final int minimo;
  final String frase;
  final Color cor;
}

class _BotaoRedondo extends StatelessWidget {
  const _BotaoRedondo({
    required this.icone,
    required this.rotulo,
    required this.aoTocar,
    this.destaque = false,
  });

  final IconData icone;
  final String rotulo;
  // Nulo desabilita o botao (ex.: diminuir com o contador zerado).
  final VoidCallback? aoTocar;
  final bool destaque;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: aoTocar,
      icon: Icon(icone),
      iconSize: destaque ? 30 : 24,
      tooltip: rotulo,
      style: IconButton.styleFrom(
        backgroundColor: destaque ? roxo : superficie,
        foregroundColor: destaque ? fundo : textoClaro,
        disabledBackgroundColor: superficie.withValues(alpha: 0.4),
        disabledForegroundColor: textoSuave.withValues(alpha: 0.4),
        padding: EdgeInsets.all(destaque ? 18 : 14),
      ),
    );
  }
}
