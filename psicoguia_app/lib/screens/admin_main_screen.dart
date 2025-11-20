import 'package:flutter/material.dart';
import 'package:psicoguia_app/screens/admin_resources_library.dart';
// Importamos el dashboard del terapeuta que creamos en el paso anterior
// (Asegúrate de que el archivo se llame admin_dashboard_screen.dart)
import 'admin_dashboard_screen.dart';
import 'admin_chatbot_screen.dart';
import 'admin_quiz_selector_screen.dart';
import 'admin_patient_chat.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  int _selectedIndex = 0;

  // Paleta de colores profesional
  static const primaryBlue = Color(0xFF0D47A1);

  // Lista de pantallas del Terapeuta
  // NOTA: He puesto widgets temporales (Placeholders) para las pantallas
  // que aún no desarrollas, para que el código no marque error.
  static final List<Widget> _widgetOptions = <Widget>[
    const TherapistDashboardScreen(), // 0. Inicio (Ya existe)
    const AdminQuizSelectorScreen(),  // 1. Asignar Quizzes (Placeholder abajo)
    const AdminChatbotScreen(),       // 2. Asistente IA (Placeholder abajo)
    const AdminResourcesLibrary(),    // 3. Recursos Médicos (Placeholder abajo)
    const AdminPatientChat(),         // 4. Mensajes con Pacientes (Placeholder abajo)
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // IndexedStack mantiene vivo el estado de cada pestaña
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // 1. Inicio
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined), // Icono más administrativo
            activeIcon: Icon(Icons.dashboard),
            label: 'Inicio',
          ),
          // 2. Quizzes (Para enviar)
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_ind_outlined), // Icono de asignar a persona
            activeIcon: Icon(Icons.assignment_ind),
            label: 'Asignar',
          ),
          // 3. Chatbot IA (Monitor)
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_outlined, size: 35), // Icono de análisis/IA
            activeIcon: Icon(Icons.analytics, size: 35),
            label: 'PsicoGuía AI',
          ),
          // 4. Recursos (Biblioteca Pro)
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books_outlined),
            activeIcon: Icon(Icons.library_books),
            label: 'Biblioteca',
          ),
          // 5. Mensajes (Pacientes)
          BottomNavigationBarItem(
            icon: Icon(Icons.forum_outlined),
            activeIcon: Icon(Icons.forum),
            label: 'Pacientes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
        unselectedLabelStyle: const TextStyle(fontSize: 11),
        elevation: 10,
      ),
    );
  }
}