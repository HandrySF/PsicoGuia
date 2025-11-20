import 'package:flutter/material.dart';

class AdminResourcesLibrary extends StatefulWidget {
  const AdminResourcesLibrary({super.key});

  @override
  State<AdminResourcesLibrary> createState() => _AdminResourcesLibraryState();
}

class _AdminResourcesLibraryState extends State<AdminResourcesLibrary> {
  final Color primaryBlue = const Color(0xFF0D47A1);

  // 1. DATA DE PACIENTES (Para el selector)
  final List<Map<String, String>> patients = [
    {
      "name": "Mauricio Romero",
      "initials": "MR",
      "status": "Paciente Activo",
    },
    {
      "name": "Handry Serrano",
      "initials": "HS",
      "status": "Evaluación Inicial",
    },
    {
      "name": "Abraham Carrasco",
      "initials": "AC",
      "status": "Control de Estrés",
    },
  ];

  // Estado para el filtro de categorías
  String _selectedCategory = "Todos";
  final List<String> _categories = ["Todos", "Artículos", "Videos", "Audio", "Guías PDF"];

  // Base de datos simulada de recursos
  final List<Map<String, dynamic>> _allResources = [
    {
      "title": "Higiene del Sueño",
      "type": "Artículos",
      "duration": "Lectura: 5 min",
      "icon": Icons.article_outlined,
      "color": Colors.blue,
    },
    {
      "title": "Respiración Diafragmática",
      "type": "Videos",
      "duration": "Video: 12 min",
      "icon": Icons.play_circle_outline,
      "color": Colors.red,
    },
    {
      "title": "Meditación Guiada: Ansiedad",
      "type": "Audio",
      "duration": "Audio: 20 min",
      "icon": Icons.headphones_outlined,
      "color": Colors.purple,
    },
    {
      "title": "Manual TCC para Pacientes",
      "type": "Guías PDF",
      "duration": "PDF: 15 págs",
      "icon": Icons.picture_as_pdf_outlined,
      "color": Colors.orange,
    },
    {
      "title": "Entendiendo el Pánico",
      "type": "Videos",
      "duration": "Video: 8 min",
      "icon": Icons.play_circle_outline,
      "color": Colors.red,
    },
    {
      "title": "Nutrición y Salud Mental",
      "type": "Artículos",
      "duration": "Lectura: 7 min",
      "icon": Icons.article_outlined,
      "color": Colors.blue,
    },
  ];

  List<Map<String, dynamic>> get _filteredResources {
    if (_selectedCategory == "Todos") {
      return _allResources;
    }
    return _allResources.where((r) => r['type'] == _selectedCategory).toList();
  }

  // --- NUEVA LÓGICA: SELECTOR DE PACIENTE ---
  void _showShareModal(BuildContext context, String resourceTitle) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          height: 350,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título del Modal
              Text(
                "Recomendar Recurso",
                style: TextStyle(color: primaryBlue, fontSize: 18, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 5),
              Text(
                "Vas a enviar: $resourceTitle",
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Divider(height: 30),
              Text(
                "SELECCIONA UN PACIENTE",
                style: TextStyle(color: Colors.grey[400], fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1),
              ),
              const SizedBox(height: 10),

              // Lista de Pacientes
              Expanded(
                child: ListView.builder(
                  itemCount: patients.length,
                  itemBuilder: (context, index) {
                    final p = patients[index];
                    return ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: primaryBlue.withOpacity(0.1),
                        child: Text(
                          p['initials']!,
                          style: TextStyle(color: primaryBlue, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(p['status']!, style: const TextStyle(fontSize: 12)),
                      trailing: Icon(Icons.send, color: Colors.grey[400], size: 20),
                      onTap: () {
                        // 1. Cerrar el modal
                        Navigator.pop(context);
                        // 2. Mostrar confirmación
                        _showConfirmation(resourceTitle, p['name']!);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showConfirmation(String resource, String patientName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle_outline, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    const TextSpan(text: "Enviado a "),
                    TextSpan(text: patientName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green[700],
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Biblioteca Clínica',
          style: TextStyle(
            color: primaryBlue,
            fontWeight: FontWeight.w900,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: primaryBlue, size: 28),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Función para subir nuevo material")),
              );
            },
          )
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Buscar tema, autor o título...",
                hintStyle: TextStyle(color: Colors.grey[400]),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFFF5F7FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),

          // Filtros
          SizedBox(
            height: 50,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final isSelected = _selectedCategory == category;
                return ChoiceChip(
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (selected) {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  selectedColor: primaryBlue,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey[700],
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(
                      color: isSelected ? primaryBlue : Colors.grey.shade300,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // Lista de Recursos
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: _filteredResources.length,
              itemBuilder: (context, index) {
                final resource = _filteredResources[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    border: Border.all(color: Colors.grey.shade100),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: resource['color'].withOpacity(0.1),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                        ),
                        child: Icon(
                          resource['icon'],
                          color: resource['color'],
                          size: 32,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                resource['type'].toUpperCase(),
                                style: TextStyle(
                                  color: resource['color'],
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                resource['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 12, color: Colors.grey[600]),
                                  const SizedBox(width: 4),
                                  Text(
                                    resource['duration'],
                                    style: TextStyle(color: Colors.grey[600], fontSize: 11),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      // BOTÓN DE COMPARTIR ACTUALIZADO
                      IconButton(
                        onPressed: () => _showShareModal(context, resource['title']), // <--- Llama al selector
                        icon: Icon(Icons.share_outlined, color: Colors.grey[400]),
                        tooltip: "Recomendar al paciente",
                      ),
                      const SizedBox(width: 5),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}