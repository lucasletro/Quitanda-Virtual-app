import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/autenticacao/sign_up_screen.dart';

import '../base/base_screen.dart';
import '../common_widgets/custom_text_field.dart';

//tela de login

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //variavel para descobrir o tamanho exato da tela e passar na altura
    //do sizedBox para limitar o tamanho da coluna e conseguir usar o scrowView
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor, //cor do scaffold verde


      body: SingleChildScrollView(
        child: SizedBox( //para limitar o tamanho da coluna
          height: size.height,
          width: size.width,
          child: Column( //coluna possibilita colocar um widget em cima do outro
            children: [
              Expanded(
                child: Column(
                  //alinhamento do texto no centro
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    //NOME DO APP
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(fontSize: 40),
                        children: [
                          const TextSpan(
                            text: "Green",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),

                          TextSpan(
                            text: "grocer",
                            style: TextStyle(color: CustomColors.customContrastColor), //cor vermelha
                          ),
                        ],
                      ),
                    ),


                    //CATEGORIAS
                    //foi usado um plugin animated_text_kit
                    SizedBox( //sizedBox para definir uma altura pra q o texto nao fique subindo e descendo
                      height: 30,
                      child: DefaultTextStyle( //vai aplicar um textStyle para todos os textos abaixo q ele tem como filho
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                          pause: Duration.zero, //pausa entre a apariçao de uma categoria e outra
                          repeatForever: true, //para a animaçao nao parar de repetir
                            animatedTexts: [
                              //aq vamos passar todas as categorias da animaçao
                              FadeAnimatedText("Frutas"),
                              FadeAnimatedText("Verduras"),
                              FadeAnimatedText("Legumes"),
                              FadeAnimatedText("Carnes"),
                              FadeAnimatedText("Cereais"),
                              FadeAnimatedText("Laticineos"),
                            ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),

              //FORMULARIO
              //container branco com bordas arredondadas
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration( //dentro do box decoration a gente coloca as decoraçoes do container
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),


                child: Column(
                  //para esticar ao maximo os filhos da coluna no eixo cruzado
                  crossAxisAlignment: CrossAxisAlignment.stretch,

                  children: [

                    //CAMPO DE TEXTO EMAIL
                    const CustomTextField(
                      icon: Icons.email,
                      label: "Email",
                    ),


                    //CAMPO DE TEXTO SENHA
                    const CustomTextField(
                      icon: Icons.lock,
                      label: "Senha",
                      isSecret: true,
                    ),


                    //BOTÃO DE ENTRAR
                    //envolvemos o botao em um sizedBox para colocar uma altura no botao
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return const BaseScreen();
                            })
                          );
                        },
                        child: const Text(
                          "Entrar", style: TextStyle(fontSize: 18),),

                      ),
                    ),


                    //BOTÃO DE ESQUECEU A SENHA
                    Align(
                      //align para centralizar ao centro mais a direita
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Esqueceu a senha?", style: TextStyle(color: CustomColors.customContrastColor),),
                      ),
                    ),


                    //DIVISOR
                    Padding(
                      //espaçamento em baixo do divisor de 10
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2, //grossura
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Ou"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.withAlpha(90),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //BOTÃO DE CRIAR CONTA
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          side: const BorderSide(
                            width: 2, //largura da borda
                            color: Colors.green,
                          ),
                        ),
                        onPressed: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) {
                                return SignUpScreen();
                              }
                            ),
                          );
                        },
                        child: const Text("Criar conta", style: TextStyle(fontSize: 18),),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
