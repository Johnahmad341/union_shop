import 'dart:math';
import 'package:flutter/material.dart';

class UnionAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UnionAppBar({super.key});

  @override
  State<UnionAppBar> createState() => _UnionAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(140);
}

class _UnionAppBarState extends State<UnionAppBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
  }

  void _navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search'),
        content: const TextField(
          decoration: InputDecoration(
            hintText: 'Search for products...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  String _randomHeaderText() {
    List<String> headers = [
      "Top quality clothing",
      "Become a true student",
      "Embrace being an Alumni of UoP",
      "Show your UoP pride",
      "The only place for UoP merch",
      "Support your Students' Union"
    ];
    Random random = Random();
    return headers[random.nextInt(headers.length)];
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMobileMenuItem(context, 'Home', '/'),
            _buildMobileMenuItem(context, 'Collections', '/collections'),
            _buildMobileMenuItem(context, 'Sale', '/sale-collection'),
            _buildMobileMenuItem(context, 'About Us', '/about'),
            _buildMobileMenuItem(context, 'All Products', '/all-products'),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(
      BuildContext context, String title, String route) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      onTap: () {
        Navigator.pop(context); // Close the bottom sheet
        if (route == '/') {
          _navigateToHome(context);
        } else {
          _navigateTo(context, route);
        }
      },
    );
  }

  Widget _buildDesktopNavLink(
      BuildContext context, String title, String route) {
    return TextButton(
      onPressed: () {
        if (route == '/') {
          _navigateToHome(context);
        } else {
          _navigateTo(context, route);
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 768;

    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Top banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xFF4d2963),
            child: Text(
              _randomHeaderText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // Main header
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Logo
                GestureDetector(
                  onTap: () => _navigateToHome(context),
                  child: Image.network(
                    'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                    height: 40,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        width: 40,
                        height: 40,
                        child: const Icon(
                          Icons.store,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),

                const Spacer(),

                // Action buttons (always visible)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, size: 22),
                      color: Colors.grey[700],
                      onPressed: () => _showSearchDialog(context),
                      tooltip: 'Search',
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_outline, size: 22),
                      color: Colors.grey[700],
                      onPressed: () => _navigateTo(context, '/auth'),
                      tooltip: 'Account',
                    ),
                    IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined, size: 22),
                      color: Colors.grey[700],
                      onPressed: () {
                        // TODO: Navigate to cart
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Cart feature coming soon!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      tooltip: 'Cart',
                    ),
                    if (!isDesktop)
                      IconButton(
                        icon: const Icon(Icons.menu, size: 22),
                        color: Colors.grey[700],
                        onPressed: () => _showMobileMenu(context),
                        tooltip: 'Menu',
                      ),
                  ],
                ),
              ],
            ),
          ),

          // Desktop navigation links
          if (isDesktop)
            Container(
              height: 48,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDesktopNavLink(context, 'Home', '/'),
                    _buildDesktopNavLink(
                        context, 'Collections', '/collections'),
                    _buildDesktopNavLink(context, 'Sale', '/sale-collection'),
                    _buildDesktopNavLink(context, 'About Us', '/about'),
                    _buildDesktopNavLink(
                        context, 'All Products', '/all-products'),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
