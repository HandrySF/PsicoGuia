import 'package:flutter/material.dart';
import '../data/doctor_data.dart';
import 'chat_detail_screen.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);
    
    // Simulamos que ya tienes chat con los primeros 3 doctores (El equipo)
    final activeChats = allDoctors.take(3).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Mensajes',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w900,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Sin flecha atrás (es pestaña principal)
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: activeChats.length,
        separatorBuilder: (_, __) => const Divider(height: 30, thickness: 0.5), // Separador sutil
        itemBuilder: (context, index) {
          final doctor = activeChats[index];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey[200],
              backgroundImage: const AssetImage('assets/doctor_placeholder.png'),
            ),
            title: Text(
              doctor.name.replaceFirst("Lic. ", "").replaceFirst("Dr. ", ""), // Mostrar nombre corto si quieres
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              doctor.welcomeMessage, // Mostramos el último mensaje (el de bienvenida)
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              // NAVEGAR A LA CONVERSACIÓN ESPECÍFICA
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(doctor: doctor),
                ),
              );
            },
          );
        },
      ),
    );
  }
}