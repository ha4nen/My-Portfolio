import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<String> navItems;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomAppBar({
    super.key,
    required this.navItems,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      title: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFF9D7DFF), Color(0xFFFF6BD6)],
        ).createShader(bounds),
        child: Text(
          'Hanin AbuHasirah',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      centerTitle: false,
      actions: [
        // Desktop navigation
        if (MediaQuery.of(context).size.width > 768)
          Row(
            children: navItems.asMap().entries.map((entry) {
              int index = entry.key;
              String item = entry.value;
              bool isSelected = selectedIndex == index;
              
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextButton(
                  onPressed: () => onItemSelected(index),
                  style: TextButton.styleFrom(
                    foregroundColor: isSelected 
                        ? const Color(0xFFFF6BD6) 
                        : const Color(0xFF6B7280),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: Text(
                    item,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        // Mobile menu button
        if (MediaQuery.of(context).size.width <= 768)
          IconButton(
            icon: Icon(Icons.menu, color: Theme.of(context).colorScheme.onSurface),
            onPressed: () => _showMobileMenu(context),
          ),
        const SizedBox(width: 16),
      ],
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Theme.of(context).cardColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: navItems.asMap().entries.map((entry) {
            int index = entry.key;
            String item = entry.value;
            bool isSelected = selectedIndex == index;
            
            return ListTile(
              title: Text(
                item,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                  color: isSelected ? const Color(0xFFFF6BD6) : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                onItemSelected(index);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

