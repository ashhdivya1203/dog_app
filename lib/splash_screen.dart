import 'package:dog_info_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 6 seconds then navigate — safe with mounted check
    Future.delayed(const Duration(seconds: 4)).then((_) {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      }
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.brown,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Zoom animation only for the image
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 1.0, end: 1.5),
            duration: const Duration(seconds: 4),
            builder: (context, scale, child) {
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: ClipOval(
              child: Image.asset(
                'assets/images/splashh.png', // Ensure correct path
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            'DogInfo App',
            style: GoogleFonts.alike(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              
            ),
          ),
        ],
      ),
    ),
  );
}
}