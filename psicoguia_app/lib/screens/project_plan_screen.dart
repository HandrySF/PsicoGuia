import 'package:flutter/material.dart';

// Enum para manejar el estado de las tareas
enum TaskStatus { pending, inProgress, completed }

class ProjectPlanScreen extends StatelessWidget {
  const ProjectPlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diagrama de Tareas del Proyecto'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          // --- SECCIÓN DE TAREAS A REALIZAR ---
          PhaseHeader(title: 'Fase 1: Planificación y Diseño'),
          TaskCard(
            title: '1.1 Definir Arquitectura, Esquema de DB y Requerimientos de IA',
            explanation: 'Dibujar la arquitectura (App, Backend, DB, IA). Diseñar las tablas de la base de datos (usuarios, respuestas_quiz) y definir la entrada/salida del modelo de IA.',
            dates: 'oct 15 - oct 20',
          ),
          TaskCard(
            title: '1.2 Configurar Entorno de Desarrollo y Control de Versiones (Git)',
            explanation: 'Crear el repositorio en GitHub/GitLab y definir las ramas de trabajo (main, develop).',
            dates: 'oct 21',
          ),
          PhaseHeader(title: 'Fase 2: Frontend y Preparación de IA'),
          TaskCard(
            title: '2.1 Desarrollar UI de Login, Registro y Navegación principal',
            explanation: 'Codificar en Flutter las pantallas de Login, Registro y la barra de navegación inferior (Tabs).',
            dates: 'oct 22 - oct 28',
          ),
          TaskCard(
            title: '2.2 Desarrollar UI del Dashboard, Quiz y Chatbot',
            explanation: 'Codificar las pantallas principales: Dashboard, pantalla del Quiz y la interfaz de chat.',
            dates: 'oct 29 - nov 7',
          ),
          TaskCard(
            title: '2.3 Investigar y preparar el dataset para los modelos de IA',
            explanation: 'Buscar y descargar datasets públicos (Kaggle). Limpiar los datos para dejarlos listos para el entrenamiento.',
            dates: 'oct 22 - nov 7',
          ),
          PhaseHeader(title: 'Fase 3: Backend y Prototipo de IA'),
          TaskCard(
            title: '3.1 Crear Lógica básica y de gestión de usuarios',
            explanation: 'Desarrollar el backend. Crear endpoints para registrar usuarios, login y guardar respuestas del quiz.',
            dates: 'nov 7 - nov 12',
          ),
          TaskCard(
            title: '3.2 Seleccionar y entrenar el prototipo del modelo de IA',
            explanation: 'Usando el dataset limpio, entrenar un modelo de NLP (ej. usando BERT) para clasificar los textos del usuario.',
            dates: 'nov 12 - nov 17',
          ),
          TaskCard(
            title: '3.3 Crear el endpoint para integración de las predicciones',
            explanation: 'Crear una URL en el backend (ej: /analizar-texto). La app enviará el texto, el servidor lo pasará al modelo y devolverá la predicción.',
            dates: 'nov 18 - nov 19',
          ),
          PhaseHeader(title: 'Fase 4: Integración y Entrega'),
          TaskCard(
            title: '4.1 Integrar Frontend con el Backend, incluyendo el endpoint de IA',
            explanation: 'Conectar la app de Flutter al backend. Cuando el usuario chatee, su texto viajará al servidor, será analizado por la IA y la respuesta volverá.',
            dates: 'nov 20 - nov 24',
          ),
          TaskCard(
            title: '4.2 Realizar pruebas funcionales y corregir errores críticos (bugs)',
            explanation: 'Probar la app de principio a fin (crear usuario, responder quiz, chatear). Anotar y corregir los errores más graves.',
            dates: 'nov 25 - dic 1',
          ),
          TaskCard(
            title: '4.3 Redactar Documentación Final y preparar la Presentación',
            explanation: 'Escribir el documento final del proyecto y crear las diapositivas para la defensa final.',
            dates: 'dic 2 - dic 4',
          ),

          // --- SECCIÓN DE IDEAS DESCARTADAS ---
          PhaseHeader(title: 'Ideas Descartadas / Postergadas'),
          IdeaCard(
            title: 'Arquitectura de Microservicios',
            reason: 'Demasiado compleja y lenta de configurar para un proyecto académico. Un backend monolítico es más rápido.',
          ),
          IdeaCard(
            title: 'Pipeline de Integración Continua (CI/CD)',
            reason: 'Es una práctica profesional excelente, pero configurarla quita tiempo valioso para el desarrollo principal.',
          ),
          IdeaCard(
            title: 'Inicio de sesión con Redes Sociales',
            reason: 'Requiere configurar APIs de terceros. Un login con correo es más rápido de implementar.',
          ),
          IdeaCard(
            title: 'Animaciones avanzadas (Rive/Lottie)',
            reason: 'La prioridad es la funcionalidad. Nos enfocaremos en una UI limpia primero.',
          ),
          IdeaCard(
            title: 'Crear dataset propio con web scraping',
            reason: 'Es lento, éticamente cuestionable y los datos estarían muy "sucios". Es mejor usar datasets ya validados.',
          ),
          IdeaCard(
            title: 'Sistema de roles complejo (Admin, Doctor, Paciente)',
            reason: 'Para este prototipo, nos enfocaremos solo en la experiencia del "Usuario General" (paciente).',
          ),
          IdeaCard(
            title: 'Entrenar un modelo de lenguaje (GPT) desde cero',
            reason: 'Requiere un poder computacional masivo (GPUs caras) y semanas de entrenamiento. Es inviable.',
          ),
          IdeaCard(
            title: 'Implementar el modelo de IA en el celular (TFLite)',
            reason: 'Es más complejo de implementar en la app y dificulta las actualizaciones del modelo. Es mejor que la IA viva en el servidor.',
          ),
          IdeaCard(
            title: 'Integración con wearables (Google Fit)',
            reason: 'Añade otra capa de complejidad de APIs, permisos y privacidad que está fuera del alcance de este prototipo.',
          ),
          IdeaCard(
            title: 'Pruebas Unitarias con 100% de cobertura',
            reason: 'No hay tiempo. Se priorizarán las pruebas funcionales (que la app se pueda usar) sobre las pruebas de código interno.',
          ),
        ],
      ),
    );
  }
}

// --- WIDGETS REUTILIZABLES ---

// Encabezado para cada Fase
class PhaseHeader extends StatelessWidget {
  final String title;
  const PhaseHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, bottom: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
      ),
    );
  }
}

// Tarjeta 🔵 🟠 🟢 para tareas "En Alcance" (AHORA ES INTERACTIVA)
class TaskCard extends StatefulWidget {
  final String title;
  final String explanation;
  final String dates;

  const TaskCard({
    super.key,
    required this.title,
    required this.explanation,
    required this.dates,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  TaskStatus _status = TaskStatus.pending;

  Color getBorderColor() {
    switch (_status) {
      case TaskStatus.pending:
        return Colors.blue[700]!; // Pendiente
      case TaskStatus.inProgress:
        return Colors.yellow[700]!; // En Proceso
      case TaskStatus.completed:
        return Colors.green[700]!; // Terminada
    }
  }

  Color getBackgroundColor() {
    switch (_status) {
      case TaskStatus.pending:
        return Colors.blue[50]!;
      case TaskStatus.inProgress:
        return Colors.yellow[50]!;
      case TaskStatus.completed:
        return Colors.green[50]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getBorderColor();
    final bgColor = getBackgroundColor();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: color, width: 6),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: color,
            ),
          ),
          const SizedBox(height: 8),

          // --- NUEVO: Fechas ---
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              widget.dates,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: color,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Explicación
          Text(
            widget.explanation,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const Divider(height: 24),

          // --- NUEVO: Botones de estado ---
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                icon: Icon(Icons.play_circle_outline, color: Colors.yellow[700]),
                label: Text('En Proceso', style: TextStyle(color: Colors.yellow[700])),
                onPressed: () {
                  setState(() {
                    _status = TaskStatus.inProgress;
                  });
                },
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                icon: Icon(Icons.check_circle_outline, color: Colors.green[700]),
                label: Text('Terminada', style: TextStyle(color: Colors.green[700])),
                onPressed: () {
                  setState(() {
                    _status = TaskStatus.completed;
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

// Tarjeta Roja para "Ideas Descartadas" (sin cambios)
class IdeaCard extends StatelessWidget {
  final String title;
  final String reason;
  const IdeaCard({super.key, required this.title, required this.reason});

  @override
  Widget build(BuildContext context) {
    const ideaColor = Color.fromARGB(237, 255, 0, 0); // Un color ámbar
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber[50], // Fondo amarillo claro
        borderRadius: BorderRadius.circular(8),
        border: Border(
          left: BorderSide(color: ideaColor, width: 6), // Borde izquierdo amarillo
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Idea Descartada: $title",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: ideaColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Razón: $reason",
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}