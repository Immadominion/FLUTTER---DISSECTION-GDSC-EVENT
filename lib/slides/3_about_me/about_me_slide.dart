import 'package:flutter/material.dart';

import '../../common/bullet_list.dart';
import '../../templates/templates.dart';

class AboutMeSlide extends StatelessWidget {
  const AboutMeSlide();

  @override
  Widget build(BuildContext context) {
    return SplitScreenTemplate(
      title: 'About me',
      leftChild: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BulletList(
            items: [
              'Software Engineer from Nigeria',
              'No prior mobile app development experience before Flutter',
              'Using Flutter since v3, lol',
              'IEEE FUTO SB SIGHT Executive Member',
              'Google Developer Students Club Core Team Member',
              'Microsoft Learn Students Ambassador',
              'Solana Allstars Owerri Ambassador',
              'Community Enthusiast',
              'Web3 boy',
            ],
            textHeight: 0.5,
          ),
          Text(
            '* Finished the Snake game on Nokia 3310, twice!',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      rightChild: FractionallySizedBox(
        widthFactor: 0.5,
        child: Image.asset('images/about_me.jpg'),
      ),
      leftFlex: 2,
      rightFlex: 3,
    );
  }
}
