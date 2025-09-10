import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onContactPressed;
  final VoidCallback? onProjectsPressed;
  
  const HeroSection({super.key, this.onContactPressed, this.onProjectsPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF050814), Color(0xFF0B0F1A)],
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Removed profile image per request; decorative cosmic ring
              SizedBox(
                width: 200,
                height: 200,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const SweepGradient(
                          colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6), Color(0xFF9D7DFF)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF9D7DFF).withOpacity(0.25),
                            blurRadius: 30,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF050814),
                          border: Border.all(color: Color(0xFF1F2440), width: 2),
                        ),
                      ),
                    )
                  ],
                ),
              ).animate().fadeIn(duration: 600.ms),
              
              const SizedBox(height: 40),
              
              // Name
              Text(
                'Hanin AbuHasirah',
                style: GoogleFonts.inter(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 200.ms, duration: 800.ms),
              
              const SizedBox(height: 16),
              
              // Title
              Text(
                'Software Engineer',
                style: GoogleFonts.inter(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFFF6BD6),
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
              
              const SizedBox(height: 24),
              
              // Description
              Text(
                'Recent graduate with a passion for full-stack development,\n'
                'mobile apps, and AI integration. Ready to bring fresh\n'
                'perspective and technical skills to your team.',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  color: Colors.white70,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 600.ms, duration: 800.ms),
              
              const SizedBox(height: 40),
              
              // CTA Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: onContactPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Get In Touch',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton(
                    onPressed: onProjectsPressed,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFFF6BD6),
                      side: const BorderSide(color: Color(0xFFFF6BD6)),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'View Projects',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ).animate().fadeIn(delay: 800.ms, duration: 800.ms),
              
              const SizedBox(height: 60),
              
              // Scroll indicator
              Column(
                children: [
                  Text(
                    'Scroll to explore',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: const Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF9CA3AF),
                    size: 24,
                  ),
                ],
              ).animate().fadeIn(delay: 1000.ms, duration: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}

