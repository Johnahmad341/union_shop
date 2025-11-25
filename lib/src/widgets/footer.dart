import 'package:flutter/material.dart';

class UnionFooter extends StatelessWidget {
  const UnionFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5), // Light grey background
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Main footer content with link columns
          LayoutBuilder(builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 600;
            return isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _buildFooterColumns(context),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildFooterColumns(context),
                  );
          }),
          const SizedBox(height: 40),
          const Divider(color: Colors.grey),
          const SizedBox(height: 20),
          // Bottom bar with copyright and social icons
          const Text(
            '© 2024, Union Shop',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFooterColumns(BuildContext context) {
    return [
      _buildFooterColumn(
        context,
        'SHOP',
        [
          _buildFooterLink(context, 'All Products', () {}),
          _buildFooterLink(context, 'Collections', () {}),
          _buildFooterLink(context, 'Sale', () {}),
        ],
      ),
      const SizedBox(height: 20, width: 20),
      _buildFooterColumn(
        context,
        'INFORMATION',
        [
          _buildFooterLink(context, 'About Us', () {
            Navigator.pushNamed(context, '/about');
          }),
          _buildFooterLink(context, 'Contact Us', () {}),
          _buildFooterLink(context, 'FAQs', () {}),
        ],
      ),
    ];
  }

  Widget _buildFooterColumn(
      BuildContext context, String title, List<Widget> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        ...links,
      ],
    );
  }

  Widget _buildFooterLink(
      BuildContext context, String text, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}