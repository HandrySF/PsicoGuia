import 'package:flutter/material.dart';
import '../data/quiz_data.dart'; // Importamos los datos
import 'active_quiz_screen.dart'; // Importamos la pantalla de ejecución

class QuizListScreen extends StatelessWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Selecciona un Quiz',
          style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false, // Quitamos la flecha atrás porque está en el Nav Bar
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: availableQuizzes.length,
        itemBuilder: (context, index) {
          final quiz = availableQuizzes[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.white,
            surfaceTintColor: Colors.white, // Para evitar tintes rosados en Material 3
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.assignment_outlined, color: primaryBlue),
              ),
              title: Text(
                quiz.title,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(quiz.description),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
                // NAVEGACIÓN: Ir a la pantalla de preguntas pasando el quiz seleccionado
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActiveQuizScreen(quiz: quiz),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}