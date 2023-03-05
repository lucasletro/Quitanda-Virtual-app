import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';
import '../../../services/utils_services.dart';
import '../../product/produt_screen.dart';

//Esta classe vai ser responsavel pelo o q vai estar dentro   //#25 passos
//do gridView a imagem das frutas, preço etc...
//entao esta classe item_tile vai ser chamada na home_tab
//na parte do grid

class ItemTile extends StatefulWidget {


  //criando uma instancia da classe item_model
  //pois dentro dessa instancia vamos ter todos os dados do produto
  //como nome, imagem, preço etc...
  final ItemModel item; //#6


  const ItemTile({
    Key? key,
    required this.item, //#6
  }) : super(key: key);

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {

  //instancia da classe util services para modificarmmos o preço e a unidade dos produtos
  final UtilServices utilServices = UtilServices();  //#15


  //----------------------------------------------------------------------
  //troca dos icones quando clicarmos no botao de add no carrinho
  IconData tileIcon = Icons.add_shopping_cart_outlined;

  //vamos chamar esta funçao no onTap do botao de add bo carrinho
  Future<void> switchIcon() async {

    //aq trocamos o icone.
    setState(() => tileIcon = Icons.check);

    //delayed pra q o icone seja mostrado por um tempo e depois volte pra o q tava.
    await Future.delayed(const Duration(milliseconds: 1500));

    //aq voltamos pro icone q estava sendo apresentado anteriormente
    setState(() => tileIcon = Icons.add_shopping_cart_outlined);

  }
  //---------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {

    return Stack( //para colocar um widget em cima do outro no caso o botao de adiconar ao carrinho #17
      children: [

        //CONTEUDO DO CARD
        GestureDetector( //--- #23
          onTap: (){ //--- #24
            Navigator.of(context).push(MaterialPageRoute(builder: (c){
              return ProductScreen(
                item: widget.item,
              );
            }));
          },

          child: Card( //#1
            elevation: 1, //#2
            shadowColor: Colors.grey.shade300, //cor da sombra #3
            shape: RoundedRectangleBorder( //#4
              borderRadius: BorderRadius.circular(20),
            ),

            //como queremos um componente acima do outro q é a imagem acima do nome
            //e acima do preço vamos utilizar uma coluna pra isto
            child: Padding( //#9
              padding: const EdgeInsets.all(12), //#9
              child: Column( //#5
                crossAxisAlignment: CrossAxisAlignment.stretch, //esticando a coluna #10
                children: [

                  //IMAGEM ============================================
                  // expanded para as imagens forçarem o crescimaneto ao maximo q conseguirem
                  Expanded( //#11
                      child: Hero( //animaçao nas imagens #25
                        tag: widget.item.img, //tag é o modo q vamos reconhecer essa mesma imagem quando a abrirmos em outro local
                          child: Image.asset(widget.item.img,)//#7
                      ),
                  ),

                  //NOME=====================================
                  Text( //#8
                    widget.item.itemName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  //================================================

                  //PREÇO - UNIDADE ============================
                  Row( //#13
                    children: [
                      Text( //#12
                        utilServices.priceToCurrency(widget.item.price), //#16
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor,
                        ),
                      ),

                      Text("/${widget.item.unit}", style: TextStyle( //#14
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),),
                    ],
                  ),
                  //===============================================
                ],
              ),
            ),
          ),
        ),


        //BOTAO DE ADD NO CARRINHO NO CANTO SUPERIOR DIREITO DAS FRUTAS =======
        Positioned( //#18
          top: 4,
          right: 4,
          child: GestureDetector( //#22 pra tornar esse icone um botao
            onTap: (){
              switchIcon();
            },
            child: Container( //#19
              height: 40,
              width: 35,
              decoration: BoxDecoration( //#21
                color: CustomColors.customSwatchColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Icon( //#20
                tileIcon,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
        //================================================
      ],
    );
  }
}
