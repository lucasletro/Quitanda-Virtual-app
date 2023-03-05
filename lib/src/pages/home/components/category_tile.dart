import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

//CategoryTile (bloco de categoria) ---#17 por enquanto

//Esta classe CategoryTile vai ser usada na home_tab na seção de categorias.
//cada botaozinho das categorias sao os tiles de apresentaçao,
//nesta classe vamos criar esses botoes dos tiles das categorias e outras coisas relacionadas

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    Key? key,
    required this.category, //#3
    required this.isSelected, //#4
    required this.onPressed, //#15
  }) : super(key: key);

  final String category; //#1
  //indica se o tile esta ou nao selecionado
  final bool isSelected; //#2

  //funçao pra especificar q o proximo tile q clicarmos é o q vai estar selecionado
  final VoidCallback onPressed; //#14

  @override
  Widget build(BuildContext context) {

    return InkWell( //#16
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed, //#17

      child: Align( //#10
        alignment: Alignment.center, //alinhando o texto do tile de categorias ao centro //#11
        child: Container(
          //espaçamento dos tiles de categorias na horizontal
          padding: const EdgeInsets.symmetric(horizontal: 6), //#8
          decoration: BoxDecoration( //#6
            borderRadius: BorderRadius.circular(10), //#9
            //cor do container se selecionado verde, senao transparente
            color: isSelected ? CustomColors.customSwatchColor : Colors.transparent, //#7
          ),

          child: Text( //#5
            category, //#5
            style: TextStyle(
              color: isSelected ? Colors.white : CustomColors.customContrastColor, //#12
              fontWeight: FontWeight.bold,
              //se o botao estiver selecionado tamanho da fonte é 16 senao é 14
              fontSize: isSelected ? 16 : 14 //#13
            ),
          ),

        ),
      ),
    );
  }
}
