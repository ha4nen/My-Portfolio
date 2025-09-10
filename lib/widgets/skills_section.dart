import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF050814), Color(0xFF0B0F1A)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
        child: Column(
        children: [
          // Section Title
          Text(
            'Skills & Expertise',
            style: GoogleFonts.inter(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ).animate().fadeIn(duration: 600.ms),
          
          const SizedBox(height: 16),
          
          Container(
            width: 80,
            height: 4,
            decoration: BoxDecoration(
              color: const Color(0xFFFF6BD6),
              borderRadius: BorderRadius.circular(2),
            ),
          ).animate().scaleX(duration: 600.ms, delay: 200.ms),
          
          const SizedBox(height: 60),
          
          // Skills Grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Programming Languages
                _buildSkillCategory(
                  context: context,
                  title: 'Programming Languages',
                  skills: [
                    _buildSkill(context, 'Python (Django)', 1.0, Icons.code),
                    _buildSkill(context, 'Dart (Flutter)', 0.9, Icons.phone_android),
                    _buildSkill(context, 'PHP (Laravel)', 0.7, Icons.web),
                    _buildSkill(context, 'C++ / C#', 0.8, Icons.computer),
                    _buildSkill(context, 'Java', 0.7, Icons.coffee),
                  ],
                ).animate().fadeIn(delay: 300.ms, duration: 800.ms),
                
                const SizedBox(height: 40),
                
                // Technologies & Tools
                _buildSkillCategory(
                  context: context,
                  title: 'Technologies & Tools',
                  skills: [
                    _buildSkill(context, 'Microsoft Azure', 0.8, Icons.cloud),
                    _buildSkill(context, 'Unity', 0.8, Icons.games),
                    _buildSkill(context, 'Figma', 0.9, Icons.design_services),
                    _buildSkill(context, 'MySQL', 0.8, Icons.storage),
                    _buildSkill(context, '.NET MAUI', 0.85, Icons.devices),
                    _buildSkill(context, 'Wix', 1.0, Icons.web_asset),
                  ],
                ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
                
                const SizedBox(height: 40),
                
                // Removed Soft Skills per request
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory({
    required BuildContext context,
    required String title,
    required List<Widget> skills,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            double itemWidth;
            
            if (screenWidth > 1200) {
              itemWidth = (screenWidth - 100) / 6 - 16;
            } else if (screenWidth > 900) {
              itemWidth = (screenWidth - 100) / 4 - 16;
            } else if (screenWidth > 700) {
              itemWidth = (screenWidth - 100) / 3 - 16;
            } else if (screenWidth > 500) {
              itemWidth = (screenWidth - 100) / 2 - 16;
            } else {
              itemWidth = (screenWidth - 100) / 1 - 16;
            }
            
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: skills.map((skill) => SizedBox(
                width: itemWidth,
                child: skill,
              )).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSkill(BuildContext context, String name, double proficiency, IconData icon) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1F2440)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: const Color(0xFFFF6BD6),
            size: 32,
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Container(
            height: 6,
            decoration: BoxDecoration(
              color: const Color(0xFF1F2440),
              borderRadius: BorderRadius.circular(3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: proficiency,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${(proficiency * 100).round()}%',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

