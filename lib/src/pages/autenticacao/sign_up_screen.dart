import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

import '../common_widgets/custom_text_field.dart';

//TELA DE CADASTRO  - #19 passos(ordens).

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  //criando mascaras (input formatter) para formatar os valores
  //dos campos do cpf e celular para isso importamos um plugin
  //mask_text_input_formatter
  final cpfFormatter = MaskTextInputFormatter( //#16
    mask: '###.###.###-##', //onde vou receber os digitos
    filter: {'#': RegExp(r'[0-9]')}, //é o caracter ao digitar no campo de texto
  );

  final phoneFormatter = MaskTextInputFormatter( //#18
    mask: '## # ####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {

    //variavel para descobrir o tamanho exato da tela e passar na altura
    final size = MediaQuery.of(context).size; //#11

    return Scaffold( //#0
      backgroundColor: CustomColors.customSwatchColor, //#0

      body: SingleChildScrollView( //#9
        child: SizedBox( //#10 //definir uma altura pro scrowView funcionar
          height: size.height, //aq vou especificar qual tamanho eu quero q minha coluna cresça
          width: size.width, //largura da tela

          child: Stack( //permite que coloquemos um widget em cima do outro exemplo é o botao de voltar pra tela anterior #12
            children: [

              Column( //#0
                children: [
                  const Expanded( //#2
                    child: Center( //#3
                      //centralizar o texto
                      child: Text( //#1 - ordem
                        "Cadastro",
                        style: TextStyle(color: Colors.white, fontSize: 35),
                      ),
                    ),
                  ),

                  //FORMULARIO
                  Container( //#1
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 40), //#3
                    decoration: const BoxDecoration( //dentro do box decoration a gente coloca as decoraçoes do container #2
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),

                    //para colocar todos os componentes um acima do outro
                    //campos de texto, botao etc vamos utilizar da coluna
                    child: Column( //#4
                      crossAxisAlignment: CrossAxisAlignment.stretch, //#8 esticar a coluna na horizontal pra esticar o ElevatedButton
                      children:  [
                        //CAMPOS DE TEXTO #5
                        const CustomTextField(
                            icon: Icons.email,
                            label: "Email"
                        ),
                        const CustomTextField(
                          icon: Icons.lock,
                          label: "Senha",
                          isSecret: true,
                        ),
                        const CustomTextField(
                            icon: Icons.person,
                            label: "Nome"
                        ),
                        CustomTextField(
                            icon: Icons.phone,
                            label: "Celular",
                          inputFormatters: [phoneFormatter], //#19
                        ),
                        CustomTextField(
                            icon: Icons.file_copy,
                            label: "CPF",
                          inputFormatters: [cpfFormatter], //#17

                        ),

                        //BOTAO DE CADSTRAR USUARIO
                        SizedBox( //para alterar a altura do botao #7
                          height: 50, //#7
                          child: ElevatedButton( //#6
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: (){},
                            child: const Text("Cadastrar Usuário", style: TextStyle(fontSize: 18),),
                          ),
                        ),

                      ],
                    ),

                  ),
                ],
              ),

              //BOTAO DE VOLTAR PRA TELA ANTERIOR
              Positioned( //para posicionar o botao em qualquer lugar da tela #15
                top: 10, // distancia do topo
                left: 10, //distancia da esquerda
                child: SafeArea( //vai abaixar o botao para q conseguimos clicar nele #14
                  child: IconButton(  //#13
                    onPressed: (){
                      Navigator.of(context).pop(); //aq ele fecha a tela e volta pra tela de sign in
                    },
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white,),
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
