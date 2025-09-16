import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:video_player/video_player.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final List<String> imageUrls;
  final List<String> localImagePaths;
  final String? githubUrl;
  final String? backendUrl;
  final String? visitUrl;
  final String? videoDemo;

  const ProjectDetailsScreen({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    this.imageUrls = const [],
    this.localImagePaths = const [],
    this.githubUrl,
    this.backendUrl,
    this.visitUrl,
    this.videoDemo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
          ).createShader(bounds),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF050814), Color(0xFF0B0F1A)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1400),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Project Header
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFF1F2440)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ).animate().fadeIn(duration: 600.ms),
                      
                      const SizedBox(height: 16),
                      
                      // Description
                      Text(
                        description,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          height: 1.6,
                          color: Colors.white70,
                        ),
                      ).animate().fadeIn(delay: 200.ms, duration: 600.ms),
                      
                      const SizedBox(height: 24),
                      
                      // Technologies
                      Text(
                        'Technologies Used',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFF6BD6),
                        ),
                      ).animate().fadeIn(delay: 400.ms, duration: 600.ms),
                      
                      const SizedBox(height: 12),
                      
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: technologies
                            .map((tech) => Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color(0xFF9D7DFF).withOpacity(0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    tech,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ).animate().fadeIn(delay: 600.ms, duration: 600.ms),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Video Demo Section
                if (videoDemo != null) ...[
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF1F2440)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.play_circle_outline,
                              color: const Color(0xFFFF6BD6),
                              size: 28,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Demo Video',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        GestureDetector(
                          onTap: () {
                            // Show video player dialog
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height * 0.7,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(color: const Color(0xFF1F2440)),
                                    ),
                                    child: Column(
                                      children: [
                                        // Header
                                        Container(
                                          padding: const EdgeInsets.all(16),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(color: Color(0xFF1F2440)),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.play_circle_filled,
                                                color: const Color(0xFFFF6BD6),
                                                size: 24,
                                              ),
                                              const SizedBox(width: 12),
                                              Expanded(
                                                child: Text(
                                                  'Game Demo Video',
                                                  style: GoogleFonts.inter(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Theme.of(context).colorScheme.onSurface,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () => Navigator.of(context).pop(),
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.white70,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        // Video Player
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: _VideoPlayerWidget(videoPath: videoDemo!),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                              color: const Color(0xFF0B0F1A),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xFF1F2440)),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.play_circle_filled,
                                    color: const Color(0xFFFF6BD6),
                                    size: 64,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'Click to Play Demo Video',
                                    style: GoogleFonts.inter(
                                      fontSize: 16,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Watch gameplay showcase',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      color: Colors.white54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),
                  const SizedBox(height: 32),
                ],

                // Project Gallery Section
                if (imageUrls.isNotEmpty || localImagePaths.isNotEmpty) ...[
                  Text(
                    'Project Gallery',
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ).animate().fadeIn(delay: 800.ms, duration: 600.ms),
                  
                  const SizedBox(height: 20),
                  
                  // Image Gallery
                  SizedBox(
                    height: 300,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        final allImages = [...imageUrls, ...localImagePaths];
                        final imagePath = allImages[index];
                        final isLocal = index >= imageUrls.length;
                        
                        return GestureDetector(
                          onTap: () => _showImageDialog(context, imagePath, isLocal),
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.3),
                                  blurRadius: 20,
                                  offset: const Offset(0, 8),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Stack(
                                children: [
                                  isLocal
                                      ? Image.asset(
                                          imagePath,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[800],
                                              child: const Center(
                                                child: Icon(Icons.image_not_supported, color: Colors.white70, size: 50),
                                              ),
                                            );
                                          },
                                        )
                                      : Image.network(
                                          imagePath,
                                          fit: BoxFit.cover,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[800],
                                              child: const Center(
                                                child: Icon(Icons.image_not_supported, color: Colors.white70, size: 50),
                                              ),
                                            );
                                          },
                                        ),
                                  // Overlay with zoom icon
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.6),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: const Icon(
                                        Icons.zoom_in,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => const SizedBox(width: 20),
                      itemCount: imageUrls.length + localImagePaths.length,
                    ),
                  ).animate().fadeIn(delay: 1000.ms, duration: 600.ms),
                  
                  const SizedBox(height: 32),
                ],

                // Action Buttons
                Row(
                  children: [
                    if (githubUrl != null) ...[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF9D7DFF).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(githubUrl!),
                            icon: const Icon(Icons.code, color: Colors.white),
                            label: Text(
                              backendUrl != null ? 'Flutter Frontend' : 'View on GitHub',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (backendUrl != null || visitUrl != null) const SizedBox(width: 16),
                    ],
                    if (backendUrl != null) ...[
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF9D7DFF).withOpacity(0.3),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () => _launchUrl(backendUrl!),
                            icon: const Icon(Icons.storage, color: Colors.white),
                            label: Text(
                              'Django Backend',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (visitUrl != null) const SizedBox(width: 16),
                    ],
                    if (visitUrl != null)
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _launchUrl(visitUrl!),
                          icon: const Icon(Icons.open_in_new),
                          label: Text(
                            'Visit Website',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFFF6BD6),
                            side: const BorderSide(color: Color(0xFFFF6BD6), width: 2),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                  ],
                ).animate().fadeIn(delay: 1200.ms, duration: 600.ms),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  void _showImageDialog(BuildContext context, String imagePath, bool isLocal) {
    final allImages = [...imageUrls, ...localImagePaths];
    final currentIndex = allImages.indexOf(imagePath);
    
    showDialog(
      context: context,
      builder: (context) => _ImageDialog(
        images: allImages,
        initialIndex: currentIndex,
        imageUrls: imageUrls,
      ),
    );
  }

  Widget _buildDemoFeature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: Colors.white70,
          fontSize: 14,
        ),
      ),
    );
  }
}

class _VideoPlayerWidget extends StatefulWidget {
  final String videoPath;

  const _VideoPlayerWidget({required this.videoPath});

  @override
  State<_VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<_VideoPlayerWidget> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  void _initializeVideo() async {
    try {
      _controller = VideoPlayerController.asset(widget.videoPath);
      await _controller!.initialize();
      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1F2440)),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                color: const Color(0xFFFF6B6B),
                size: 64,
              ),
              const SizedBox(height: 16),
              Text(
                'Video not found',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please add the demo video file to assets/videos/',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _initializeVideo,
                icon: const Icon(Icons.refresh),
                label: const Text('Retry'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6BD6),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    if (!_isInitialized || _controller == null) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F1A),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF1F2440)),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFF6BD6)),
              ),
              SizedBox(height: 16),
              Text(
                'Loading video...',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF1F2440)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: Stack(
            children: [
              VideoPlayer(_controller!),
              Center(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller!.value.isPlaying) {
                        _controller!.pause();
                      } else {
                        _controller!.play();
                      }
                    });
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Icon(
                      _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
              ),
              // Video controls
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black54,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_controller!.value.isPlaying) {
                              _controller!.pause();
                            } else {
                              _controller!.play();
                            }
                          });
                        },
                        child: Icon(
                          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: VideoProgressIndicator(
                          _controller!,
                          allowScrubbing: true,
                          colors: VideoProgressColors(
                            playedColor: const Color(0xFFFF6BD6),
                            backgroundColor: Colors.white24,
                            bufferedColor: Colors.white54,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '${_formatDuration(_controller!.value.position)} / ${_formatDuration(_controller!.value.duration)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }
}

class _ImageDialog extends StatefulWidget {
  final List<String> images;
  final int initialIndex;
  final List<String> imageUrls;

  const _ImageDialog({
    required this.images,
    required this.initialIndex,
    required this.imageUrls,
  });

  @override
  State<_ImageDialog> createState() => _ImageDialogState();
}

class _ImageDialogState extends State<_ImageDialog> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.95,
          maxHeight: MediaQuery.of(context).size.height * 0.95,
        ),
        child: Stack(
          children: [
            // Image carousel
            PageView.builder(
              controller: _pageController,
              itemCount: widget.images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final currentImagePath = widget.images[index];
                final currentIsLocal = index >= widget.imageUrls.length;
                
                return Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: currentIsLocal
                        ? Image.asset(
                            currentImagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: const Center(
                                  child: Icon(Icons.image_not_supported, color: Colors.white70, size: 100),
                                ),
                              );
                            },
                          )
                        : Image.network(
                            currentImagePath,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[800],
                                child: const Center(
                                  child: Icon(Icons.image_not_supported, color: Colors.white70, size: 100),
                                ),
                              );
                            },
                          ),
                  ),
                );
              },
            ),
            
            // Close button
            Positioned(
              top: 20,
              right: 20,
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
            
            // Image counter
            if (widget.images.length > 1)
              Positioned(
                top: 20,
                left: 20,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    '${_currentIndex + 1} / ${widget.images.length}',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            
            // Navigation arrows
            if (widget.images.length > 1) ...[
              // Left arrow
              Positioned(
                left: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: _currentIndex > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.chevron_left,
                        color: _currentIndex > 0 ? Colors.white : Colors.white54,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              
              // Right arrow
              Positioned(
                right: 20,
                top: 0,
                bottom: 0,
                child: Center(
                  child: IconButton(
                    onPressed: _currentIndex < widget.images.length - 1
                        ? () {
                            _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    icon: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.chevron_right,
                        color: _currentIndex < widget.images.length - 1 ? Colors.white : Colors.white54,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}


