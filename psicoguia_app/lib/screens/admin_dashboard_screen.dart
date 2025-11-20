import 'package:flutter/material.dart';
import 'login_screen.dart';
// import 'patient_detail_screen.dart'; // Futura pantalla de detalle

class TherapistDashboardScreen extends StatelessWidget {
  const TherapistDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Tu paleta de colores oficial
    const primaryBlue = Color(0xFF0D47A1);
    const accentGreen = Color(0xFF4CAF50); // Para indicar "En curso" o "Disponible"

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Header (Hola Dr. + Logout)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hola, Dr. Ruiz',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: primaryBlue,
                        ),
                      ),
                      Text(
                        'Psicología Clínica',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                            (route) => false,
                      );
                    },
                    icon: const Icon(Icons.logout, color: primaryBlue, size: 30),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // 2. Card Principal: PRÓXIMA CITA (Prioridad Alta)
              // Mantiene el estilo de la card azul del usuario
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Próxima Sesión',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: accentGreen,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'En 10 min',
                            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    const Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Icon(Icons.person, color: primaryBlue),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ana García',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Sesión de seguimiento #4',
                              style: TextStyle(color: Colors.white70, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Lógica para videollamada o ver notas
                        },
                        icon: const Icon(Icons.videocam_outlined),
                        label: const Text('INICIAR VIDEOLAMADA'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: primaryBlue,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. Estadísticas Rápidas (Row de Cards pequeñas)
              const Row(
                children: [
                  Expanded(child: _InfoCard(title: '12', subtitle: 'Citas Hoy', icon: Icons.calendar_today)),
                  SizedBox(width: 12),
                  Expanded(child: _InfoCard(title: '5', subtitle: 'Nuevos Match', icon: Icons.people_alt_outlined, isHighlight: true)),
                  SizedBox(width: 12),
                  Expanded(child: _InfoCard(title: '4.9', subtitle: 'Calificación', icon: Icons.star_rate_rounded)),
                ],
              ),
              const SizedBox(height: 24),

              // 4. Widget Creativo: Monitor de Pacientes (Equivalente al Jardín Zen)
              // Una herramienta para ver cómo se sienten sus pacientes hoy basado en los Quizzes
              const Text(
                'Estado de tus Pacientes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              const PatientMoodMonitorWidget(),

              const SizedBox(height: 24),

              // 5. Lista de Nuevos Match (Equivalente a "Buscar Doctor" del usuario)
              const Text(
                'Solicitudes de Match',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    _MatchRequestTile(
                      name: 'Carlos M.',
                      description: 'Busca manejo de ansiedad laboral.',
                      matchPercent: '95%',
                    ),
                    const Divider(height: 1),
                    _MatchRequestTile(
                      name: 'Laura P.',
                      description: 'Interés en terapia cognitivo-conductual.',
                      matchPercent: '88%',
                    ),
                    // Botón ver más
                    TextButton(
                      onPressed: (){},
                      child: const Text(
                        'Ver todas las solicitudes',
                        style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- WIDGETS PERSONALIZADOS PARA EL TERAPEUTA ---

class _InfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isHighlight;

  const _InfoCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isHighlight = false,
  });

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isHighlight ? primaryBlue.withOpacity(0.1) : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: isHighlight ? Border.all(color: primaryBlue.withOpacity(0.3)) : null,
      ),
      child: Column(
        children: [
          Icon(icon, color: isHighlight ? primaryBlue : Colors.grey[700], size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: isHighlight ? primaryBlue : Colors.black87,
            ),
          ),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

class _MatchRequestTile extends StatelessWidget {
  final String name;
  final String description;
  final String matchPercent;

  const _MatchRequestTile({
    required this.name,
    required this.description,
    required this.matchPercent,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const CircleAvatar(backgroundColor: Color(0xFFE0E0E0), child: Icon(Icons.person_outline, color: Colors.grey)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$matchPercent Match',
              style: TextStyle(color: Colors.green[800], fontSize: 10, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      subtitle: Text(description, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}

// --- WIDGET CREATIVO: MONITOR DE ÁNIMO ---
// Muestra un resumen visual de cómo se sienten los pacientes del doctor hoy
class PatientMoodMonitorWidget extends StatelessWidget {
  const PatientMoodMonitorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "RESUMEN DEL DÍA",
                  style: TextStyle(
                    color: Color(0xFF0D47A1),
                    fontWeight: FontWeight.w900,
                    fontSize: 14,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black87, fontSize: 13),
                    children: [
                      const TextSpan(text: "El "),
                      TextSpan(
                        text: "65% de tus pacientes",
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800]),
                      ),
                      const TextSpan(text: " reportan sentirse mejor hoy. Hay 2 reportes de ansiedad alta."),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          // Gráfico circular simulado
          SizedBox(
            height: 70,
            width: 70,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: 0.65,
                  strokeWidth: 8,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
                ),
                const Text("65%", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}