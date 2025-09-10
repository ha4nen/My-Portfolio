import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../screens/project_details_screen.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  String selectedFilter = 'All';
  
  final List<String> filters = ['All', 'Website', 'Mobile App', 'Design', 'Games'];
  
  final List<Map<String, dynamic>> projects = [
    {
      'title': 'Cross-Platform Projects with .NET MAUI',
      'description': 'Developed multiple cross-platform projects using .NET MAUI (XAML and C#). Focused on responsive UI, MVVM, and native integrations.',
      'technologies': ['.NET MAUI', 'XAML', 'C#'],
      'isFeatured': true,
      'category': 'Mobile App',
    },
    {
      'title': 'Bank Mobile Application Interface',
      'description': 'Designed a simple, user-centered interface for a bank mobile application based on needs analysis and UX best practices.',
      'technologies': ['Figma', '.NET MAUI'],
      'isFeatured': false,
      'category': 'Design',
    },
    {
      'title': 'Outfitly – AI-Powered Wardrobe & Outfit Planner',
      'description': 'Outfitly is a smart mobile application that helps users digitize their wardrobe, plan outfits, and receive AI-powered style recommendations. By uploading and categorizing clothing items, users can build a virtual closet that suggests outfit combinations tailored to the weather, occasion, and personal style preferences. The app also includes a calendar-based outfit planner for scheduling looks in advance, and a social feed where users can share outfits and get inspired by others.\n\nTo support these features, I developed a Flutter frontend, a Django REST backend, and integrated TensorFlow Lite for on-device outfit recommendation. The project followed a structured Software Requirements Specification (SRS) and was validated through functionality, usability, and performance testing to ensure a reliable and user-friendly experience.',
      'technologies': ['Flutter', 'Django REST Framework', 'TensorFlow Lite', 'PostgreSQL', 'AI/ML'],
      'isFeatured': true,
      'category': 'Mobile App',
      'githubUrl': 'https://github.com/ha4nen/Outfitly_flutter',
      'backendUrl': 'https://github.com/ha4nen/Outfitly_Django',
      'coverImage': 'assets/Outfitly/30.png',
      'localImages': [
        'assets/Outfitly/1.png',
        'assets/Outfitly/2.png',
        'assets/Outfitly/3.png',
        'assets/Outfitly/4.png',
        'assets/Outfitly/5.png',
        'assets/Outfitly/6.png',
        'assets/Outfitly/7.png',
        'assets/Outfitly/8.png',
        'assets/Outfitly/9.png',
        'assets/Outfitly/10.png',
        'assets/Outfitly/11.png',
        'assets/Outfitly/12.png',
        'assets/Outfitly/13.png',
        'assets/Outfitly/14.png',
        'assets/Outfitly/15.png',
        'assets/Outfitly/16.png',
        'assets/Outfitly/17.png',
        'assets/Outfitly/18.png',
        'assets/Outfitly/19.png',
        'assets/Outfitly/20.png',
        'assets/Outfitly/21.png',
        'assets/Outfitly/22.png',
        'assets/Outfitly/23.png',
        'assets/Outfitly/24.png',
        'assets/Outfitly/25.png',
        'assets/Outfitly/26.png',
        'assets/Outfitly/27.png',
        'assets/Outfitly/28.png',
        'assets/Outfitly/29.png',
      ],
    },
    {
      'title': 'ClubConnect - University Platform',
      'description': '3-user website (Student, Club Manager, Admin) using Django, HTML, and SQLite. Includes authentication, event and club management, plus admin approval workflows.',
      'technologies': ['Django', 'HTML', 'SQLite', 'Authentication'],
      'isFeatured': true,
      'category': 'Website',
    },
    {
      'title': 'NutriTrack - Social Media App for Nutritionists',
        'description': 'NutriTrack is a social media web application built to bring together nutritionists and health professionals in one platform. It allows users to share insights, tips, and experiences, post about nutrition topics, interact with others through likes and comments, and build professional connections with features like following, personalized feeds, profile pages, and user search with smart suggestions. The main purpose of the app is to create an engaging community where experts can connect, learn, and inspire each other around health and wellness.\n\nThe project also included structured validation and testing to ensure a smooth and reliable experience. Functionality, usability, and performance were tested thoroughly, with automation handled using Selenium and performance evaluation done through JMeter, ensuring the platform\'s reliability and efficiency.',
      'technologies': ['Django', 'HTML', 'CSS', 'Bootstrap', 'Selenium', 'JMeter'],
      'isFeatured': false,
      'category': 'Website',
      'githubUrl': 'https://github.com/ha4nen/NutriTrack-Social-Media',
      'coverImage': 'assets/NutriTrack/Screenshot 2024-01-08 170350.png',
      'localImages': [
        'assets/NutriTrack/Screenshot 2024-01-08 165029.png',
        'assets/NutriTrack/Screenshot 2024-01-08 165121.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170350.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170418.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170522.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170544.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170603.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170626.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170658.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170731.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170807.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170822.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170833.png',
        'assets/NutriTrack/Screenshot 2024-01-08 170910.png',
        'assets/NutriTrack/Screenshot 2024-01-08 171127.png',
        'assets/NutriTrack/Screenshot 2024-01-09 144322.png',
      ],
    },
    {
      'title': 'Hotel Management System',
      'description': 'Relational MySQL database with ERD/EERD diagrams, triggers, joins, data integrity constraints, and complex SQL queries to manage hotels, guests, rooms, reservations, and payments.',
      'technologies': ['MySQL', 'Database Design', 'SQL', 'ERD'],
      'isFeatured': false,
      'category': 'Design',
    },
    {
      'title': 'Unity 3D Horror Game',
      'description': '3D horror game in C# where players navigate a dark forest and haunted houses, collecting pickups while avoiding a pursuing enemy. Features enemy AI with NavMesh and immersive effects.',
      'technologies': ['Unity', 'C#', 'Game Development', 'AI'],
      'isFeatured': false,
      'category': 'Games',
    },
    {
      'title': 'Instagram Clone – Social Media Mobile App',
      'description': 'Instagram Clone is a mobile application designed to replicate the core features of Instagram, allowing users to share images, connect with others, and engage in a social environment. The app enables users to sign up, log in, upload posts, like and comment on others\' content, and explore a dynamic feed that updates in real time.\n\nThe project focused on creating an interactive and user-friendly experience with personalized profiles, authentication for secure access, and smooth image handling through cloud storage. It provided me the opportunity to work with modern cross-platform tools and real-time databases to deliver a responsive and scalable social media app.',
      'technologies': ['Flutter', 'Firebase Authentication', 'Firebase Firestore', 'Firebase Storage', 'Provider'],
      'isFeatured': false,
      'category': 'Mobile App',
      'githubUrl': 'https://github.com/ha4nen/instagram-flutter',
      'coverImage': 'assets/Instagram/1.png',
      'localImages': [
        'assets/Instagram/1.png',
        'assets/Instagram/2.png',
        'assets/Instagram/3.png',
        'assets/Instagram/4.png',
        'assets/Instagram/5.png',
        'assets/Instagram/6.png',
        'assets/Instagram/7.png',
        'assets/Instagram/8.png',
        'assets/Instagram/9.png',
        'assets/Instagram/10.png',
        'assets/Instagram/11.png',
        'assets/Instagram/12.png',
        'assets/Instagram/13.png',
      ],
    },
    {
      'title': 'Guessing Game',
      'description': 'Developed a console-based guessing game using C++ where players guess numbers or letters with varying difficulty levels. Implemented feedback for guesses, high-score tracking, and a menu-driven interface.',
      'technologies': ['C++', 'Console Application', 'Game Development'],
      'isFeatured': false,
      'category': 'Games',
    },
  ];
  
  List<Map<String, dynamic>> get filteredProjects {
    if (selectedFilter == 'All') {
      return projects;
    }
    return projects.where((project) => project['category'] == selectedFilter).toList();
  }

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
            'Featured Projects',
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
          
          // Filter Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: filters.map((filter) {
                bool isSelected = selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: FilterChip(
                    label: Text(
                      filter,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.white70,
                      ),
                    ),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    backgroundColor: const Color(0xFF1F2440),
                    selectedColor: const Color(0xFFFF6BD6),
                    checkmarkColor: Colors.white,
                    side: BorderSide(
                      color: isSelected ? const Color(0xFFFF6BD6) : const Color(0xFF1F2440),
                    ),
                  ),
                );
              }).toList(),
            ),
          ).animate().fadeIn(delay: 300.ms, duration: 600.ms),
          
          const SizedBox(height: 40),
          
          // Projects Grid
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child:             GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 768 ? 2 : 1,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: MediaQuery.of(context).size.width > 768 ? 1 : 0.85,
              children: filteredProjects.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> project = entry.value;
                return _buildProjectCard(
                  context: context,
                  title: project['title'],
                  description: project['description'],
                  technologies: List<String>.from(project['technologies']),
                  isFeatured: project['isFeatured'],
                  githubUrl: project['githubUrl'],
                  backendUrl: project['backendUrl'],
                  coverImage: project['coverImage'],
                  localImages: List<String>.from(project['localImages'] ?? []),
                ).animate().fadeIn(delay: (400 + index * 100).ms, duration: 800.ms);
              }).toList(),
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildProjectCard({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> technologies,
    required bool isFeatured,
    String? githubUrl,
    String? backendUrl,
    String? coverImage,
    List<String> localImages = const [],
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 8)),
        ],
        border: isFeatured 
            ? Border.all(color: const Color(0xFF9D7DFF), width: 2)
            : null,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Featured badge
            if (isFeatured)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF9D7DFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  'Featured',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            
            if (isFeatured) const SizedBox(height: 12),
            
            // Project icon (small, top-left)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.code,
                color: Colors.white,
                size: 20,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Title
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            
            const SizedBox(height: 8),
            
            // Description
            Flexible(
              child: Text(
                description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            
            const SizedBox(height: 12),
            
            // Technologies
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: technologies.map((tech) => Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF9D7DFF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  tech,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF9D7DFF),
                  ),
                ),
              )).toList(),
            ),
            
            const SizedBox(height: 12),
            
            // Cover image between text and button
            if (coverImage != null)
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    coverImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)]),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.code,
                          color: Colors.white,
                          size: 24,
                        ),
                      );
                    },
                  ),
                ),
              ),
            
            if (coverImage != null) const SizedBox(height: 12),
            
            // Action buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ProjectDetailsScreen(
                            title: title,
                            description: description,
                            technologies: technologies,
                            imageUrls: const [],
                            localImagePaths: localImages,
                            githubUrl: githubUrl,
                            backendUrl: backendUrl,
                            visitUrl: null,
                          ),
                        ),
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFFFF6BD6),
                      side: const BorderSide(color: Color(0xFFFF6BD6)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View Details',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

