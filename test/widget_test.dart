import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_app/main.dart';

void main() {
  testWidgets('portfolio abre e navega para o contador', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Pedro Henrique'), findsOneWidget);

    final botaoDinamica = find.text('Ir para a tela dinâmica');
    await tester.ensureVisible(botaoDinamica);
    await tester.pumpAndSettle();
    await tester.tap(botaoDinamica);
    await tester.pumpAndSettle();

    expect(find.text('Repetições'), findsOneWidget);
  });

  testWidgets('contador soma, subtrai, zera e nao fica negativo', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    final botaoDinamica = find.text('Ir para a tela dinâmica');
    await tester.ensureVisible(botaoDinamica);
    await tester.pumpAndSettle();
    await tester.tap(botaoDinamica);
    await tester.pumpAndSettle();

    final somar = find.byTooltip('Aumentar');
    final subtrair = find.byTooltip('Diminuir');
    final zerar = find.byTooltip('Zerar');

    expect(find.text('0'), findsOneWidget);

    await tester.tap(somar);
    await tester.tap(somar);
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);

    await tester.tap(subtrair);
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    // Em zero os botoes de diminuir e zerar ficam desabilitados.
    await tester.tap(zerar);
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
    await tester.tap(subtrair);
    await tester.pumpAndSettle();
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('a frase muda conforme o contador sobe', (tester) async {
    await tester.pumpWidget(const PortfolioApp());
    final botaoDinamica = find.text('Ir para a tela dinâmica');
    await tester.ensureVisible(botaoDinamica);
    await tester.pumpAndSettle();
    await tester.tap(botaoDinamica);
    await tester.pumpAndSettle();

    expect(find.text('Bora começar a série.'), findsOneWidget);

    final somar = find.byTooltip('Aumentar');
    for (var i = 0; i < 8; i++) {
      await tester.tap(somar);
    }
    await tester.pumpAndSettle();

    expect(find.text('Agora sim, torque bom.'), findsOneWidget);
  });
}
