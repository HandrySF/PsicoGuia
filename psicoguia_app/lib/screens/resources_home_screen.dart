import 'package:flutter/material.dart';
import '../data/resource_data.dart';
import 'resource_detail_screen.dart'; // Importamos la pantalla de detalle

class ResourcesHomeScreen extends StatelessWidget {
  const ResourcesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // Sombra sutil
        title: const Text(
          'Hola, [Nombre Usuario]', // Puedes personalizar esto con el nombre real del usuario
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: primaryBlue, size: 28),
          SizedBox(width: 10),
          Icon(Icons.settings, color: primaryBlue, size: 28),
          SizedBox(width: 16),
        ],
        automaticallyImplyLeading: false, // Es una pestaña principal, no necesita botón de volver
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Recursos para tu bienestar:",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // LISTA DE TEMAS (Manejo de ansiedad, Técnicas de relajación, etc.)
            ListView.builder(
              shrinkWrap: true, // Importante para ListView dentro de SingleChildScrollView
              physics: const NeverScrollableScrollPhysics(), // Deshabilita el scroll propio
              itemCount: allResourceTopics.length,
              itemBuilder: (context, index) {
                final topic = allResourceTopics[index];
                return GestureDetector(
                  onTap: () {
                    // Navegar a la pantalla de detalle del tema
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResourceDetailScreen(topic: topic),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                      color: topic.iconColor.withOpacity(0.1), // Color de fondo claro
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: topic.iconColor.withOpacity(0.3), width: 1.5),
                    ),
                    child: Row(
                      children: [
                        Icon(topic.icon, size: 30, color: topic.iconColor),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                topic.iconLabel, // "Manejo"
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: topic.iconColor.withOpacity(0.8),
                                ),
                              ),
                              Text(
                                topic.title, // "Manejo de la ansiedad"
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios, size: 20, color: Colors.grey),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}