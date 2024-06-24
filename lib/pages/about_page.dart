import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  // Function to launch URL
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        backgroundColor: Colors.blueGrey, // Simplified AppBar color
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20), // Space from AppBar
            // Profile Picture
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/fotoku.jpeg"),
              backgroundColor: Colors.grey, // Fallback background color
            ),
            const SizedBox(height: 20),

            // Name
            Text(
              "Ilman Nurohman",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87, // Text color
                  ),
            ),
            const SizedBox(height: 10),

            // Education Info
            const Text(
              "Mahasiswa Teknik Informatika\nInstitut Teknologi Garut",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54, // Lighter text color
              ),
            ),
            const SizedBox(height: 20),

            // Contact Info
            Card(
              color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2, // Slight shadow for card
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => _launchURL('tel:+6285703189263'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.phone, size: 20, color: Colors.blueGrey),
                          SizedBox(width: 10),
                          Text(
                            "+6285860287954",
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    InkWell(
                      onTap: () => _launchURL('mailto:2106083@itg.ac.id'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.mail, size: 20, color: Colors.blueGrey),
                          SizedBox(width: 10),
                          Text(
                            "2106083@itg.ac.id",
                            style: TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.location_on, size: 20, color: Colors.blueGrey),
                        SizedBox(width: 10),
                        Text(
                          "Purwajaya, Garut",
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Footer
            const Text(
              "itg.ac.id © 2024",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
