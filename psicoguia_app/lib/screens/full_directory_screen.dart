import 'package:flutter/material.dart';
import '../data/doctor_data.dart';
import 'chat_detail_screen.dart'; // <--- IMPORTANTE: Importamos la pantalla de Chat

class FullDirectoryScreen extends StatelessWidget {
  const FullDirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Directorio Médico"),
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: allDoctors.length,
        itemBuilder: (context, index) {
          final doctor = allDoctors[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            color: Colors.white,
            surfaceTintColor: Colors.white,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: primaryBlue.withOpacity(0.1),
                // Intentamos mostrar la primera letra del título (ej. "D" de Dr.) o nombre
                child: Text(
                  doctor.name.length > 4 ? doctor.name.substring(0, 1) : "D", 
                  style: const TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                doctor.name,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  doctor.specialty,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: const Icon(Icons.chat_bubble_outline, size: 20, color: primaryBlue),
              onTap: () {
                // --- NAVEGACIÓN AL CHAT ---
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatDetailScreen(doctor: doctor),
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