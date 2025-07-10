import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/theme.dart';
import 'home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de imagen
          SizedBox.expand(
            child: Image.asset(
              'assets/Car.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Capa de color con los colores del tema
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FordTheme.fordBlue.withOpacity(0.8),
                  FordTheme.lapisBlue.withOpacity(0.8),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Contenido
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(),

                // Logo y subtítulo
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'CarGo',
                      style: GoogleFonts.montserrat(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: FordTheme.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'YOUR BEST TRAVEL',
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        letterSpacing: 1.5,
                        color: FordTheme.white,
                      ),
                    ),
                  ],
                ),

                // Botón blanco
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: FordTheme.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          'Get Started',
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: FordTheme.fordBlue,
                          ),
                        ),
                      ),
                    ),
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
