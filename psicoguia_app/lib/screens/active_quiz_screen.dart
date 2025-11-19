import 'package:flutter/material.dart';
import '../data/quiz_data.dart'; // Asegúrate de importar tu modelo

class ActiveQuizScreen extends StatefulWidget {
  final Quiz quiz; // Recibimos el quiz seleccionado

  const ActiveQuizScreen({super.key, required this.quiz});

  @override
  State<ActiveQuizScreen> createState() => _ActiveQuizScreenState();
}

class _ActiveQuizScreenState extends State<ActiveQuizScreen> {
  int _currentIndex = 0;
  
  // Guardamos el índice de la respuesta seleccionada para cada pregunta. -1 es nada seleccionado.
  late List<int> _selectedAnswers;

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List.filled(widget.quiz.questions.length, -1);
  }

  void _nextQuestion() {
    if (_currentIndex < widget.quiz.questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      // AQUÍ IRÍA LA LÓGICA PARA CALCULAR RESULTADOS
      // Por ahora solo cerramos el quiz
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Quiz finalizado. Resultados guardados.")));
      Navigator.pop(context);
    }
  }

  void _prevQuestion() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);
    final currentQuestion = widget.quiz.questions[_currentIndex];
    final totalQuestions = widget.quiz.questions.length;

    // Cálculo de progreso (0.0 a 1.0)
    double progress = (_currentIndex + 1) / totalQuestions;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // 1. Barra de Progreso Superior
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(primaryBlue),
              minHeight: 6,
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 2. Título del Quiz (Dinámico)
                    Text(
                      widget.quiz.title,
                      style: const TextStyle(
                        color: primaryBlue,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(height: 30),

                    // 3. Número de pregunta
                    Text(
                      'Pregunta ${_currentIndex + 1} de $totalQuestions',
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // 4. Texto de la Pregunta
                    Text(
                      currentQuestion.text,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800, // Extra bold como la imagen
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // 5. Lista de Opciones (Botones)
                    Expanded(
                      child: ListView.builder(
                        itemCount: currentQuestion.options.length,
                        itemBuilder: (context, index) {
                          final isSelected = _selectedAnswers[_currentIndex] == index;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedAnswers[_currentIndex] = index;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 16),
                                  side: BorderSide(
                                    color: isSelected ? primaryBlue : Colors.grey,
                                    width: isSelected ? 2 : 1,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  backgroundColor: isSelected ? primaryBlue.withOpacity(0.05) : Colors.white,
                                ),
                                child: Text(
                                  currentQuestion.options[index],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected ? primaryBlue : Colors.black87,
                                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // 6. Botones de Navegación (Anterior / Siguiente)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Botón Anterior (Gris)
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: _currentIndex == 0 ? null : _prevQuestion, // Deshabilitado si es la primera
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB0B0B0), // Gris
                              foregroundColor: Colors.black87,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('anterior', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        
                        // Botón Siguiente (Azul)
                        SizedBox(
                          width: 120,
                          child: ElevatedButton(
                            onPressed: _selectedAnswers[_currentIndex] == -1 
                                ? null // Deshabilitado si no ha respondido
                                : _nextQuestion,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryBlue,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: const Text('siguiente', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}