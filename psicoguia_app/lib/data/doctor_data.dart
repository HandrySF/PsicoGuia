import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final Color cardColor;
  final String imageAsset;
  final List<String> tags;
  final String welcomeMessage; // Mensaje de bienvenida para el chat

  Doctor({
    required this.name,
    required this.specialty,
    required this.cardColor,
    this.imageAsset = 'assets/doctor_placeholder.png',
    required this.tags,
    required this.welcomeMessage,
  });
}

// --- CATÁLOGO COMPLETO DE 15 DOCTORES ---
// Etiquetas disponibles para match: 'ansiedad', 'depresion', 'practico', 'meditacion', 'sueño', 'autoestima', 'infantil', 'pareja', 'adicciones', 'estres', 'duelo', 'familia', 'medico'

final List<Doctor> allDoctors = [
  // --- EQUIPO PRINCIPAL (3) ---
  Doctor(
    name: 'Lic. Mauricio Romero',
    specialty: 'Psicólogo Clínico - Ansiedad y Sueño',
    cardColor: const Color(0xFFE0E0E0), // Gris
    tags: ['ansiedad', 'estres', 'sueño', 'practico'],
    welcomeMessage: "¡Hola! ¿Cómo vas?, recuerda que estoy disponible por este medio para cuando decidas contactarme sobre tu ansiedad o problemas de sueño."
  ),
  Doctor(
    name: 'Lic. Handry Serrano',
    specialty: 'Psicólogo Clínico - Depresión y Autoestima',
    cardColor: const Color(0xFFB39DDB), // Morado claro
    tags: ['depresion', 'duelo', 'autoestima'],
    welcomeMessage: "Hola, soy el Lic. Handry. He revisado tus resultados preliminares. ¿Te gustaría agendar una sesión para platicar sobre cómo te sientes?"
  ),
  Doctor(
    name: 'Lic. Abraham Carrasco',
    specialty: 'Psicólogo Clínico - Mindfulness y Estrés',
    cardColor: const Color(0xFFA5D6A7), // Verde claro
    tags: ['meditacion', 'estres', 'ansiedad'],
    welcomeMessage: "Hola. No me confirmaste la cita de hoy. De todas maneras, aquí te dejo un ejercicio de respiración para que practiques en casa."
  ),
  
  // --- RESTO DEL DIRECTORIO (12) ---
  Doctor(
    name: 'Lic. Elena Torres', 
    specialty: 'Terapia de Pareja', 
    cardColor: Colors.white, 
    tags: ['pareja', 'familia'],
    welcomeMessage: "Hola. La comunicación es clave en cualquier relación. ¿Te gustaría que trabajemos en herramientas para mejorar la convivencia con tu pareja?"
  ),
  Doctor(
    name: 'Lic. Laura Paez', 
    specialty: 'Psicología Infantil', 
    cardColor: Colors.white, 
    tags: ['infantil', 'familia'],
    welcomeMessage: "Hola, soy especialista en niños y adolescentes. Cuéntame qué comportamiento te preocupa o en qué puedo orientarte hoy."
  ),
  Doctor(
    name: 'Lic. Roberto Gomez', 
    specialty: 'Adicciones y Hábitos', 
    cardColor: Colors.white, 
    tags: ['adicciones', 'ansiedad'],
    welcomeMessage: "Bienvenido. Reconocer que necesitas apoyo es el primer paso. Estoy aquí para acompañarte en el proceso de recuperación de hábitos saludables."
  ),
  Doctor(
    name: 'Dr. Luis Miguel', 
    specialty: 'Trastornos del Sueño', 
    cardColor: Colors.white, 
    tags: ['sueño', 'estres'],
    welcomeMessage: "Hola. Dormir bien es fundamental para la salud mental. Platícame, ¿tienes problemas para conciliar el sueño o te despiertas mucho en la noche?"
  ),
  Doctor(
    name: 'Lic. Thalía Sodi', 
    specialty: 'Autoestima y Desarrollo Personal', 
    cardColor: Colors.white, 
    tags: ['autoestima', 'depresion', 'practico'],
    welcomeMessage: "¡Hola! Trabajar en tu amor propio es la mejor inversión. ¿En qué área de tu vida sientes que necesitas más confianza actualmente?"
  ),
  Doctor(
    name: 'Dra. Carmen Salinas', 
    specialty: 'Gestión del Estrés Laboral', 
    cardColor: Colors.white, 
    tags: ['estres', 'ansiedad'],
    welcomeMessage: "Hola. El estrés laboral puede ser abrumador. Tengo algunas técnicas rápidas que podemos probar para disminuir esa tensión diaria."
  ),
  Doctor(
    name: 'Dr. Carlos Vega', 
    specialty: 'Psiquiatría General', 
    cardColor: Colors.white, 
    tags: ['medico', 'depresion', 'sueño'],
    welcomeMessage: "Saludos. Como psiquiatra, puedo ofrecerte un enfoque médico integral. ¿Estás tomando algún medicamento actualmente o es tu primera consulta?"
  ),
  Doctor(
    name: 'Dra. Ana Polo', 
    specialty: 'Violencia Familiar', 
    cardColor: Colors.white, 
    tags: ['familia', 'pareja'],
    welcomeMessage: "Hola. Quiero que sepas que este es un espacio seguro y confidencial. Estoy aquí para escucharte y brindarte el apoyo que necesitas en casa."
  ),
  Doctor(
    name: 'Lic. Fernando Colunga', 
    specialty: 'Coaching de Vida', 
    cardColor: Colors.white, 
    tags: ['autoestima', 'practico'],
    welcomeMessage: "¡Qué tal! A veces solo necesitamos un empujón para alcanzar nuestras metas. ¿Qué objetivo te gustaría lograr este mes?"
  ),
  Doctor(
    name: 'Dra. Victoria Ruffo', 
    specialty: 'Duelo y Pérdida', 
    cardColor: Colors.white, 
    tags: ['duelo', 'depresion'],
    welcomeMessage: "Hola. Lamento si estás pasando por un momento difícil. El duelo es un proceso personal y estoy aquí para acompañarte a tu propio ritmo."
  ),
  Doctor(
    name: 'Dr. Miguel Ángel Ruiz', 
    specialty: 'Neuropsicología', 
    cardColor: Colors.white, 
    tags: ['medico', 'infantil'],
    welcomeMessage: "Hola. La neuropsicología nos ayuda a entender cómo funciona tu cerebro y emociones. ¿Te gustaría realizar una evaluación cognitiva?"
  ),
  Doctor(
    name: 'Dra. Sofia Mendez', 
    specialty: 'Terapia Cognitivo Conductual', 
    cardColor: Colors.white, 
    tags: ['practico', 'ansiedad'],
    welcomeMessage: "Hola. Mi enfoque es muy práctico y orientado a soluciones. ¿Hay algún pensamiento específico que te esté molestando estos días?"
  ),
];