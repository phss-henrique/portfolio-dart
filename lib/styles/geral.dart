import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Paleta inspirada no tema Dracula usado no meu GitHub
const fundo = Color(0xFF282A36);
const superficie = Color(0xFF44475A);
const roxo = Color(0xFFBD93F9);
const verde = Color(0xFF50FA7B);
const rosa = Color(0xFFFF79C6);
const textoClaro = Color(0xFFF8F8F2);
const textoSuave = Color(0xFFA6ACCD);

final titulo = GoogleFonts.poppins(
  fontSize: 30,
  fontWeight: FontWeight.w800,
  color: roxo,
);

final nome = GoogleFonts.poppins(
  fontSize: 26,
  fontWeight: FontWeight.w700,
  color: textoClaro,
);

final cargo = GoogleFonts.firaCode(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  color: verde,
);

final secao = GoogleFonts.poppins(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: rosa,
);

final corpo = GoogleFonts.poppins(
  fontSize: 14,
  height: 1.6,
  color: textoSuave,
);

final chip = GoogleFonts.firaCode(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  color: textoClaro,
);

final botao = TextButton.styleFrom(
  backgroundColor: roxo,
  foregroundColor: fundo,
  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
  textStyle: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w700),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
);
