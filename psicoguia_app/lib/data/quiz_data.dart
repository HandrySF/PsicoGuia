class Quiz {
  final String id;
  final String title;
  final String description;
  final List<Question> questions;

  Quiz({required this.id, required this.title, required this.description, required this.questions});
}

class Question {
  final String text;
  final List<String> options;

  Question({required this.text, required this.options});
}

// --- DATOS DE LOS 5 QUIZZES FAMOSOS ---

final List<Quiz> availableQuizzes = [
  Quiz(
    id: 'phq9',
    title: 'Test de Depresión (PHQ-9)',
    description: 'Evalúa la severidad de los síntomas depresivos.',
    questions: [
      Question(text: '¿Tener poco interés o placer en hacer las cosas?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
      Question(text: '¿Sentirse desanimado/a, deprimido/a o sin esperanza?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
      Question(text: '¿Con problemas para dormir o manteniéndose dormido/a?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
      Question(text: '¿Sentirse cansado/a o con poca energía?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
    ],
  ),
  Quiz(
    id: 'gad7',
    title: 'Test de Ansiedad (GAD-7)',
    description: 'Mide los niveles de ansiedad generalizada.',
    questions: [
      Question(text: '¿Sentirse nervioso/a, intranquilo/a o con los nervios de punta?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
      Question(text: '¿No poder dejar de preocuparse o no poder controlar la preocupación?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
      Question(text: '¿Preocuparse demasiado por diferentes cosas?', options: ['Nunca', 'Varios días', 'Más de la mitad de los días', 'Casi todos los días']),
    ],
  ),
  Quiz(
    id: 'pss',
    title: 'Escala de Estrés Percibido',
    description: 'Evalúa el grado en que las situaciones de la vida se perciben como estresantes.',
    questions: [
      Question(text: 'En el último mes, ¿con qué frecuencia ha estado afectado por algo que ocurrió inesperadamente?', options: ['Nunca', 'Casi nunca', 'A veces', 'A menudo', 'Muy a menudo']),
      Question(text: 'En el último mes, ¿con qué frecuencia ha sentido que no podía controlar las cosas importantes en su vida?', options: ['Nunca', 'Casi nunca', 'A veces', 'A menudo', 'Muy a menudo']),
    ],
  ),
  Quiz(
    id: 'rosenberg',
    title: 'Escala de Autoestima',
    description: 'Un instrumento para evaluar el sentimiento de satisfacción personal.',
    questions: [
      Question(text: 'Siento que soy una persona digna de aprecio, al menos en igual medida que los demás.', options: ['Muy de acuerdo', 'De acuerdo', 'En desacuerdo', 'Muy en desacuerdo']),
      Question(text: 'A veces pienso que no sirvo para nada.', options: ['Muy de acuerdo', 'De acuerdo', 'En desacuerdo', 'Muy en desacuerdo']),
    ],
  ),
  Quiz(
    id: 'ghq12',
    title: 'Bienestar General (GHQ-12)',
    description: 'Detecta problemas psicológicos generales y salud mental.',
    questions: [
      Question(text: '¿Ha podido concentrarse bien en lo que hacía?', options: ['Mejor que lo habitual', 'Igual que lo habitual', 'Menos que lo habitual', 'Mucho menos que lo habitual']),
      Question(text: '¿Sus preocupaciones le han hecho perder mucho sueño?', options: ['No, en absoluto', 'No más que lo habitual', 'Un poco más que lo habitual', 'Mucho más que lo habitual']),
       Question(text: '¿Se ha sentido constantemente agobiado y en tensión?', options: ['No, en absoluto', 'No más que lo habitual', 'Un poco más que lo habitual', 'Mucho más que lo habitual']),
    ],
  ),
];