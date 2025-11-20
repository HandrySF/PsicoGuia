import 'package:flutter/material.dart';

class AdminQuizSelectorScreen extends StatefulWidget {
  const AdminQuizSelectorScreen({super.key});

  @override
  State<AdminQuizSelectorScreen> createState() => _AdminQuizSelectorScreenState();
}

class _AdminQuizSelectorScreenState extends State<AdminQuizSelectorScreen> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  // 1. DATA DE LOS PACIENTES
  final List<Map<String, String>> patients = [
    {
      "name": "Mauricio Romero",
      "initials": "MR",
      "status": "Paciente Activo • Terapia TCC",
    },
    {
      "name": "Handry Serrano",
      "initials": "HS",
      "status": "Paciente Nuevo • Evaluación Inicial",
    },
    {
      "name": "Abraham Carrasco",
      "initials": "AC",
      "status": "Seguimiento • Control de Estrés",
    },
  ];

  // 2. ESTADO: Paciente seleccionado actualmente (Empezamos con el primero, Mauricio)
  late Map<String, String> selectedPatient;

  @override
  void initState() {
    super.initState();
    selectedPatient = patients[0]; // Inicializar con Mauricio
  }

  // 3. FUNCIÓN PARA CAMBIAR PACIENTE (Modal Inferior)
  void _showPatientSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 300, // Altura del selector
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Seleccionar Paciente",
                style: TextStyle(
                  color: primaryBlue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: patients.length,
                  separatorBuilder: (_, __) => const Divider(),
                  itemBuilder: (context, index) {
                    final p = patients[index];
                    final isSelected = p == selectedPatient;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isSelected ? primaryBlue : Colors.grey[200],
                        child: Text(
                          p['initials']!,
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[700],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        p['name']!,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? primaryBlue : Colors.black87,
                        ),
                      ),
                      subtitle: Text(p['status']!),
                      trailing: isSelected ? Icon(Icons.check_circle, color: primaryBlue) : null,
                      onTap: () {
                        // ACTUALIZAMOS EL ESTADO Y CERRAMOS EL MODAL
                        setState(() {
                          selectedPatient = p;
                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Lista de herramientas (Igual que antes)
  final List<Map<String, dynamic>> availableQuizzes = [
    {
      "title": "GAD-7 Escala de Ansiedad",
      "category": "Diagnóstico",
      "time": "5 min",
      "desc": "Evalúa la severidad de los síntomas de ansiedad.",
      "icon": Icons.poll_outlined,
    },
    {
      "title": "Registro de Pensamientos",
      "category": "TCC",
      "time": "10 min",
      "desc": "Ejercicio para identificar distorsiones cognitivas.",
      "icon": Icons.edit_note_rounded,
    },
    {
      "title": "PHQ-9 Test de Depresión",
      "category": "Diagnóstico",
      "time": "5 min",
      "desc": "Monitoreo semanal de síntomas depresivos.",
      "icon": Icons.health_and_safety_outlined,
    },
    {
      "title": "Diario de Gratitud",
      "category": "Bienestar",
      "time": "3 min",
      "desc": "Ejercicio positivo para mejorar el estado de ánimo.",
      "icon": Icons.wb_sunny_outlined,
    },
  ];

  void _assignQuiz(BuildContext context, String quizName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            // Ahora usamos el nombre variable del paciente seleccionado
            Expanded(child: Text("'$quizName' enviado a ${selectedPatient['name']}")),
          ],
        ),
        backgroundColor: Colors.green[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Asignar Herramienta',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
      ),
      body: Column(
        children: [
          // 1. TARJETA DEL PACIENTE (DINÁMICA)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: primaryBlue.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    selectedPatient['initials']!, // Iniciales dinámicas
                    style: const TextStyle(color: Color(0xFF0D47A1), fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded( // Usamos Expanded para evitar overflow si el nombre es largo
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedPatient['name']!, // Nombre dinámico
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        selectedPatient['status']!, // Estado dinámico
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // BOTÓN CAMBIAR CONECTADO
                GestureDetector(
                  onTap: _showPatientSelector, // <--- AQUÍ CONECTAMOS LA FUNCIÓN
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: const Row(
                      children: [
                        Text("Cambiar", style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 14)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "BIBLIOTECA DE RECURSOS",
                style: TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 1, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // 2. LISTA DE QUIZZES
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: availableQuizzes.length,
              itemBuilder: (context, index) {
                final quiz = availableQuizzes[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryBlue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(quiz['icon'], color: primaryBlue),
                    ),
                    title: Text(
                      quiz['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(quiz['desc'], style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _Tag(text: quiz['category'], color: Colors.orange[100]!, textColor: Colors.orange[900]!),
                            const SizedBox(width: 8),
                            _Tag(text: quiz['time'], color: Colors.blue[50]!, textColor: Colors.blue[900]!),
                          ],
                        )
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.send_rounded),
                      color: primaryBlue,
                      onPressed: () => _assignQuiz(context, quiz['title']),
                      tooltip: "Enviar a ${selectedPatient['name']}",
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;

  const _Tag({required this.text, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}