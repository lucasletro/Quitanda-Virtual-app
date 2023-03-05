import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';

//esta classe vai ser responsavel pelo botao de adicionar ---#22 passos
//mais quantidade do produto ao carrinho.
//vai ser usado na classe product_screen.

class QuantityWidget extends StatelessWidget {

  final int value; //#23
  final String suffixText; //24 (se é kg ou unidade)
  final Function(int quantity) result; //#27  vai ser usado no onPressed do QuantityButton.

  //variavel pra indicar se o botao de quantidade é removivel ou nao,
  //se ele tiver so 1 unidade ou kg é removivel. se tiver mais nao
  final bool isRemovable;

  const QuantityWidget({
    Key? key,
    required this.value, //#25
    required this.suffixText, //#26
    required this.result, //#28
    this.isRemovable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //CONTAINER DE FORA BRANCO-------------
    return Container( //--- #1
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration( //#2
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow( //aq aplicamos a sombra q fica abaixo do container
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),

      //CONTAINER DE DENTRO, O QUAL VAI SER DENTRO DE UMA LINHA --------------
      // COM OS BOTOES DE REMOVER E ADICIONAR.
      child: Row( //--- #3

        //em momentos em q a row vai crecer de fotma exorbitante, usamos o
        //mainAxisSize.min pra q ela cresça o minimo possivel
        // ela creceu exorbitante na classe cart_tile.
        mainAxisSize: MainAxisSize.min,

        children: [

          //BOTAO DE REMOVER
          _QuantityButton( //#10
            //se o botao nao for removido ou o valor for maior q 1
            icon: !isRemovable || value > 1 ? Icons.remove : Icons.delete_forever, //#15
            color: !isRemovable || value > 1 ? Colors.grey : Colors.red, //#16
            onPressed: (){ //#17

              if(value == 1 && !isRemovable) return;

              //ao clicar no botoa de remover vai ser o valor - 1 ou seja se tiver 2 vai pra 1...
              int resultCount = value - 1;
              result(resultCount);

            },
          ),
          
          Padding( //---#22
            padding: const EdgeInsets.symmetric(horizontal: 6), //#22
            child: Text( //---#21
              "$value$suffixText",
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          //BOTAO DE ADICIONAR
          _QuantityButton( //#11
            icon: Icons.add, //#18
            color: CustomColors.customSwatchColor, //#19
            onPressed: (){ //#20
              //ao clicar no botao de add vai ser o valor mais 1 ou seja se tiver 1 vai pra 2...
              int resultCount = value + 1; //#29
              result(resultCount); //#30---------------

            },
          ),
        ],
      ),
    );

  }
}




//BOTAO DE QUANTIDADE Q VAMOS USAR DENTRO DO CONTAINER BRANCO EM UMA ROW------

class _QuantityButton extends StatelessWidget {

  final Color color;  //#12
  final IconData icon;  //#13
  final VoidCallback onPressed; //#14

  const _QuantityButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //Ink é a tinta e o Inkwell é o q vai ativar a tinta quando clicarmos n Inkwell
    //e essa tinta tem q ser dispersa em um material por isso o Material.

    return Material( //animaçao quando a gente clica no botao --- #7
      child: InkWell( //---- #5 widget com funçao parecidada com o gestureDetector para colocar o onTap
        onTap: onPressed, //#6
        borderRadius: BorderRadius.circular(50), //borda circular na animaçao ao clicar no botao --- #9
        child: Ink( //( #4removemos o container) (sempre q utilizarmos inkweel é bom utiilizar o Ink) #8
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}

