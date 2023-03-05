import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/pages/cart/components/cart_tile.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;

import '../common_widgets/payment_dialog.dart';

//TELA DO CARRINHO DE COMPRAS
//vai esta classe vai ser chamada na base_screen no pageView.

class CartTab extends StatefulWidget {
  const CartTab({Key? key}) : super(key: key);

  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {

  //------------------------------
  //pra colocar o R$ no preço total a pagar //12
  final UtilServices utilServices = UtilServices();

  //metodo pra remover item do carrinho
  void removeItemFromCart(CartItemModel cartItem){
    setState(() {
      appData.cartItems.remove(cartItem);
    });
  }

  //metodo pra apresentar o valor total geral do carrinho
  double cartTotalPrice(){
    double total = 0;
    for(var item in appData.cartItems){
      total += item.totalPrice();
    }
    return total;
  }
  //----------------------------------------

  @override
  Widget build(BuildContext context) {

    return Scaffold( //1

      appBar: AppBar( //2
        title: const Text("Carrinho"),
      ),

      body: Column( //3
        children: [

          Expanded( //4
            child: ListView.builder(
              itemCount: appData.cartItems.length,
              itemBuilder: (_, index){
                return CartTile(
                  cartItem: appData.cartItems[index],
                  remove: removeItemFromCart,
                );
              },
            ),
          ),



          //CONTAINER BRANCO DE BAIXO COM VALOR TOTAL DO PEDIDO
          //E BOTAO DE CONCLUIR O PEDIDO
          Container( //5
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration( //6
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              boxShadow: [ //sombreamento do container
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 3,
                  spreadRadius: 2,
                ),
              ],
            ),

            child: Column( //8
              crossAxisAlignment: CrossAxisAlignment.stretch, //11
              children: [

                const Text( //9
                    "Total geral",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),

                Text( //10
                  utilServices.priceToCurrency(cartTotalPrice()), //13
                  style: TextStyle(
                    fontSize: 23,
                    color: CustomColors.customSwatchColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox( //15 ----------
                  height: 50,
                  child: ElevatedButton( //14
                    style: ElevatedButton.styleFrom(
                      primary: CustomColors.customSwatchColor, //cor primaria do botao
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    onPressed: () async{
                      //ao clicar no botao vai aparecer um dialog
                      //pra confirmar a compra
                      bool? result = await showOrderConfirmation();

                      //se result for verdadeiro e caso seja nulo vai ser false
                      if(result ?? false){
                        showDialog(
                          context: context,
                          builder: (_){
                            return PaymentDialog(
                              order: appData.orders.first,
                            );
                          },
                        );
                      }

                    },
                    child: const Text(
                        "Concluir Pedido",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

              ],
            ),

          ),

        ],
      ),
    );
  }

  //DIALOG DE CONFIRMAÇAO Q VAMOS USAR AO CLICAR NO ELEVATEDBUTTON
  //DE CONCLUIR PEDIDO
  //bool? = nulable bool pois se clicarmos fora do dialag retorna null
  Future<bool?> showOrderConfirmation(){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Text("Confirmação"),
            content: const Text("Deseja realmente concluir o pedido?"),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).pop(false);
                },
                child: const Text("Não"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: (){
                  Navigator.of(context).pop(true);
                },
                child: const Text("Sim"),
              ),
            ],
          );
        }
    );
  }


}
