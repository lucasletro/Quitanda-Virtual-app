import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/autenticacao/sign_in_Screen.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/app_name_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  //----------------------------------------------------------------------------
  //nesta parte fazemos com que a tela splashScreen tenha uma duraçao
  //de 2 segundos e em seguida abra a tela sign in screen, para isto,
  //tivemos que passar esta classe para StatefulWidget.
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (c){
        return const SignInScreen();
      }));
    });
  }
  //----------------------------------------------------------------------------


  @override
  Widget build(BuildContext context) {

    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              CustomColors.customSwatchColor,
              CustomColors.customSwatchColor.shade700,
              Colors.green
            ],
          ),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
             AppNameWidget(),

            SizedBox(height: 10,), //espaçamento entre os widgets

            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ),
          ],
        ),



      ),
    );
  }
}
