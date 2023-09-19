import 'package:flutter/material.dart';
import 'package:my_portfolio/globals/app_colors.dart';

import '../globals/app_text_styles.dart';

class FooterClass extends StatelessWidget {
  const FooterClass({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        color: AppColors.bgColor2,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Text(
          "©Copyright-2023 Sirojudin Munir",
          style: AppTextStyles.montserratStyle(
            color: Colors.white,
          ).copyWith(fontSize: 16),
        ));
  }
}
