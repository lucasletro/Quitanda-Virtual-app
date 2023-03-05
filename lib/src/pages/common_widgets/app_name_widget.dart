import 'package:flutter/material.dart';
import '../../config/custom_colors.dart';

//iamos usar na home_tab, sign_in_screen e splash screen
//porem eu optei por usar so na splash_screen.

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text.rich(
      TextSpan(
        style: const TextStyle(fontSize: 40),
        children: [
          const TextSpan(text: "Green", style: TextStyle(color: Colors.white)),
          TextSpan(text: "grocer", style: TextStyle(color: CustomColors.customContrastColor)),
        ],
      ),
    );

  }
}
