import 'package:flutter/material.dart';

class AdminChatbotScreen extends StatefulWidget {
  const AdminChatbotScreen({super.key});

  @override
  State<AdminChatbotScreen> createState() => _AdminChatbotScreenState();
}

class _AdminChatbotScreenState extends State<AdminChatbotScreen> {
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = []; // Lista para guardar el historial

  // Colores
  final Color primaryBlue = const Color(0xFF0D47A1);
  final Color aiBubbleColor = const Color(0xFFF5F5F5);
  final Color userBubbleColor = const Color(0xFFE3F2FD);

  @override
  void initState() {
    super.initState();
    // Mensaje de bienvenida automático
    Future.delayed(const Duration(milliseconds: 500), () {
      _addMessage(
        ChatMessage(
          text: "Hola Dr. Ruiz. Soy su Asistente de Analítica. Puedo generar reportes sobre tendencias de ansiedad, progreso de pacientes o adherencia al tratamiento. ¿Qué desea consultar hoy?",
          isUser: false,
        ),
      );
    });
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;
    _textController.clear();

    // 1. Agregar mensaje del usuario
    _addMessage(ChatMessage(text: text, isUser: true));

    // 2. Simular "pensando" y respuesta de la IA
    Future.delayed(const Duration(seconds: 1, milliseconds: 500), () {
      _generateAIResponse(text.toLowerCase());
    });
  }

  void _generateAIResponse(String input) {
    String responseText = "";
    Widget? chartWidget;

    // LÓGICA SIMULADA (KEYWORDS)
    if (input.contains("ansiedad") || input.contains("depresion") || input.contains("tendencia")) {
      responseText = "He analizado los datos de sus 25 pacientes activos. Se observa un pico de ansiedad los lunes, con una reducción gradual hacia el fin de semana.";
      chartWidget = const SimulatedBarChart(); // <--- Aquí insertamos el gráfico
    } else if (input.contains("resumen") || input.contains("reporte") || input.contains("progreso")) {
      responseText = "Generando reporte de adherencia... El 78% de sus pacientes ha completado sus tareas esta semana. Aquí tiene el desglose visual:";
      chartWidget = const SimulatedPieChart(); // <--- Otro tipo de gráfico
    } else {
      responseText = "Entendido. Para mostrarle datos visuales, intente preguntarme sobre 'niveles de ansiedad' o pida un 'reporte de progreso'.";
    }

    _addMessage(ChatMessage(text: responseText, isUser: false, chart: chartWidget));
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.add(message);
    });
    // Hacer scroll automático al final
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Icon(Icons.auto_awesome, color: primaryBlue),
            const SizedBox(width: 10),
            Text(
              "PsicoGuía AI",
              style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // ÁREA DE CHAT
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return _buildMessageBubble(msg);
              },
            ),
          ),
          // ÁREA DE INPUT
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5, offset: const Offset(0, -2))],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: "Pregunta sobre tendencias o datos...",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: primaryBlue,
                  radius: 22,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white, size: 20),
                    onPressed: () => _handleSubmitted(_textController.text),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // DISEÑO DE LA BURBUJA DE CHAT
  Widget _buildMessageBubble(ChatMessage msg) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: msg.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!msg.isUser) ...[
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.psychology, color: primaryBlue),
            ),
            const SizedBox(width: 10),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: msg.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: msg.isUser ? userBubbleColor : aiBubbleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: msg.isUser ? const Radius.circular(16) : Radius.zero,
                      bottomRight: msg.isUser ? Radius.zero : const Radius.circular(16),
                    ),
                  ),
                  child: Text(
                    msg.text,
                    style: const TextStyle(fontSize: 15, height: 1.4, color: Colors.black87),
                  ),
                ),
                // SI HAY GRÁFICO, LO MOSTRAMOS DEBAJO
                if (msg.chart != null) ...[
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)],
                    ),
                    child: msg.chart,
                  ),
                ]
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// MODELO DE DATOS SIMPLE
class ChatMessage {
  final String text;
  final bool isUser;
  final Widget? chart;

  ChatMessage({required this.text, required this.isUser, this.chart});
}

// --- WIDGETS DE GRÁFICOS SIMULADOS (SIN LIBRERÍAS EXTERNAS) ---

class SimulatedBarChart extends StatelessWidget {
  const SimulatedBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Niveles de Ansiedad (Semana Actual)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _bar("Lun", 80, Colors.redAccent),
            _bar("Mar", 60, Colors.orangeAccent),
            _bar("Mié", 40, Colors.amber),
            _bar("Jue", 50, Colors.orange),
            _bar("Vie", 30, Colors.green),
          ],
        ),
      ],
    );
  }

  Widget _bar(String label, double height, Color color) {
    return Column(
      children: [
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}

class SimulatedPieChart extends StatelessWidget {
  const SimulatedPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: CircularProgressIndicator(
            value: 0.78,
            strokeWidth: 12,
            backgroundColor: Colors.grey[200],
            valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF0D47A1)),
          ),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("78% Completado", style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
            SizedBox(height: 4),
            Text("Tareas asignadas", style: TextStyle(fontSize: 12)),
            SizedBox(height: 4),
            Text("22% Pendiente", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 12)),
          ],
        )
      ],
    );
  }
}