import 'package:flutter/material.dart';

class AdminPatientChat extends StatefulWidget {
  const AdminPatientChat({super.key});

  @override
  State<AdminPatientChat> createState() => _AdminPatientChatState();
}

class _AdminPatientChatState extends State<AdminPatientChat> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  // DATA SIMULADA DE LOS CHATS
  final List<Map<String, dynamic>> _chats = [
    {
      "name": "Mauricio Romero",
      "message": "Hola Dr., ya completé el quiz que me envió.",
      "time": "10:30 AM",
      "unread": 2,
      "isOnline": true,
      "initials": "MR",
      "color": Colors.blue,
    },
    {
      "name": "Handry Serrano",
      "message": "¿Podríamos reagendar la cita del martes?",
      "time": "Ayer",
      "unread": 0,
      "isOnline": false,
      "initials": "HS",
      "color": Colors.purple,
    },
    {
      "name": "Abraham Carrasco",
      "message": "Me siento mucho mejor esta semana. Gracias.",
      "time": "Lun",
      "unread": 0,
      "isOnline": true,
      "initials": "AC",
      "color": Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Mensajes',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[700]),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[700]),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: _chats.length,
        separatorBuilder: (ctx, i) => const Divider(height: 1, indent: 80),
        itemBuilder: (context, index) {
          final chat = _chats[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            // AVATAR CON ESTADO
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: chat['color'].withOpacity(0.1),
                  child: Text(
                    chat['initials'],
                    style: TextStyle(
                      color: chat['color'],
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (chat['isOnline'])
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            // INFO DEL CHAT
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  chat['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  chat['time'],
                  style: TextStyle(
                    color: chat['unread'] > 0 ? primaryBlue : Colors.grey,
                    fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      chat['message'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: chat['unread'] > 0 ? Colors.black87 : Colors.grey[600],
                        fontWeight: chat['unread'] > 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                  if (chat['unread'] > 0)
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: primaryBlue,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        chat['unread'].toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                ],
              ),
            ),
            onTap: () {
              // NAVEGAR A LA PANTALLA DE DETALLE
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatDetailScreen(
                    userName: chat['name'],
                    initials: chat['initials'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// ==========================================
// PANTALLA DE DETALLE (LA CONVERSACIÓN REAL)
// ==========================================

class ChatDetailScreen extends StatefulWidget {
  final String userName;
  final String initials;

  const ChatDetailScreen({super.key, required this.userName, required this.initials});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _msgController = TextEditingController();
  final Color primaryBlue = const Color(0xFF0D47A1);

  // Mensajes iniciales simulados
  final List<Map<String, dynamic>> _messages = [
    {"text": "Hola Mauricio, ¿cómo te has sentido con el ejercicio?", "isMe": true, "time": "10:00 AM"},
    {"text": "Hola Dr., un poco mejor, aunque ayer tuve un episodio leve.", "isMe": false, "time": "10:15 AM"},
    {"text": "Entiendo. Es normal en esta etapa. ¿Hiciste la respiración?", "isMe": true, "time": "10:16 AM"},
    {"text": "Sí, me ayudó bastante a calmarme.", "isMe": false, "time": "10:20 AM"},
    {"text": "Hola Dr., ya completé el quiz que me envió.", "isMe": false, "time": "10:30 AM"},
  ];

  void _sendMessage() {
    if (_msgController.text.isEmpty) return;
    setState(() {
      _messages.add({
        "text": _msgController.text,
        "isMe": true,
        "time": "Ahora",
      });
      _msgController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA), // Fondo gris muy suave
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: primaryBlue,
              child: Text(widget.initials, style: const TextStyle(fontSize: 14, color: Colors.white)),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.userName, style: const TextStyle(color: Colors.black87, fontSize: 16, fontWeight: FontWeight.bold)),
                const Text("En línea", style: TextStyle(color: Colors.green, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.videocam_outlined, color: Colors.blue), onPressed: () {}),
          IconButton(icon: const Icon(Icons.call_outlined, color: Colors.blue), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // LISTA DE MENSAJES
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                final isMe = msg['isMe'];
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    decoration: BoxDecoration(
                      color: isMe ? primaryBlue : Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(16),
                        topRight: const Radius.circular(16),
                        bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
                        bottomRight: isMe ? Radius.zero : const Radius.circular(16),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 5, offset: const Offset(0, 2)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          msg['text'],
                          style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 15),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          msg['time'],
                          style: TextStyle(color: isMe ? Colors.white70 : Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // INPUT DE TEXTO
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(icon: const Icon(Icons.add, color: Colors.grey), onPressed: () {}),
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    decoration: InputDecoration(
                      hintText: "Escribe un mensaje...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: const Color(0xFFF5F7FA),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: primaryBlue,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 18),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}