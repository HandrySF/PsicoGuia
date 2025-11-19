import 'package:flutter/material.dart';
import '../data/doctor_data.dart';
import 'full_directory_screen.dart';
import 'chat_detail_screen.dart'; // <--- IMPORTANTE: Importamos la pantalla de Chat

class DoctorMatchResultScreen extends StatelessWidget {
  final List<String> userTags;

  const DoctorMatchResultScreen({super.key, this.userTags = const []});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    // 1. Copiamos la lista para no afectar la original
    List<Doctor> matchedDoctors = List.from(allDoctors);

    // 2. ¡IMPORTANTE! Mezclamos primero para que si hay empate, varíen los doctores
    matchedDoctors.shuffle(); 

    // 3. Ordenamos por relevancia (Match de tags)
    matchedDoctors.sort((a, b) {
      int scoreA = a.tags.where((tag) => userTags.contains(tag)).length;
      int scoreB = b.tags.where((tag) => userTags.contains(tag)).length;
      return scoreB.compareTo(scoreA); // Mayor puntaje primero
    });

    // 4. Tomamos los top 3
    final topDoctors = matchedDoctors.take(3).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Busca a tu doctor", style: TextStyle(fontWeight: FontWeight.bold, color: primaryBlue)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: primaryBlue),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Basado en tus respuestas, estos especialistas son tu mejor match clínico",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black,
                height: 1.2,
              ),
            ),
            const SizedBox(height: 30),
            
            // LISTA DE RESULTADOS
            Expanded(
              child: ListView.separated(
                itemCount: topDoctors.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final doctor = topDoctors[index];
                  // Contamos coincidencias para ver si el match es fuerte (efecto visual del borde)
                  int matches = doctor.tags.where((tag) => userTags.contains(tag)).length;
                  
                  // --- AQUÍ ESTÁ LA MAGIA DEL CLICK ---
                  return GestureDetector(
                    onTap: () {
                      // Navegamos al Chat del doctor seleccionado
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailScreen(doctor: doctor),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        // Si tiene color especial lo usamos, si no, blanco/gris
                        color: doctor.cardColor != Colors.white ? doctor.cardColor : Colors.grey[100],
                        borderRadius: BorderRadius.circular(20),
                        // Borde azul si hubo coincidencia real de etiquetas
                        border: Border.all(
                          color: matches > 0 ? primaryBlue : Colors.transparent, 
                          width: matches > 0 ? 2 : 0
                        ),
                      ),
                      child: Row(
                        children: [
                          // FOTO
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              backgroundImage: const AssetImage('assets/doctor_placeholder.png'),
                              child: const Icon(Icons.person, size: 40, color: Colors.grey),
                            ),
                          ),
                          // TEXTOS
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  doctor.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  doctor.specialty,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          // ICONO PERFIL
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.chat_bubble_outline, size: 28, color: primaryBlue.withOpacity(0.7)),
                                const SizedBox(height: 4),
                                const Text("Chat", style: TextStyle(fontSize: 10, color: Colors.black54))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // BOTÓN VER DIRECTORIO COMPLETO
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FullDirectoryScreen()),
                );
              },
              child: const Text(
                "O puedes ver el directorio completo",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}