
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/home/components/item_tile.dart';
import 'components/category_tile.dart';

//toda a importaçao desse arquivo, tudo q ele contem vamos envolver em uma variavel
//q a gente vai ta conseguindo utilizar na aplicaçao.
//ou seja toda sua importaçao vai ser entendida como appData.
import 'package:quitanda_virtual/src/config/app_data.dart' as appData; //#31

//HOME TAB (aba inicial) --- #45 passos por enquanto
//esta aba inicial nos vamos chamar ela dentro do PageView
//na classe base_screen

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  //movemos as categorias para a classe app_data
  //Lista das categorias
  // List<String> categories = [ //#19
  //   "Frutas",
  //   "Legumes",
  //   "Verduras",
  //   "Temperos",
  //   "Cereais",
  // ];


  //variavel pra marcar qual é a categoria selecionada
  String selectedCategory = "Frutas"; //#28
  //==========================================

  @override
  Widget build(BuildContext context) {

    return Scaffold( //#1

      //APP BAR (de#1 a #10)----------------------------------
      appBar: AppBar( //#2
        backgroundColor: Colors.transparent, // cor da app bar #4
        elevation: 0, //tira a sombra da app bar na cor transparente #5
        centerTitle: true,

        title: Text.rich( //#3
          TextSpan(
            style: const TextStyle(fontSize: 30),
            children: [
              TextSpan(text: "Green", style: TextStyle(color: CustomColors.customSwatchColor)),
              TextSpan(text: "grocer", style: TextStyle(color: CustomColors.customContrastColor)),
            ],
          ),
        ),

        actions: [ //#6
          Padding( // espaçamento do icone e do badge  #10
            padding: const EdgeInsets.only(top: 15, right: 15), //#10
            child: GestureDetector( //GestureDetector para conseguirmos clicar no botao pois ele é so um icone  #9
              onTap: (){ //#9

              },

              //badge vai indicar o numero de itens q vc tem no carrinho
              child: Badge( //tivemos q importar o plugin do badge na pubspec  #8
                badgeColor: CustomColors.customContrastColor, //#8
                badgeContent: const Text("2", style: TextStyle(color: Colors.white, fontSize: 12),), //#8

                child: Icon(Icons.shopping_cart, //#7
                   color: CustomColors.customSwatchColor
                  ),

              ),
            ),
          ),
        ],
      ),
      //=====================================================


      body: Column( // #11
        children: [

          //CAMPO DE PESQUISA (de#11 a #18)
          Padding(   //#18
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // #18
            child: TextFormField( // #12
              decoration: InputDecoration( //#12
                filled: true, //se o fundo do campo vai ser preenchido cor cor ou não #12
                fillColor: Colors.white, // (cor de fundo do campo) #12
                isDense: true, //reduz a altura o campo #14
                hintText: "Pesquise aqui...", //#15
                hintStyle: TextStyle( //#16
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: Icon(Icons.search, color: CustomColors.customContrastColor, size: 21,), //#17

                border: OutlineInputBorder(   //#13
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0, //a borda nao tera largura
                    style: BorderStyle.none, //e nao existira
                  ),
                ),
              ),
            ),
          ),
          //===================================================


          //CATEGORIAS (FOI O MAIS TRABALHOSO DE FAZER) (de#20 a #35)
          Container( //#26 //////
            padding: const EdgeInsets.only(left: 25), //espaçamento dos tiles de categorias a esquerda #27
            height: 40,
            child: ListView.separated( //#20
              scrollDirection: Axis.horizontal, //indicar a direçao q a lista vai ter a rolagem #25
              //cada botaozinho sao os tiles de apresentaçao
              itemBuilder: (_, index){ //#21

                return CategoryTile( //#22
                  onPressed: (){ //#30
                    setState(() {
                      selectedCategory = appData.categories[index]; //#32(add appData.)
                    });
                  },
                  //variaveis category e isSelected criamos na classe category_tile
                  category: appData.categories[index], //#23 e #33

                  //se na lista de categorias no index especificado
                  //temos a mesma categoria selecionada ai sim o botao estara selecionado
                  //-(fizemos alteraçoes no isSelected)  #29    ====================================================
                  isSelected: appData.categories[index] == selectedCategory, //(deixamos com valor false no #24 mudamos no #29) e #34
                );

              },
              //a separaçao q vai ficar entre um item e outro na lista
              separatorBuilder: (_, index) => const SizedBox(width: 10,), //#21

              itemCount: appData.categories.length, //quantos itens vou ter na lista //#21 e (#35 add appData)
            ),
          ),
          //=========================================================


          //GRID (de#36 a #46)
          Expanded( //#42
            child: GridView.builder( //#36
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16), //#44
              physics: const BouncingScrollPhysics(), //animaçao ao puxar o grid pra baixo e pra cima #43
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //valor do eixo cruzado #37
                mainAxisSpacing: 10, //espaço entre os itens no eixo principal #38
                crossAxisSpacing: 10, //39
                childAspectRatio: 9 / 11.5, //aumenta o tamanho dos quadrados do grid #45
              ),
              itemCount: appData.items.length, //qtdade de itens q queremos apresentar #40

              //dentro do itemBuilder é o que vamos colocar dentro do grid
              itemBuilder: (_, index) { //#41
                return ItemTile(
                  //este item vem do construtor da classe item_tile
                  item: appData.items[index], //#46
                );
              },

            ),
          ),

        ],
      ),

    );
  }
}

