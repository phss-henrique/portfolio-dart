import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_app/main.dart';

void main() {
  testWidgets('portfolio abre e navega para a tela dinamica', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Pedro Henrique'), findsOneWidget);

    final botaoDinamica = find.text('Ir para a tela dinâmica');
    await tester.ensureVisible(botaoDinamica);
    await tester.pumpAndSettle();
    await tester.tap(botaoDinamica);
    await tester.pumpAndSettle();

    expect(find.text('Área dinâmica'), findsOneWidget);
  });
}
