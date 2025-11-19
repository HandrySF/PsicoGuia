import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Asegúrate de tener esta dependencia
import 'screens/login_screen.dart';

void main() {
  runApp(const PsicoGuiaApp());
}

class PsicoGuiaApp extends StatelessWidget {
  const PsicoGuiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Definimos el azul principal del diseño
    const primaryBlue = Color(0xFF0D47A1);

    return MaterialApp(
      title: 'PsicoGuía AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Usamos Material 3 para componentes más modernos
        useMaterial3: true,
        
        // Definimos el esquema de colores basado en nuestro azul
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          primary: primaryBlue,
          surface: Colors.white, // Fondo de las pantallas
        ),
        
        // Fondo blanco por defecto para toda la app
        scaffoldBackgroundColor: Colors.white,
        
        // Aplicamos la fuente Nunito globalmente (se ve muy bien en apps de salud)
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        
        // Estilo por defecto para los botones elevados (opcional, para consistencia)
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            foregroundColor: Colors.white,
            elevation: 0, // Diseño plano y moderno
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      // Establecemos la pantalla de Login como la inicial
      home: const LoginScreen(),
    );
  }
}