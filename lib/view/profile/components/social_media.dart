import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        linkedMedia('assets/icon1.png', 'https://github.com/GUSTAV0DEDEUS',
            Colors.black),
        const SizedBox(
          width: 12,
        ),
        linkedMedia(
            'assets/icon2.png',
            'https://www.linkedin.com/in/gustavo-de-deus-conceicao',
            Colors.blueAccent),
        const SizedBox(
          width: 12,
        ),
        linkedMedia('assets/icon3.png', 'https://www.youtube.com/@deCode001',
            Colors.red),
      ],
    );
  }

  Widget linkedMedia(String image, String url, Color color) {
    return InkWell(
      onTap: () {
        launchUrlString(url);
      },
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: Image.asset(image, width: 25, height: 25),
      ),
    );
  }
}
