import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'login_administrador.dart';
import 'main_screen.dart'; // <--- AGREGA ESTO
// import 'dashboard_screen.dart'; // Descomenta cuando tengas el dashboard listo

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true; // Controla si se ve la contraseña

  @override
  Widget build(BuildContext context) {
    // Color azul extraído de tu diseño
    const primaryBlue = Color(0xFF0D47A1);
    // Color gris de fondo de los inputs
    const inputFillColor = Color(0xFFE0E0E0);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Logo (Cabeza con engranaje)
                GestureDetector(
                  onTap: () {
                    // Navegar al Login de Administrador
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // Asegúrate de que la clase dentro de tu archivo se llame 'LoginAdministrador'
                        builder: (context) => const LoginAdministrador(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.psychology_alt,
                    size: 100,
                    color: primaryBlue, // Usando la variable que definiste arriba
                  ),
                ),
                const SizedBox(height: 10),

                // 2. Título
                const Text(
                  'PsicoGuía AI',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900, // Extra negrita
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 10),

                // 3. Subtítulo
                Text(
                  'Bienvenido de vuelta',
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
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey[700]),
                    filled: true,
                    fillColor: inputFillColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none, // Sin borde visible
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
                    prefixIcon: Icon(Icons.lock_outline, color: Colors.grey[700]),
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
                const SizedBox(height: 15),

                // 6. Olvidé mi contraseña
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'olvidé mi contraseña',
                    style: TextStyle(color: Colors.grey[800], fontSize: 14),
                  ),
                ),
                const SizedBox(height: 20),

                // 7. Botón Iniciar Sesión
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navegar al Dashboard (MainScreen)
                      Navigator.pushReplacement( 
                        context, MaterialPageRoute(builder: (_) => const MainScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
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

                // 8. Footer Registro
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿no tienes cuenta? ',
                      style: TextStyle(color: Colors.grey[800], fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navegar a Registro
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterScreen()),
                        );
                      },
                      child: const Text(
                        'regístrate',
                        style: TextStyle(
                          color: primaryBlue,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}