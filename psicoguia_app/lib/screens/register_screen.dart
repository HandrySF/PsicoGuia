import 'package:flutter/material.dart';
// import 'main_screen.dart'; // Descomenta para navegar al finalizar

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isObscurePass = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF0D47A1);
    const inputFillColor = Color(0xFFE0E0E0);
    const greyButtonColor = Color(0xFFAAAAAA); // Color para el botón "anterior"

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 1. Título
                const Text(
                  'Crea tu cuenta',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: primaryBlue,
                  ),
                ),
                const SizedBox(height: 10),

                // 2. Subtítulo
                Text(
                  'Comienza tu camino\nal bienestar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 40),

                // 3. Input Nombre
                _buildTextField(
                  hint: 'Nombre completo',
                  icon: Icons.person_outline,
                  fillColor: inputFillColor,
                ),
                const SizedBox(height: 16),

                // 4. Input Correo
                _buildTextField(
                  hint: 'Correo electrónico',
                  icon: Icons.email_outlined,
                  fillColor: inputFillColor,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),

                // 5. Input Contraseña
                TextField(
                  obscureText: _isObscurePass,
                  decoration: _inputDecoration(
                    hint: 'Contraseña',
                    icon: Icons.lock_outline,
                    fillColor: inputFillColor,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscurePass ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey[700]),
                      onPressed: () => setState(() => _isObscurePass = !_isObscurePass),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 6. Input Confirmar Contraseña
                TextField(
                  obscureText: _isObscureConfirm,
                  decoration: _inputDecoration(
                    hint: 'Confirma tu contraseña',
                    icon: Icons.lock_outline,
                    fillColor: inputFillColor,
                    suffixIcon: IconButton(
                      icon: Icon(_isObscureConfirm ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: Colors.grey[700]),
                      onPressed: () => setState(() => _isObscureConfirm = !_isObscureConfirm),
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // 7. Botón Crear Cuenta
                SizedBox(
                  width: double.infinity, // Ocupa un ancho fijo pequeño si prefieres, aquí está expandido
                  child: ElevatedButton(
                    onPressed: () {
                       // Lógica de registro y navegación
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'crear cuenta',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // 8. Botón Anterior
                SizedBox(
                  width: 150, // Un poco más pequeño como en el diseño
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Regresa al Login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: greyButtonColor,
                      foregroundColor: Colors.black87,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'anterior',
                      style: TextStyle(fontSize: 16),
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

  // Helper para construir TextFields normales rápido
  Widget _buildTextField({required String hint, required IconData icon, required Color fillColor, TextInputType? keyboardType}) {
    return TextField(
      keyboardType: keyboardType,
      decoration: _inputDecoration(hint: hint, icon: icon, fillColor: fillColor),
    );
  }

  // Estilo compartido para los inputs
  InputDecoration _inputDecoration({required String hint, required IconData icon, required Color fillColor, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey[600]),
      prefixIcon: Icon(icon, color: Colors.grey[700]),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: fillColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 18),
    );
  }
}