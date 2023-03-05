import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../common_widgets/quantity_widget.dart';

//esta classe vai ser a tela dos produtos ou seja
//quando clicar em uma maça por exemplo vc vai entrar nesta tela #27 passos

class ProductScreen extends StatefulWidget {
  const ProductScreen({
    Key? key,
    required this.item, //#6
  }) : super(key: key);


  final ItemModel item;  //#5
  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  final UtilServices utilsServices = UtilServices(); //--- #19
  int cartItemQuantity = 1;

  @override
  Widget build(BuildContext context) {

    return Scaffold( //#1
      backgroundColor: Colors.white.withAlpha(230), //#2

      body: Stack( //--- pra colocar o botao de voltar a tela anterior #27
        children: [

          //CONTEUDO
          Column( //#3
            children: [
              //-------------------IMAGEM-----------------------------
              Expanded( //#4
                child: Hero( //animaçao da imagem #27 bobagem(pouco util)
                  tag: widget.item.img,
                    child: Image.asset(widget.item.img)
                ), //#7
              ),
              //=====================================================

              //--------------CONTAINER COM DESCRIÇAO-------------------------
              Expanded( //#8
                child: Container( //#9
                  padding: const EdgeInsets.all(32), //#15
                  decoration: BoxDecoration( //#10
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                    boxShadow: [ //sombra #11
                      BoxShadow(
                        color: Colors.grey.shade600,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column( //#12
                    crossAxisAlignment: CrossAxisAlignment.stretch, //#14
                    children: [

                      //NOME - QUANTIDADE DO PRODUTO -----------------------
                      Row( //--- #16
                        children: [

                          Expanded( //para expandir o texto ao maximo para dar um espaçamento do texto ao lado. #18
                            child: Text(  //#13
                              widget.item.itemName,
                              maxLines: 2, //quantdade max de linha pra colocar o nome do produto.
                              overflow: TextOverflow.ellipsis, //coloca as retisencias caso a palavra passe de 2 linhas.
                              style: const TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          QuantityWidget( //widget de quantidade
                            value: cartItemQuantity,
                            suffixText: widget.item.unit,
                            result: (int quantity){
                              setState(() {
                                cartItemQuantity = quantity;
                              });
                            },
                          ),
                        ],
                      ),
                      //====================================================

                      //PREÇO DO PRODUTO ------------------------------
                      Text(  //--- #20
                        utilsServices.priceToCurrency(widget.item.price),
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      //================================================

                      //DESCRIÇAO DO PRODUTO ---------------------
                      Expanded( //---#23 espandir o texto pra dar um expaçameto do botao pois estava muito colado no texto
                        child: Padding( //#24 espaçamento em cima e em baixo do texto
                          padding: const EdgeInsets.symmetric(vertical: 10), //#24
                          child: SingleChildScrollView( //--- #22
                            child: Text( //--- #21
                              widget.item.description,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      //=======================================================

                      //BOTAO------------------------------------------
                      //envolvemos em um sizedBox para almentar o tamanho do botao pois estava pequeno
                      SizedBox( //---#26
                        height: 55, //#26
                        child: ElevatedButton.icon( //#25
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: (){},
                          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white,),
                          label: const Text(
                            "Add no Carrinho",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //====================================================

                    ],
                  ),
                ),
              ),

            ],
          ),

          //BOTAO DE VOLTAR A TELA ANTERIOR --------------------
          Positioned( //posicionamento do botao #30
            left: 10,
            top: 10,
            child: SafeArea( //faz com q o botao apareça na area visivel #29
              child: IconButton( //--- #28
                onPressed: (){
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
          //======================================================


        ],
      ),
    );
  }
}
