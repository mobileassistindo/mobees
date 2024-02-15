import 'package:flutter/material.dart';

import 'package:core/core.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: cPureBlack,
              child: Center(
                child: PreferredSize(
                  preferredSize: Size.fromHeight(200.0),
                  child: CircleAvatar(
                    maxRadius: 140,
                    backgroundColor: Colors.white,
                    child: Image.asset(
                      'assets/logo.png',
                      width: 210,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              decoration: BoxDecoration(
                color: cYellow,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40)
                ),
              ),
              child: const Text(
                // 'Mobees merupakan sebuah aplikasi katalog film yang dikembangkan oleh Dicoding Indonesia sebagai contoh proyek aplikasi untuk kelas Menjadi Flutter Developer Expert.',
                'Mobees is an application catalog of movies and tv series. This application was created as a submission final project the become a flutter developer expert by dicoding academy class.',
                style: TextStyle(color: Colors.black87, fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
