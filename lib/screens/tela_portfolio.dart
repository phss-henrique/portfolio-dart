import 'package:flutter/material.dart';
import 'package:portfolio_app/styles/geral.dart';

class TelaPortfolio extends StatelessWidget {
  const TelaPortfolio({super.key});

  // URL da foto do LinkedIn (link temporario: expira pelo parametro "e" da query).
  static const fotoPerfil =
      "https://media.licdn.com/dms/image/v2/D4D03AQG4HwVJpvqWWQ/profile-displayphoto-scale_400_400/B4DaAgBxxiJ0Ag-/0/1787243733986?e=1788998400&v=beta&t=YZmvCWBIHGmW3lmUMUa-ppY3UL-nETIlTRS8U6ZKLWM";

  static const stack = [
    "Java", "Spring Boot", "Go", "React", "Angular",
    "Next", "Python", "PostgreSQL", "Azure", "Maven",
  ];

  static const oQueFaco = [
    ["Backend", "APIs e microsserviços robustos com Java, Spring Boot e Go, focados em performance e concorrência."],
    ["Frontend", "Interfaces modernas e responsivas com React (Vite) e Angular."],
    ["IA", "Machine learning e análise de imagem (DINOv2) em projetos como o Kindraw."],
    ["Impacto", "Aplicações acessíveis, como o LibrasLearn, plataforma gamificada de Libras."],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: fundo,
        elevation: 0,
        title: Text("Portfólio", style: titulo),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const _Avatar(),
                  const SizedBox(height: 16),
                  Text("Pedro Henrique", style: nome),
                  const SizedBox(height: 6),
                  Text("Software Engineer  •  @phss-henrique", style: cargo),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text("Sobre", style: secao),
            const SizedBox(height: 8),
            Text(
              "Sou apaixonado por tecnologia, que enxergo como uma verdadeira virtude. "
              "Com vontade constante de aprender, encontrei na programação a forma perfeita "
              "de canalizar e expandir essa paixão. Hoje atuo como Aprendiz de Soluções Digitais "
              "e engenheiro de software, construindo aplicações eficientes, escaláveis e "
              "impactantes do zero.",
              style: corpo,
            ),
            const SizedBox(height: 28),
            Text("O que eu faço", style: secao),
            const SizedBox(height: 12),
            for (final item in oQueFaco) _Cartao(titulo: item[0], texto: item[1]),
            const SizedBox(height: 16),
            Text("Tech Stack", style: secao),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final tec in stack)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                    decoration: BoxDecoration(
                      color: superficie,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: roxo, width: 1),
                    ),
                    child: Text(tec, style: chip),
                  ),
              ],
            ),
            const SizedBox(height: 28),
            Text("Além da tela", style: secao),
            const SizedBox(height: 8),
            Text(
              "Quando não estou otimizando queries ou ajustando os switches magnéticos do teclado, "
              "provavelmente estou na academia analisando o torque de um levantamento, "
              "tirando acordes de sétima menor no violão, sobrevivendo a um run de Resident Evil "
              "ou encarando um chefe de Dark Souls.",
              style: corpo,
            ),
            const SizedBox(height: 36),
            Center(
              child: TextButton.icon(
                style: botao,
                onPressed: () => Navigator.pushNamed(context, "/dinamica"),
                icon: const Icon(Icons.arrow_forward_rounded),
                label: const Text("Ir para a tela dinâmica"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Cartao extends StatelessWidget {
  const _Cartao({required this.titulo, required this.texto});

  final String titulo;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: superficie,
        borderRadius: BorderRadius.circular(14),
        border: const Border(left: BorderSide(color: verde, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo, style: chip.copyWith(fontSize: 14, color: verde)),
          const SizedBox(height: 6),
          Text(texto, style: corpo.copyWith(fontSize: 13)),
        ],
      ),
    );
  }
}

/// Foto de perfil redonda. Mostra as iniciais "PH" so enquanto a imagem
/// carrega ou se o download falhar - nunca por cima da foto.
class _Avatar extends StatelessWidget {
  const _Avatar();

  static const double diametro = 104;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        TelaPortfolio.fotoPerfil,
        width: diametro,
        height: diametro,
        fit: BoxFit.cover,
        loadingBuilder: (context, filho, progresso) {
          if (progresso == null) return filho;
          return const _Iniciais();
        },
        errorBuilder: (context, erro, pilha) => const _Iniciais(),
      ),
    );
  }
}

class _Iniciais extends StatelessWidget {
  const _Iniciais();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _Avatar.diametro,
      height: _Avatar.diametro,
      alignment: Alignment.center,
      color: roxo,
      child: const Text(
        "PH",
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: fundo,
        ),
      ),
    );
  }
}
