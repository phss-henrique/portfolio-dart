import 'package:flutter/material.dart';
import 'package:portfolio_app/screens/tela_dinamica.dart';
import 'package:portfolio_app/screens/tela_portfolio.dart';
import 'package:portfolio_app/styles/geral.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Portfólio",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: fundo,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const TelaPortfolio(),
        "/dinamica": (context) => const TelaDinamica(),
      },
    );
  }
}
