import 'package:flutter/material.dart';
// import 'admin_dashboard.dart'; // <--- Descomenta esto cuando crees tu dashboard de admin
import 'admin_dashboard_screen.dart';
import 'admin_main_screen.dart';
import 'main_screen.dart'; // Usaremos esto temporalmente para que no de error

class LoginAdministrador extends StatefulWidget {
  const LoginAdministrador({super.key});

  @override
  State<LoginAdministrador> createState() => _LoginAdministradorState();
}

class _LoginAdministradorState extends State<LoginAdministrador> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    // TIP: A veces los admins usan otro color (ej. Rojo oscuro o Gris) para distinguir
    // Pero aquí dejo el mismo azul que pediste.
    const primaryBlue = Color(0xFF0D47A1);
    const inputFillColor = Color(0xFFE0E0E0);

    return Scaffold(
      backgroundColor: Colors.white, // O puedes poner Colors.grey[100] para diferenciarlo un poco
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryBlue),
          onPressed: () {
            Navigator.pop(context); // Esto te regresa al Login de Usuario
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Logo (Igual, pero quizás con un candado extra o igual)
                const Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Icon(
                      Icons.psychology_alt,
                      size: 100,
                      color: primaryBlue,
                    ),
                    // Pequeño distintivo visual de "Admin" (opcional)
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(Icons.admin_panel_settings, color: Colors.orange, size: 30),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                // 2. Título
                const Text(
                  'PsicoGuía AI - Psicólogo',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 10),

                // 3. Subtítulo (Diferente para que se note)
                Text(
                  'Acceso para el profesional de la salud',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 40),

                // 4. Input Correo
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.mail, color: Colors.grey[700]), // Icono diferente
                    filled: true,
                    fillColor: inputFillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
                const SizedBox(height: 20),

                // 5. Input Contraseña
                TextField(
                  obscureText: _isObscure,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    prefixIcon: Icon(Icons.vpn_key, color: Colors.grey[700]), // Icono de llave
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                        color: Colors.grey[700],
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: inputFillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                ),
                const SizedBox(height: 40), // Espacio extra porque no hay botón de "olvidé contraseña"
                TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    'registrarme como profesional',
                    style: TextStyle(
                      color: primaryBlue,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {

                  },
                  child: const Text(
                    'olvidé mi contraseña',
                    style: TextStyle(
                      color: primaryBlue,
                      fontSize: 15,
                    ),
                  ),
                ),
                // 7. Botón Entrar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // AQUÍ IRÍA LA LÓGICA DE ADMIN
                      // Por ahora te mando al MainScreen igual, pero deberías crear un AdminDashboard
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const AdminMainScreen() // <--- ¡AQUÍ ESTÁ LA CLAVE!
                          // NO pongas TherapistDashboardScreen(), porque eso es entrar directo a la "foto".
                        ),
                      );

                      print("Login de Admin ejecutado");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87, // Botón negro para diferenciar admin de usuario
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'iniciar sesión',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // 8. Footer "Volver"

                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Regresa a la pantalla anterior (Login usuarios)
                  },
                  child: const Text(
                    'Volver al acceso de usuarios',
                    style: TextStyle(
                      color: primaryBlue,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}