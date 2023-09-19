import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_assets.dart';
import 'package:my_portfolio/globals/app_colors.dart';
import 'package:my_portfolio/globals/constants.dart';
import 'package:my_portfolio/helper%20class/helper_class.dart';

import '../globals/app_text_styles.dart';

class MyServices extends StatefulWidget {
  const MyServices({Key? key}) : super(key: key);

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  bool isApp = false, isGraphic = false, isDataAnalyst = false;

  final onHoverActive = Matrix4.identity()..translate(0, -10, 0);
  final onHoverRemove = Matrix4.identity()..translate(0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return HelperClass(
      mobile: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isApp = value;
              });
            },
            child: buildAnimatedContainer(
                title: 'Flutter Development',
                asset: AppAssets.code,
                hover: isApp,
                content:
                    "We provide end-to-end Flutter development services, from custom app creation for iOS and Android to UI/UX design, maintenance, integration, quality assurance, and more. Our aim is to deliver tailored Flutter solutions for successful mobile apps."),
          ),
          Constants.sizedBox(height: 24.0),
          InkWell(
            onTap: () {},
            onHover: (value) {
              setState(() {
                isGraphic = value;
              });
            },
            child: buildAnimatedContainer(
                title: 'BackEnd Development',
                asset: AppAssets.brush,
                hover: isGraphic,
                content:
                    "As a backend development service provider, I can create robust, scalable, and efficient server-side solutions tailored to your specific needs, ensuring seamless functionality and optimal performance for your applications."),
          ),
        ],
      ),
      tablet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                    title: 'Flutter Development',
                    asset: AppAssets.code,
                    hover: isApp,
                    content:
                        "We provide end-to-end Flutter development services, from custom app creation for iOS and Android to UI/UX design, maintenance, integration, quality assurance, and more. Our aim is to deliver tailored Flutter solutions for successful mobile apps."),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isGraphic = value;
                  });
                },
                child: buildAnimatedContainer(
                    title: 'BackEnd Development',
                    asset: AppAssets.brush,
                    hover: isGraphic,
                    content:
                        "As a backend development service provider, I can create robust, scalable, and efficient server-side solutions tailored to your specific needs, ensuring seamless functionality and optimal performance for your applications."),
              ),
            ],
          ),
        ],
      ),
      desktop: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildMyServicesText(),
          Constants.sizedBox(height: 60.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isApp = value;
                  });
                },
                child: buildAnimatedContainer(
                    title: 'Flutter Development',
                    asset: AppAssets.code,
                    hover: isApp,
                    content:
                        "We provide end-to-end Flutter development services, from custom app creation for iOS and Android to UI/UX design, maintenance, integration, quality assurance, and more. Our aim is to deliver tailored Flutter solutions for successful mobile apps."),
              ),
              Constants.sizedBox(width: 24.0),
              InkWell(
                onTap: () {},
                onHover: (value) {
                  setState(() {
                    isGraphic = value;
                  });
                },
                child: buildAnimatedContainer(
                    title: 'BackEnd Development',
                    asset: AppAssets.brush,
                    hover: isGraphic,
                    content:
                        "As a backend development service provider, I can create robust, scalable, and efficient server-side solutions tailored to your specific needs, ensuring seamless functionality and optimal performance for your applications."),
              ),
            ],
          ),
        ],
      ),
      paddingWidth: size.width * 0.04,
      bgColor: AppColors.bgColor,
    );
  }

  FadeInDown buildMyServicesText() {
    return FadeInDown(
      duration: const Duration(milliseconds: 1200),
      child: RichText(
        text: TextSpan(
          text: 'My ',
          style: AppTextStyles.headingStyles(fontSize: 30.0),
          children: [
            TextSpan(
              text: 'Services',
              style: AppTextStyles.headingStyles(
                  fontSize: 30.0, color: AppColors.robinEdgeBlue),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildAnimatedContainer({
    required String title,
    required String asset,
    required bool hover,
    required String content,
    double width = 350,
    double hoverWidth = 360,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: hover ? hoverWidth : width,
      height: hover ? 390 : 380,
      alignment: Alignment.center,
      transform: hover ? onHoverActive : onHoverRemove,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
      decoration: BoxDecoration(
        color: AppColors.bgColor2,
        borderRadius: BorderRadius.circular(30),
        border:
            hover ? Border.all(color: AppColors.themeColor, width: 3) : null,
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 4.0,
            blurRadius: 4.5,
            offset: Offset(3.0, 4.5),
          )
        ],
      ),
      child: Column(
        children: [
          Image.asset(
            asset,
            width: 50,
            height: 50,
            color: AppColors.themeColor,
          ),
          Constants.sizedBox(height: 30.0),
          Text(
            title,
            style: AppTextStyles.montserratStyle(
                color: Colors.white, fontSize: 22.0),
          ),
          Constants.sizedBox(height: 12.0),
          Text(
            content,
            style: AppTextStyles.normalStyle(fontSize: 14.0),
            textAlign: TextAlign.center,
          ),
          Constants.sizedBox(height: 20.0),
        ],
      ),
    );
  }
}
