import 'package:flutter/material.dart';
import 'doctor_match_result_screen.dart';

class DoctorMatchQuizScreen extends StatefulWidget {
  const DoctorMatchQuizScreen({super.key});

  @override
  State<DoctorMatchQuizScreen> createState() => _DoctorMatchQuizScreenState();
}

class _DoctorMatchQuizScreenState extends State<DoctorMatchQuizScreen> {
  // AUMENTAMOS A 8 PREGUNTAS PARA CUBRIR MÁS ÁREAS
  final List<Map<String, String>> quizData = [
    { "question": "¿Buscas atención para un niño o adolescente?", "tag": "infantil" },
    { "question": "¿Tienes problemas de comunicación con tu pareja?", "tag": "pareja" },
    { "question": "¿Te sientes frecuentemente nervioso o con estrés?", "tag": "ansiedad" },
    { "question": "¿Sientes una tristeza profunda o falta de motivación?", "tag": "depresion" },
    { "question": "¿Tienes dificultades para dormir?", "tag": "sueño" },
    { "question": "¿Necesitas ayuda para manejar el consumo de sustancias?", "tag": "adicciones" },
    { "question": "¿Te gustaría aprender a meditar o relajarte?", "tag": "meditacion" },
    { "question": "¿Hay conflictos frecuentes en tu ambiente familiar?", "tag": "familia" },
  ];

  int currentIndex = 0;
  final List<String> collectedTags = [];

  void _answerQuestion(bool isYes) {
    if (isYes) {
      collectedTags.add(quizData[currentIndex]["tag"]!);
    }

    if (currentIndex < quizData.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => DoctorMatchResultScreen(userTags: collectedTags),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(title: const Text("Encuentra tu especialista"), backgroundColor: Colors.white, foregroundColor: primaryBlue, elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Pregunta ${currentIndex + 1} de ${quizData.length}", style: TextStyle(color: Colors.grey[500], fontSize: 16)),
                      const Spacer(),
                      Text(
                        quizData[currentIndex]["question"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: primaryBlue),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _ActionButton(icon: Icons.close, color: Colors.redAccent, label: "No", onTap: () => _answerQuestion(false)),
                _ActionButton(icon: Icons.check, color: Colors.green, label: "Sí", onTap: () => _answerQuestion(true)),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon; final Color color; final String label; final VoidCallback onTap;
  const _ActionButton({required this.icon, required this.color, required this.label, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(children: [GestureDetector(onTap: onTap, child: Container(padding: const EdgeInsets.all(20), decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 10, spreadRadius: 2)]), child: Icon(icon, color: color, size: 40))), const SizedBox(height: 8), Text(label, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16))]);
  }
}