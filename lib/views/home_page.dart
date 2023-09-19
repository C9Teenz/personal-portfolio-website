import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';
import 'package:my_portfolio/widgets/profile_animation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../globals/app_assets.dart';
import '../globals/app_buttons.dart';
import '../globals/app_link.dart';
import '../globals/app_text_styles.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socialButtons = <String>[
      AppAssets.facebook,
      AppAssets.linkedIn,
      AppAssets.insta,
      AppAssets.github,
    ];
    final linkSocial = <String>[
      AppLink.facebook,
      AppLink.linkedIn,
      AppLink.instagram,
      AppLink.github,
    ];
    final Size size = MediaQuery.of(context).size;

    Widget personalInfo(Size size) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 1200),
            child: Text(
              'Hello, It\'s Me',
              style: AppTextStyles.montserratStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInRight(
            duration: const Duration(milliseconds: 1400),
            child: Text(
              'Sirojudin Munir',
              style: AppTextStyles.headingStyles(),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInLeft(
            duration: const Duration(milliseconds: 1400),
            child: Row(
              children: [
                Text(
                  'And I\'m a ',
                  style: AppTextStyles.montserratStyle(color: Colors.white),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(
                      'Flutter Developer',
                      textStyle: AppTextStyles.montserratStyle(
                          color: Colors.lightBlue),
                    ),
                    TyperAnimatedText('Backend Developer',
                        textStyle: AppTextStyles.montserratStyle(
                            color: Colors.lightBlue)),
                  ],
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          FadeInDown(
            duration: const Duration(milliseconds: 1600),
            child: Text(
              'Explore my projects for engaging iOS and Android experiences. Let\'s'
              'bring creative ideas to life through technology!',
              style: AppTextStyles.normalStyle(),
            ),
          ),
          const SizedBox(
            height: 22,
          ),
          SizedBox(
            height: 48,
            child: Row(
                children: socialButtons
                    .asMap()
                    .entries
                    .map((e) => InkWell(
                        onTap: () {
                          _launchUrl(linkSocial[e.key]);
                        },
                        child: socialButton(e.value)))
                    .toList()),
          ),
          const SizedBox(
            height: 18,
          ),
          FadeInUp(
            duration: const Duration(milliseconds: 1800),
            child: AppButtons.buildMaterialButton(
                onTap: () {
                  _launchUrl(AppLink.cv);
                },
                buttonName: 'Download CV'),
          ),
        ],
      );
    }

    return HelperClass(
        mobile: Column(
          children: [
            personalInfo(size),
            const SizedBox(
              height: 25,
            ),
            const ProfileAnimation()
          ],
        ),
        tablet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: personalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        desktop: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(child: personalInfo(size)),
            const ProfileAnimation(),
          ],
        ),
        paddingWidth: size.width * 0.1,
        bgColor: Colors.transparent);
  }

  Widget socialButton(String asset) {
    return Container(
      width: 45,
      height: 45,
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2.0),
        color: Colors.black,
        shape: BoxShape.circle,
      ),
      padding: const EdgeInsets.all(6),
      child: Image.asset(
        asset,
        width: 10,
        height: 12,
        color: Colors.blue,
        // fit: BoxFit.fill,
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
