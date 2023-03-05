import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/pages/cart/cart_tab.dart';
import 'package:quitanda_virtual/src/pages/orders/orders_tab.dart';
import 'package:quitanda_virtual/src/pages/profile/profile_tab.dart';
import '../home/home_tab.dart';


//TELA BASE --- #15 passos

//vai conter o bottomNavigationBar e a estrutura
//responsavel para que a gente consiga
// fazer a navegaçao quando clicarmos
//nos botões da bottomNavigationBar
//ESSA VAI SER UMA TELA PRINCIPAL
//POIS VAMOS CRIAR AS CLASSES HOME_TAB, CARRINHO, PEDIDOS ETC
//E CHAMAR ESSAS CLASSE DENTRO DO PAGEVIEW.

class BaseScreen extends StatefulWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  //variavel para mudar de botao ao clicar em outro botao
  int currentIndex = 0; //#10

  //controlador do PageView pra mudar de tela ao clicar em um botao
  final pageController = PageController(); //#12


  @override
  Widget build(BuildContext context) {
    return Scaffold( //#1

      //visualizaçao paginada
      body: PageView( //#8
        physics: const NeverScrollableScrollPhysics(), //bloqueio pra nao mudar de tela ao arrastar pro lado #15
        controller: pageController, //#13
        children: const [
          HomeTab(),
          CartTab(),
          OrdersTab(),
          ProfileTab(),
        ],
      ),




      bottomNavigationBar: BottomNavigationBar( //#2
        currentIndex: currentIndex, //currentIndex começa em 0 #9

        onTap: (index){ //#11
          //o currentIndex q começao em 0 vai ser igual a esse index
          //do onTap pois quando clicamos no botao ele tras esse index pra gente
          setState(() { //#11
            currentIndex = index; //#11

            //PageController vai alternar para a pagina do index q clicarmos desta forma conseguimos estar alternado entre as telas
            //pageController.jumpToPage(index); //#14
            pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutQuart,
            );

          });
        },

        type: BottomNavigationBarType.fixed, ////pra q os botoes voltem a aparecer pois passou de 3 botoes #4
        backgroundColor: Colors.green, //#5
        selectedItemColor: Colors.white, //cor do item selecionado #6
        unselectedItemColor: Colors.white.withAlpha(100), //#7

        items: const [
          BottomNavigationBarItem( //#3
            icon: Icon(Icons.home_outlined),
            label: "Home"
          ),

          BottomNavigationBarItem( //#3
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Carrinho"
          ),

          BottomNavigationBarItem( //#3
              icon: Icon(Icons.list),
              label: "Pedidos"
          ),

          BottomNavigationBarItem( //#3
              icon: Icon(Icons.person_outline),
              label: "Perfil"
          ),

        ],
      ),
    );
  }
}
