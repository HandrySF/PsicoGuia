import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'quiz_list_screen.dart'; // <--- IMPORTANTE: Importamos la lista de quizzes
import 'chatbot_screen.dart'; // <--- Importar Chatbot
import 'resources_home_screen.dart'; // <--- NUEVA IMPORTACIÓN
import 'messages_screen.dart'; // <--- Importar

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // Lista de pantallas
  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardScreen(),
    const QuizListScreen(),
    const ChatbotScreen(),
    const ResourcesHomeScreen(), // <--- AQUI: Usamos la nueva pantalla de Recursos (Índice 3)
    const MessagesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      // Usamos IndexedStack para mantener el estado de las pantallas (que no se reinicien al cambiar de tab)
      body: IndexedStack(
        index: _selectedIndex,
        children: _widgetOptions,
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // 1. Inicio
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Inicio',
          ),
          // 2. Quizzes
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline), // Icono de interrogación
            label: 'Quizzes',
          ),
          // 3. Chatbot IA (El central)
          BottomNavigationBarItem(
            icon: Icon(Icons.psychology, size: 35),
            label: 'Chatbot IA',
          ),
          // 4. Perfil
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline), 
            label: 'Recursos',
          ),
          // 5. Mensajes
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Mensajes',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed, // Importante para que quepan los 5 íconos
        onTap: _onItemTapped,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 12),
      ),
    );
  }
}