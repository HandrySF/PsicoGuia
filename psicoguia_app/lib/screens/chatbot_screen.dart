import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  
  // Lista de mensajes iniciales (Tal cual tu imagen)
  final List<Map<String, dynamic>> _messages = [
    {
      "isUser": false,
      "text": "¡Hola! Soy tu asistente virtual. Estoy aquí para ayudarte a registrar tus emociones o responder tus dudas."
    },
    {
      "isUser": true,
      "text": "Hoy me he sentido ansioso en el trabajo."
    },
    {
      "isUser": false,
      "text": "Entiendo. La ansiedad laboral es algo común. ¿Quieres explorar técnicas de respiración?"
    },
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add({
          "isUser": true,
          "text": _controller.text,
        });
        // Aquí después conectarás la lógica para que el bot responda
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      // Header personalizado como en la imagen
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1, // Sombra ligera
        title: const Text(
          'Asistente virtual',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w900, // Letra gruesa
            fontSize: 24,
          ),
        ),
        centerTitle: false, // Alineado a la izquierda
        automaticallyImplyLeading: false, // Sin flecha atrás (es pestaña principal)
      ),
      body: Column(
        children: [
          // ÁREA DE CHAT
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildMessageBubble(msg["text"], msg["isUser"]);
              },
            ),
          ),

          // INPUT DE TEXTO
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Colors.grey.shade200)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Escribe un mensaje...",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                      filled: true,
                      fillColor: const Color(0xFFE0E0E0), // Gris claro de fondo
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: _sendMessage,
                  child: const CircleAvatar(
                    backgroundColor: primaryBlue,
                    radius: 24,
                    child: Icon(Icons.arrow_upward, color: Colors.white, size: 28),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Widget para dibujar las burbujas de chat
  Widget _buildMessageBubble(String text, bool isUser) {
    const primaryBlue = Color(0xFF0D47A1);
    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? primaryBlue : const Color(0xFFE0E0E0), // Azul o Gris
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            // Efecto "burbuja de cómic": la esquina inferior del lado del origen es cuadrada
            bottomLeft: isUser ? const Radius.circular(16) : Radius.zero,
            bottomRight: isUser ? Radius.zero : const Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}