import 'package:flutter/material.dart';
import '../data/doctor_data.dart';

class ChatDetailScreen extends StatefulWidget {
  final Doctor doctor;

  const ChatDetailScreen({super.key, required this.doctor});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _controller = TextEditingController();
  // Lista de mensajes (Simulada)
  late List<Map<String, dynamic>> messages;

  @override
  void initState() {
    super.initState();
    // Inicializamos el chat con el mensaje de bienvenida del doctor
    messages = [
      {
        "isUser": false,
        "text": widget.doctor.welcomeMessage,
      },
      // Ejemplo de "Quiz asignado" como en tu imagen (solo para Handry para demo)
      if(widget.doctor.name.contains("Handry")) ...[
         {"isUser": true, "text": "Hola Licenciado, estoy bien. Lo veo el siguiente viernes."},
         {"isUser": false, "text": "¡Claro que sí! De aquí al viernes puedes mandarme mensaje si tienes dudas."},
         {"isUser": false, "type": "quiz_card"}, // Tipo especial para la tarjeta de quiz
      ]
    ];
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({"isUser": true, "text": _controller.text});
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Text(
              widget.doctor.name, // Nombre del doctor dinámico
              style: const TextStyle(
                color: primaryBlue, 
                fontWeight: FontWeight.bold, 
                fontSize: 18
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            CircleAvatar(
              backgroundImage: const AssetImage('assets/doctor_placeholder.png'),
              backgroundColor: Colors.grey[200],
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // ÁREA DE MENSAJES
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                
                // Si es una tarjeta especial de Quiz (como en tu imagen)
                if (msg["type"] == "quiz_card") {
                  return _buildQuizCard();
                }

                // Si es mensaje de texto normal
                return _buildMessageBubble(msg["text"], msg["isUser"]);
              },
            ),
          ),

          // INPUT DE TEXTO
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendMessage,
                  child: const CircleAvatar(
                    backgroundColor: primaryBlue,
                    radius: 24,
                    child: Icon(Icons.arrow_upward, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isUser) {
    const primaryBlue = Color(0xFF0D47A1);
    
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? primaryBlue : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
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

  Widget _buildQuizCard() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(12),
        width: 220,
        decoration: BoxDecoration(
          color: Colors.grey[300], // Fondo grisáceo como imagen
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Quiz diario",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    "Da clic para acceder al quiz de hoy",
                    style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.open_in_new, size: 28, color: Colors.black)
          ],
        ),
      ),
    );
  }
}