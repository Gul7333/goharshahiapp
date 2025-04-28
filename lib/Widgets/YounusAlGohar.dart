import 'package:flutter/material.dart';

class YounusAlGoharScreen extends StatelessWidget {
  const YounusAlGoharScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Younus AlGohar',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple.shade700,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/SarkarPicture/15.jpg', // Change this to your actual image
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Title
            const Center(
              child: Text(
                'Spiritual Personality',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const SizedBox(height: 12),

            const Divider(),

            const SizedBox(height: 10),

            // Bio
            const Text(
              'Younus AlGohar (born: 16 June 1969) is a Representative of Gohar Shahi and co-founder of the Messiah Foundation International, also known as the Kalki Avatar Foundation and Mehdi Foundation International. This organization is dedicated to spreading the mystical teachings of His Holiness Riaz Ahmed Gohar Shahi and upholds the belief that Shahi is the prophesied Messiah (Mahdi).\n\n'
              'In 1983, at the age of 15, Younus AlGohar encountered His Divine Eminence Riaz Ahmed Gohar Shahi for the first time. This meeting marked the beginning of an extraordinary spiritual journey. Over the next 18 years, he remained a devoted and close disciple of His Holiness, learning directly from him and embracing his divine mission. Younus AlGohar continued to serve as a disciple until His Holiness’s disappearance in 2001.\n\n'
              'Younus AlGohar also manages the Alra TV channel, which is accessible on almost all major social media platforms. He goes live every night at 10:30 PM UK time, engaging with audiences worldwide. During these live sessions, people ask questions about spirituality, the secrets of divine love, and the mysteries of the universe. Younus AlGohar provides detailed and enlightening answers, drawing from the teachings of His Holiness Riaz Ahmed Gohar Shahi.\n\n'
              'This innovative use of social media to disseminate the message of Gohar Shahi has significantly contributed to the mission’s growth. It has made the teachings more accessible and relatable to a global audience, leading to increased awareness and widespread recognition of the divine mission.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
