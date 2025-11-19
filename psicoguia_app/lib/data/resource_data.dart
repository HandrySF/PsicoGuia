import 'package:flutter/material.dart';

// --- Modelos de Datos ---

class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String amazonUrl; // Link directo a Amazon

  Book({required this.title, required this.author, required this.imageUrl, required this.amazonUrl});
}

class QuickRead {
  final String title;
  final String content; // El contenido completo de la lectura
  final String imageUrl; // Imagen para la miniatura
  final String author; // O fuente del artículo

  QuickRead({required this.title, required this.content, required this.imageUrl, required this.author});
}

class TranscendentalResource {
  final String title;
  final String description;
  final IconData icon; // Icono representativo
  final String linkUrl; // Un link a un video, app, meditación guiada, etc.
  final String buttonText;

  TranscendentalResource({required this.title, required this.description, required this.icon, required this.linkUrl, required this.buttonText});
}

class ResourceTopic {
  final String title;
  final IconData icon; // Ícono para el título del tema (corazón, engranaje, cerebro)
  final String iconLabel; // Etiqueta del ícono (Manejo, Técnicas, Entendiendo)
  final Color iconColor; // Color del ícono
  final List<Book> books;
  final List<QuickRead> quickReads;
  final TranscendentalResource transcendentalResource;

  ResourceTopic({
    required this.title,
    required this.icon,
    required this.iconLabel,
    required this.iconColor,
    required this.books,
    required this.quickReads,
    required this.transcendentalResource,
  });
}

// --- DATOS DE EJEMPLO (5 TEMAS) ---

// --- Libros ---
final List<Book> anxietyBooks = [
  Book(title: 'DESHACER LA ANSIEDAD', author: 'JUDSON BREWER', imageUrl: 'https://m.media-amazon.com/images/I/41e-J+qK5PL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/Deshacer-ansiedad-Eliminar-h%C3%A1bitos-cerebro/dp/B0B5P218L6/'),
  Book(title: 'SIN ANSIEDAD', author: 'Israel Cantu Chavez Diaz', imageUrl: 'https://m.media-amazon.com/images/I/41P-QJ1g1VL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/ANSIEDAD-TERAPIA-COGNITIVO-CONDUCTUAL-Tratamiento/dp/B0BG88X66V/'),
  Book(title: 'El poder del ahora', author: 'Eckhart Tolle', imageUrl: 'https://m.media-amazon.com/images/I/41OQ0n3TlrL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/poder-del-ahora-Eckhart-Tolle/dp/B002K21B84/'),
];

final List<Book> relaxationBooks = [
  Book(title: 'Técnicas de relajación diaria', author: 'Matthew McKay', imageUrl: 'https://m.media-amazon.com/images/I/41q1u0pYyML._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/T%C3%A9cnicas-relajaci%C3%B3n-diaria-reducir-estr%C3%A9s/dp/B085F6B917/'),
  Book(title: 'El pequeño libro de la serenidad', author: 'David Brothwell', imageUrl: 'https://m.media-amazon.com/images/I/41-q0fL9rJL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/El-peque%C3%B1o-libro-serenidad-Brothwell/dp/B00R4QW08S/'),
  Book(title: 'Mindfulness para principiantes', author: 'Jon Kabat-Zinn', imageUrl: 'https://m.media-amazon.com/images/I/411Qd1H-kRL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/Mindfulness-para-principiantes-Kabat-Zinn-Jon/dp/B0068D2K4S/'),
];

final List<Book> depressionBooks = [
  Book(title: 'ADIÓS, DEPRESIÓN', author: 'ENRIQUE ROJAS', imageUrl: 'https://m.media-amazon.com/images/I/41qC+5Hk9wL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/ADI%C3%93S-DEPRESI%C3%93N-Rojas-Enrique-ebook/dp/B0BFDPYQ92/'),
  Book(title: 'Depresión y Ansiedad', author: 'John Roberts', imageUrl: 'https://m.media-amazon.com/images/I/41-T4sT9lUL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/Depresi%C3%B3n-Ansiedad-C%C3%B3mo-combatirlas-controlarlas/dp/B09JYS3Y9P/'),
  Book(title: 'Sentirse bien', author: 'David D. Burns', imageUrl: 'https://m.media-amazon.com/images/I/41rB+bB-NqL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/Sentirse-bien-nueva-terapia-cognitiva/dp/B00S9Y2K9U/'),
];

final List<Book> focusBooks = [
  Book(title: 'Hábitos Atómicos', author: 'James Clear', imageUrl: 'https://m.media-amazon.com/images/I/41bJ72eA3QL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/H%C3%A1bitos-at%C3%B3micos-manera-f%C3%A1cil-comprobada/dp/B0B5P218L6/'),
  Book(title: 'El poder de los hábitos', author: 'Charles Duhigg', imageUrl: 'https://m.media-amazon.com/images/I/41m9-J6oVKL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/El-poder-los-h%C3%A1bitos-transformar/dp/B073X3Q55R/'),
  Book(title: 'Concentración profunda', author: 'Cal Newport', imageUrl: 'https://m.media-amazon.com/images/I/41zXm4zQpGL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/Concentraci%C3%B3n-profunda-trabajar-enfocado-mundo/dp/B0B6L5Z5Z5/'),
];

final List<Book> selfCareBooks = [
  Book(title: 'El arte de no amargarse la vida', author: 'Rafael Santandreu', imageUrl: 'https://m.media-amazon.com/images/I/4102w1Hk7gL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/El-arte-amargarse-vida-Santandreu/dp/B00DSX6KPM/'),
  Book(title: 'Tu segunda vida empieza cuando descubres que solo tienes una', author: 'Raphaëlle Giordano', imageUrl: 'https://m.media-amazon.com/images/I/41xS01eE8tL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/segunda-vida-empieza-cuando-descubres/dp/B01N2L9Q2G/'),
  Book(title: 'Las 5 heridas que impiden ser uno mismo', author: 'Lise Bourbeau', imageUrl: 'https://m.media-amazon.com/images/I/41f0iP1Z5TL._SY445_SX342_QL70_ML2_.jpg', amazonUrl: 'https://www.amazon.com.mx/Las-heridas-impiden-mismo-colecci%C3%B3n/dp/B07L5P1V8W/'),
];


// --- Lecturas Rápidas ---
final List<QuickRead> anxietyReads = [
  QuickRead(title: 'Respiración Profunda para la Ansiedad', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/foto-gratis/vista-lateral-mujer-meditando-aire-libre_23-2148782079.jpg', content: 'La respiración diafragmática ayuda a calmar el sistema nervioso. Inhala lentamente por la nariz contando hasta 4, sostén el aire 4 segundos y exhala lentamente por la boca contando hasta 6. Repite 5-10 veces. Concéntrate en cómo tu abdomen se eleva y baja.'),
  QuickRead(title: 'Mini-meditación para momentos de pánico', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/foto-gratis/vista-posterior-mujer-mirando-despertador_23-2148911520.jpg', content: 'Cuando sientas pánico, busca un objeto a tu alrededor. Obsérvalo detenidamente por 60 segundos. Nota sus colores, texturas, formas, sombras. Esto ayuda a anclarte en el presente y romper el ciclo de pensamientos ansiosos.'),
  QuickRead(title: 'Rutinas matutinas contra el estrés', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/foto-gratis/vista-posterior-mujer-mirando-despertador_23-2148911520.jpg', content: 'Comienza el día con 5 minutos de estiramientos suaves o una taza de té tranquilo. Evita revisar el teléfono apenas despiertes. Pequeños hábitos hacen una gran diferencia en cómo manejas el estrés del día.'),
];

final List<QuickRead> relaxationReads = [
  QuickRead(title: 'Música para Relajación Profunda', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/earphones-white-table_23-2148386419.jpg', content: 'Escuchar música tranquila sin letra, como la clásica o instrumental, puede disminuir el ritmo cardíaco y relajar la mente. Crea una playlist de 30 minutos para escuchar antes de dormir o durante un descanso.'),
  QuickRead(title: 'Baño Caliente con Aromaterapia', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/foto-gratis/bombas-bano-sal-mar_23-2147775583.jpg', content: 'Un baño caliente ayuda a relajar los músculos tensos. Añade unas gotas de aceite esencial de lavanda o manzanilla al agua para potenciar el efecto calmante y mejorar la calidad del sueño.'),
  QuickRead(title: 'Ejercicios de Estiramiento Suave', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/mujer-estirandose-colchoneta-ejercicios-casa_23-2148817730.jpg', content: 'Dedica 10 minutos al día a estirar suavemente tu cuello, hombros y espalda. La tensión muscular es una respuesta común al estrés y estirar puede liberarla, mejorando tu bienestar físico y mental.'),
];

final List<QuickRead> depressionReads = [
  QuickRead(title: 'Activa tu Cuerpo y Mente', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/foto-gratis/mujer-joven-atleta-corriendo-parque_23-2149187129.jpg', content: 'Realizar actividad física, aunque sean 15 minutos de caminata, libera endorfinas y mejora el ánimo. No tiene que ser intenso, solo muévete. La constancia es más importante que la intensidad.'),
  QuickRead(title: 'Establece Metas Pequeñas y Realistas', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/mujer-joven-trabajando-casa_23-2149021966.jpg', content: 'Cuando te sientas abrumado, divide tus tareas en pasos muy pequeños. Celebrar cada pequeño logro te dará la motivación para continuar. "Hoy ordenaré un cajón" es una gran meta.'),
  QuickRead(title: 'Busca Conexión Social', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/foto-gratis/amigos-sonrientes-abrazandose-parque_23-2148817719.jpg', content: 'Aunque a veces no tengas ganas, el contacto con amigos o familiares puede ser muy beneficioso. No necesitas hablar de tus problemas, a veces solo estar presente con alguien ayuda mucho.'),
];

final List<QuickRead> focusReads = [
  QuickRead(title: 'Técnica Pomodoro', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/persona-usando-temporizador-trabajo_23-2149303350.jpg', content: 'Trabaja por bloques de 25 minutos de alta concentración, seguidos de 5 minutos de descanso. Después de 4 bloques, toma un descanso más largo (15-30 minutos). Esto mejora la productividad y evita el agotamiento.'),
  QuickRead(title: 'Ambiente de Trabajo Despejado', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/mesa-limpia-ordenada-oficina_23-2149310619.jpg', content: 'Un espacio de trabajo ordenado reduce las distracciones visuales y mentales. Dedica unos minutos al final del día a limpiar tu escritorio para empezar la mañana siguiente con claridad.'),
  QuickRead(title: 'Una Tarea a la Vez', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/persona-escribiendo-portatil-mientras-trabaja_23-2149200424.jpg', content: 'Evita la multitarea. Concéntrate en completar una sola tarea antes de pasar a la siguiente. Esto mejora la calidad de tu trabajo y reduce el tiempo que tardas en completarlo.'),
];

final List<QuickRead> selfCareReads = [
  QuickRead(title: 'Diario de Gratitud', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/mujer-escribiendo-diario_23-2148782077.jpg', content: 'Cada noche, anota 3 cosas por las que te sientas agradecido. No tienen que ser grandes. Esto entrena tu cerebro para enfocarse en lo positivo y mejora tu bienestar emocional.'),
  QuickRead(title: 'Tiempo para ti sin culpas', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/mujer-leyendo-libro-cama_23-2148817725.jpg', content: 'Dedica al menos 30 minutos al día a una actividad que disfrutes sin sentir culpa. Puede ser leer, escuchar música, pintar, o simplemente no hacer nada. Es tu tiempo y es válido.'),
  QuickRead(title: 'Establece Límites Digitales', author: 'PsicoGuía AI', imageUrl: 'https://img.freepik.com/free-photo/persona-mirando-telefono-inteligente_23-2149187127.jpg', content: 'Define horarios para revisar redes sociales y correos. Desconéctate por completo un par de horas antes de dormir. Esto mejora la calidad de tu descanso y reduce la sobrecarga de información.'),
];


// --- Recursos Transcendentales ---
final TranscendentalResource anxietyResource = TranscendentalResource(
  title: 'Meditación Guiada para Calmar la Ansiedad',
  description: 'Un audio de 10 minutos para centrarte y reducir la tensión.',
  icon: Icons.headphones,
  linkUrl: 'https://www.youtube.com/watch?v=jspKqG4w_u8', // Ejemplo YouTube
  buttonText: 'Escuchar ahora'
);

final TranscendentalResource relaxationResource = TranscendentalResource(
  title: 'App de Mindfulness "Calm"',
  description: 'Explora meditaciones, historias para dormir y música relajante.',
  icon: Icons.mobile_friendly,
  linkUrl: 'https://www.calm.com/',
  buttonText: 'Descargar app'
);

final TranscendentalResource depressionResource = TranscendentalResource(
  title: 'Ejercicios de Activación Conductual',
  description: 'Una guía para reintroducir actividades placenteras en tu rutina.',
  icon: Icons.checklist,
  linkUrl: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Link de ejemplo, reemplaza
  buttonText: 'Ver guía'
);

final TranscendentalResource focusResource = TranscendentalResource(
  title: 'Técnicas de Pomodoro y Bloqueo de Tiempo',
  description: 'Video explicativo para mejorar tu concentración y productividad.',
  icon: Icons.timer,
  linkUrl: 'https://www.youtube.com/watch?v=H74B0z0S4c4', // Link de ejemplo
  buttonText: 'Ver tutorial'
);

final TranscendentalResource selfCareResource = TranscendentalResource(
  title: 'Kit de Autocuidado Diario',
  description: 'Ideas y checklist para integrar el autocuidado en tu vida.',
  icon: Icons.spa,
  linkUrl: 'https://www.youtube.com/watch?v=kYtJ0m5zSio', // Link de ejemplo
  buttonText: 'Descargar kit'
);


// --- Lista Principal de TEMAS DE RECURSOS ---
final List<ResourceTopic> allResourceTopics = [
  ResourceTopic(
    title: 'Manejo de la ansiedad',
    icon: Icons.favorite, // Corazón
    iconLabel: 'Manejo',
    iconColor: Colors.redAccent,
    books: anxietyBooks,
    quickReads: anxietyReads,
    transcendentalResource: anxietyResource,
  ),
  ResourceTopic(
    title: 'Técnicas de relajación',
    icon: Icons.settings, // Engranaje
    iconLabel: 'Técnicas',
    iconColor: Colors.blueAccent,
    books: relaxationBooks,
    quickReads: relaxationReads,
    transcendentalResource: relaxationResource,
  ),
  ResourceTopic(
    title: 'Entendiendo la depresión',
    icon: Icons.lightbulb, // Cerebro/Foco
    iconLabel: 'Entendiendo',
    iconColor: Colors.purpleAccent,
    books: depressionBooks,
    quickReads: depressionReads,
    transcendentalResource: depressionResource,
  ),
  ResourceTopic(
    title: 'Mejora tu concentración y enfoque',
    icon: Icons.psychology, // Psicología
    iconLabel: 'Enfoque',
    iconColor: Colors.orangeAccent,
    books: focusBooks,
    quickReads: focusReads,
    transcendentalResource: focusResource,
  ),
  ResourceTopic(
    title: 'Autocuidado y bienestar',
    icon: Icons.spa, // Spa
    iconLabel: 'Autocuidado',
    iconColor: Colors.greenAccent,
    books: selfCareBooks,
    quickReads: selfCareReads,
    transcendentalResource: selfCareResource,
  ),
];