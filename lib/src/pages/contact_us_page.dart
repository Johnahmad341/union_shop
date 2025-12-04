import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:union_shop/src/widgets/app_bar.dart';
import 'package:union_shop/src/widgets/footer.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UnionAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4d2963), Color(0xFF6b3d82)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.contact_support,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'CONTACT US',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'We\'re here to help! Get in touch with the Union Shop team',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.9),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Contact Information Grid
            Container(
              padding: const EdgeInsets.all(40),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  bool isWide = constraints.maxWidth > 900;
                  int crossAxisCount =
                      isWide ? 3 : (constraints.maxWidth > 600 ? 2 : 1);

                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 30,
                    childAspectRatio: 1.2,
                    children: [
                      _buildContactCard(
                        icon: Icons.location_on,
                        iconColor: const Color(0xFF4d2963),
                        title: 'Visit Us',
                        details: [
                          'University of Portsmouth',
                          'Students\' Union Shop',
                          'Cambridge Road',
                          'Portsmouth, PO1 2EF',
                          'United Kingdom',
                        ],
                      ),
                      _buildContactCard(
                        icon: Icons.phone,
                        iconColor: Colors.green,
                        title: 'Call Us',
                        details: [
                          'General Enquiries:',
                          '+44 (0)23 9284 3000',
                          '',
                          'Shop Direct:',
                          '+44 (0)23 9284 3155',
                        ],
                      ),
                      _buildContactCard(
                        icon: Icons.email,
                        iconColor: Colors.blue,
                        title: 'Email Us',
                        details: [
                          'General Enquiries:',
                          'shop@unionportsmouth.org',
                          '',
                          'Orders & Support:',
                          'orders@unionportsmouth.org',
                        ],
                      ),
                      _buildContactCard(
                        icon: Icons.access_time,
                        iconColor: Colors.orange,
                        title: 'Opening Hours',
                        details: [
                          'Monday - Friday:',
                          '9:00 AM - 5:00 PM',
                          '',
                          'Saturday:',
                          '10:00 AM - 4:00 PM',
                          '',
                          'Sunday & Bank Holidays:',
                          'Closed',
                        ],
                      ),
                      _buildContactCard(
                        icon: FontAwesomeIcons.bus,
                        iconColor: Colors.teal,
                        title: 'Getting Here',
                        details: [
                          'Bus Routes: 1, 3, 6, 23',
                          'Nearest Train Station:',
                          'Portsmouth & Southsea',
                          '(10 min walk)',
                          '',
                          'Parking available nearby',
                        ],
                      ),
                      _buildSocialMediaCard(),
                    ],
                  );
                },
              ),
            ),

            // Map Placeholder Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              height: 400,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'University of Portsmouth Students\' Union',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Cambridge Road, Portsmouth, PO1 2EF',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // In a real app, this would open maps
                      },
                      icon: const Icon(Icons.directions, size: 18),
                      label: const Text('Get Directions'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4d2963),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Additional Info Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(40),
              color: const Color(0xFFF5F5F5),
              child: Column(
                children: [
                  const Text(
                    'Need Help?',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: const Text(
                      'Our friendly team is here to assist you with any questions about our products, orders, or services. Whether you\'re looking for University of Portsmouth merchandise, need help with an order, or want to know more about our collections, don\'t hesitate to reach out!',
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            const UnionFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required List<String> details,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...details.map((detail) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  detail,
                  style: TextStyle(
                    fontSize: 13,
                    color: detail.endsWith(':')
                        ? Colors.black87
                        : Colors.grey[700],
                    fontWeight: detail.endsWith(':')
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSocialMediaCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.share,
              size: 40,
              color: Colors.purple,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Follow Us',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildSocialIcon(
                  FontAwesomeIcons.facebook, const Color(0xFF1877F2)),
              _buildSocialIcon(
                  FontAwesomeIcons.instagram, const Color(0xFFE4405F)),
              _buildSocialIcon(
                  FontAwesomeIcons.twitter, const Color(0xFF1DA1F2)),
              _buildSocialIcon(FontAwesomeIcons.tiktok, Colors.black),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            '@UoPUnionShop',
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FaIcon(
          icon,
          size: 20,
          color: color,
        ),
      ),
    );
  }
}
