import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:egy_tour/core/utils/styles.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('About Us', style: Styles.textStyle800),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            // ignore: deprecated_member_use
            child: Container(color: Colors.white.withOpacity(0.3)),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildCard(
                  title: 'Our Mission',
                  icon: Icons.flag,
                  description:
                      'To promote tourism in Egypt by offering an all-in-one digital platform for booking trips, events, accommodations, and transportation tailored to all types of tourists.',
                ),
                _buildCard(
                  title: 'Key Features',
                  icon: Icons.star_rate,
                  description: '''
• Categorized tourism: historical, religious, natural, and more.
• Book hotels, flights, and tours.
• Stay updated with events and news.
• Secure identity verification.
• Smart search for places and offers.''',
                ),
                _buildCard(
                  title: 'Who We Are',
                  icon: Icons.people,
                  description:
                      'We are passionate CS students developing innovative tourism solutions for our graduation project, enhancing travel in Egypt.',
                ),
                _buildCard(
                  title: 'Contact Us',
                  icon: Icons.mail_outline,
                  description:
                      '📧 Email: support@egytourapp.com\n📞 Phone: +20 111 222 3333',
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome to Egy Tour App!',
          style: GoogleFonts.cairo(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade900,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Your smart companion for discovering Egypt. From pyramids to paradise coasts, we help you explore it all.',
          style: GoogleFonts.cairo(fontSize: 16, color: Colors.grey[800]),
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required IconData icon,
    required String description,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 24.sp, color: Colors.teal),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 5,
                    style: Styles.textStyle800.copyWith(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.teal.shade800,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 10,
                    style: Styles.textStyle800.copyWith(
                      fontSize: 13.sp,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
