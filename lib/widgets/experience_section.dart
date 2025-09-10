import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

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
            'Experience & Education',
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
          
          // Experience Section
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Professional Experience',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF6BD6),
                  ),
                ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
                
                const SizedBox(height: 30),
                
                // Current Internship
                _buildTimelineItem(
                  context: context,
                  title: 'AI and Software Engineer Intern',
                  company: 'EARTech Information Technology',
                  period: 'Aug 2025 - Sep 2025',
                  description: [
                    'Worked on Azure AI projects, gaining hands-on experience with AI tools and cloud-based services',
                    'Practiced backend development with Laravel, improving knowledge of web frameworks and database handling',
                    'Designed and prototyped user interfaces using Figma, focusing on consistent design systems and user experience',
                  ],
                  isCurrent: false,
                  icon: Icons.work,
                ).animate().fadeIn(delay: 400.ms, duration: 800.ms),
                
                const SizedBox(height: 30),
                
                // Previous Internship
                _buildTimelineItem(
                  context: context,
                  title: 'Accounting and Audit Intern',
                  company: 'RSM Allied Accountants',
                  period: 'May 2021 - Jul 2021',
                  description: [
                    'Assisted in external audits by reviewing client financial documents such as invoices, receipts, vouchers, and trial balances',
                    'Verified financial statements and ledger entries for accuracy and compliance',
                    'Joined client visits to collect, review, and organize documents',
                  ],
                  isCurrent: false,
                  icon: Icons.account_balance,
                ).animate().fadeIn(delay: 500.ms, duration: 800.ms),
                
                const SizedBox(height: 60),
                
                // Education Section
                Text(
                  'Education',
                  style: GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFFFF6BD6),
                  ),
                ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
                
                const SizedBox(height: 30),
                
                // Education
                _buildTimelineItem(
                  context: context,
                  title: 'Bachelor of Software Engineering',
                  company: 'USKUDAR UNIVERSITY',
                  period: '2021 - 2025',
                  description: [
                    'Minor in Computer Engineering',
                    'GPA: 3.88/4.0',
                    'Specialized in full-stack development, mobile apps, and AI integration',
                  ],
                  isCurrent: false,
                  icon: Icons.school,
                  isEducation: true,
                ).animate().fadeIn(delay: 700.ms, duration: 800.ms),
                
                const SizedBox(height: 30),
                
                // Previous Education
                _buildTimelineItem(
                  context: context,
                  title: 'Diploma in Accounting',
                  company: 'AL-IMAM MUHAMMAD IBN SAUD ISLAMIC UNIVERSITY',
                  period: '2020 - 2021',
                  description: [
                    'GPA: 5.0/5.0',
                    'Foundation in financial principles and business practices',
                  ],
                  isCurrent: false,
                  icon: Icons.school,
                  isEducation: true,
                ).animate().fadeIn(delay: 800.ms, duration: 800.ms),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildTimelineItem({
    required BuildContext context,
    required String title,
    required String company,
    required String period,
    required List<String> description,
    required bool isCurrent,
    required IconData icon,
    bool isEducation = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: isCurrent 
                    ? const Color(0xFFFF6BD6) 
                    : isEducation 
                        ? const Color(0xFF6B7280) 
                        : const Color(0xFF6B7280),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: (isCurrent 
                        ? const Color(0xFFFF6BD6) 
                        : isEducation 
                            ? const Color(0xFF6B7280) 
                            : const Color(0xFF6B7280)).withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
            if (isCurrent)
              Container(
                width: 2,
                height: 40,
                color: const Color(0xFF6366F1).withOpacity(0.3),
              ),
          ],
        ),
        
        const SizedBox(width: 24),
        
        // Content
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(24),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Current badge
                if (isCurrent)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFF6BD6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Current',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                
                if (isCurrent) const SizedBox(height: 12),
                
                // Title
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                
                const SizedBox(height: 4),
                
                // Company
                Text(
                  company,
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isEducation ? const Color(0xFFFF6BD6) : const Color(0xFFFF6BD6),
                  ),
                ),
                
                const SizedBox(height: 4),
                
                // Period
                Text(
                  period,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                
                const SizedBox(height: 16),
                
                // Description
                ...description.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.only(top: 8, right: 12),
                        decoration: BoxDecoration(
                          color: isEducation ? const Color(0xFFFF6BD6) : const Color(0xFFFF6BD6),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: Colors.white70,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                )).toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

