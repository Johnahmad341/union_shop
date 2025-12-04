import 'dart:math';
import 'package:flutter/material.dart';

class UnionAppBar extends StatefulWidget implements PreferredSizeWidget {
  const UnionAppBar({super.key});

  @override
  State<UnionAppBar> createState() => _UnionAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(150);
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
    final TextEditingController searchController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Search Products'),
        content: TextField(
          controller: searchController,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search by product name or category...',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
          onSubmitted: (query) {
            if (query.isNotEmpty) {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                '/search',
                arguments: query,
              );
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final query = searchController.text.trim();
              if (query.isNotEmpty) {
                Navigator.pop(context);
                Navigator.pushNamed(
                  context,
                  '/search',
                  arguments: query,
                );
              }
            },
            child: const Text('Search'),
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
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 16 : 8),
            child: Row(
              children: [
                // Logo
                GestureDetector(
                  onTap: () => _navigateToHome(context),
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: isDesktop ? 200 : 168,
                      maxWidth: isDesktop ? 200 : 168,
                    ),
                    child: Image.network(
                      'https://shop.upsu.net/cdn/shop/files/upsu_300x300.png?v=1614735854',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: Icon(
                            Icons.store,
                            color: Colors.grey,
                            size: isDesktop ? 120 : 96,
                          ),
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          width: isDesktop ? 200 : 168,
                          height: isDesktop ? 200 : 168,
                          child: const Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const Spacer(),

                // Action buttons (always visible)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.search, size: isDesktop ? 22 : 20),
                      color: Colors.grey[700],
                      onPressed: () => _showSearchDialog(context),
                      tooltip: 'Search',
                      padding: EdgeInsets.all(isDesktop ? 8 : 4),
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      icon:
                          Icon(Icons.person_outline, size: isDesktop ? 22 : 20),
                      color: Colors.grey[700],
                      onPressed: () => _navigateTo(context, '/auth'),
                      tooltip: 'Account',
                      padding: EdgeInsets.all(isDesktop ? 8 : 4),
                      constraints: const BoxConstraints(),
                    ),
                    IconButton(
                      icon: Icon(Icons.shopping_bag_outlined,
                          size: isDesktop ? 22 : 20),
                      color: Colors.grey[700],
                      onPressed: () => _navigateTo(context, '/cart'),
                      tooltip: 'Cart',
                      padding: EdgeInsets.all(isDesktop ? 8 : 4),
                      constraints: const BoxConstraints(),
                    ),
                    if (!isDesktop)
                      IconButton(
                        icon: const Icon(Icons.menu, size: 20),
                        color: Colors.grey[700],
                        onPressed: () => _showMobileMenu(context),
                        tooltip: 'Menu',
                        padding: const EdgeInsets.all(4),
                        constraints: const BoxConstraints(),
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
