import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
            'Let\'s Connect',
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
          
          const SizedBox(height: 24),
          
          // Subtitle
          Text(
            'I\'m always open to discussing new opportunities, creative projects, or just having a chat about technology!',
            style: GoogleFonts.inter(
              fontSize: 18,
              color: Colors.white70,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(delay: 300.ms, duration: 800.ms),
          
          const SizedBox(height: 60),
          
          // Contact Cards Grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 3 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: MediaQuery.of(context).size.width > 768 ? 1.3 : 1.5,
              children: [
                _buildContactCard(
                  context: context,
                  icon: Icons.email,
                  title: 'Email',
                  subtitle: 'haneenau4@hotmail.com',
                  onTap: () => _launchEmail('haneenau4@hotmail.com'),
                ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
                
                _buildContactCard(
                  context: context,
                  icon: Icons.phone,
                  title: 'Phone',
                  subtitle: '+966 54 572 9297',
                  onTap: () => _launchPhone('+966545729297'),
                ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
                
                _buildContactCard(
                  context: context,
                  icon: Icons.location_on,
                  title: 'Location',
                  subtitle: 'Riyadh, Saudi Arabia',
                  onTap: null,
                ).animate().fadeIn(delay: 600.ms, duration: 800.ms),
                
                _buildSocialCard(
                  context: context,
                  icon: Icons.work,
                  title: 'LinkedIn',
                  subtitle: 'Connect with me professionally',
                  onTap: () => _launchUrl('http://www.linkedin.com/in/haninabuhasirah'),
                ).animate().fadeIn(delay: 700.ms, duration: 800.ms),
                
                _buildSocialCard(
                  context: context,
                  icon: Icons.code,
                  title: 'GitHub',
                  subtitle: 'Check out my code',
                  onTap: () => _launchUrl('https://github.com/ha4nen'),
                ).animate().fadeIn(delay: 800.ms, duration: 800.ms),
                
                _buildContactCard(
                  context: context,
                  icon: Icons.download,
                  title: 'Resume',
                  subtitle: 'Download my CV',
                  onTap: () => _launchResume(context),
                ).animate().fadeIn(delay: 900.ms, duration: 800.ms),
              ],
            ),
          ),
          
          const SizedBox(height: 60),
          
          // Call to Action
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)]),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: const Color(0xFF9D7DFF).withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10)),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Ready to work together?',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),
                
                const SizedBox(height: 16),
                
                Text(
                  'I\'m actively seeking opportunities in software engineering, mobile development, and AI integration. Let\'s create something amazing together!',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.9),
                    height: 1.6,
                  ),
                  textAlign: TextAlign.center,
                ).animate().fadeIn(delay: 1200.ms, duration: 800.ms),
                
                const SizedBox(height: 24),
                
                ElevatedButton(
                  onPressed: () => _launchEmail('haneenau4@hotmail.com'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFF9D7DFF),
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
                ).animate().fadeIn(delay: 1400.ms, duration: 600.ms),
              ],
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Footer
          Text(
            '© 2024 Hanin AbuHasirah. Built with Flutter & ❤️',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.white60,
            ),
          ).animate().fadeIn(delay: 1600.ms, duration: 600.ms),
        ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1F2440)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8))],
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
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1F2440)),
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 16, offset: const Offset(0, 8))],
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
              title,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: 'subject=Hello from your portfolio!&body=Hi Hanin, I came across your portfolio and would like to connect...',
    );
    
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchPhone(String phone) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _launchResume(BuildContext context) async {
    try {
      // Load the CV file from assets
      final ByteData data = await rootBundle.load('assets/cv/hanin_cv.pdf');
      final Uint8List bytes = data.buffer.asUint8List();
      
      // Create a blob and trigger download
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      
      // Create a download link and trigger it
      html.AnchorElement(href: url)
        ..setAttribute('download', 'Hanin_AbuHasirah_CV.pdf')
        ..click();
      
      // Clean up the URL
      html.Url.revokeObjectUrl(url);
      
      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'CV download started!',
            style: GoogleFonts.inter(),
          ),
          backgroundColor: const Color(0xFFFF6BD6),
        ),
      );
    } catch (e) {
      _showDownloadError(context);
    }
  }

  void _showDownloadError(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(
          'Download Error',
          style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
        content: Text(
          'Unable to download CV. Please try again or contact me directly.',
          style: GoogleFonts.inter(
            color: Colors.white70,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'OK',
              style: GoogleFonts.inter(
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

