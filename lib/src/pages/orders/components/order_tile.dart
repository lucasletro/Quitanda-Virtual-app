import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/pages/orders/components/order_status_widget.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../common_widgets/payment_dialog.dart';

//Esta classe vai ser responsavel pela criaçao dos
//tiles de pedidos.
//vai ser chamada na classe orders_tab no listView.separeted

class OrderTile extends StatelessWidget {

  //variaveis
  final OrderModel order; //#1

  //construtor
  OrderTile({
    Key? key,
    required this.order,
  }) : super(key: key);

  final UtilServices utilServices = UtilServices(); //#10

  @override
  Widget build(BuildContext context) {

    return Card( //#2
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Theme( //#4
        //tirando o divisor que estava aparecendo quando colocamos a borda no card
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent), //#5

        child: ExpansionTile( //#3 //tras a possibilidade de expandir ou colapsar um widget

          //pro ExpansioTile começar expandido ou nao
          //se o pedido estiver pendente o tile vai começar expandido caso contrario começa fechado
          initiallyExpanded: order.status == "pending_payment",


          //AQUI VAMOS APRESENTAR O ID DO PEDIDO E A DATA DE CRIAÇAO ========
          title: Column( //#6
            mainAxisSize: MainAxisSize.min, //#7
            crossAxisAlignment: CrossAxisAlignment.start, //#9
            children: [ //#8
              //ID DO PEDIDO
              Text("Pedido: ${order.id}"), //#8
              //DATA DO PEDIDO
              Text(utilServices.formatDateTime(order.createdDateTime), //#11
                style: const TextStyle(
                fontSize: 12,
                color: Colors.black
              ),)
            ],
          ),
          //=============================================================


          //aplicando espaçamento no children para q seus componentes
          //sejam enviados mais pro centro se destanciado das bordas
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16), //#13 ---
          
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch, //alinhando o texto do valor total no começo
          
          //children do ExpansionTile
          children: [ //#12 ----

            //indica q a row e seus componentes vao crescer ate a tamanho necessario para q eles apareçao na tela
            IntrinsicHeight(

              //Lista de produtos
              child: Row(
                children: [
                  //LISTA DE PRODUTOS QUANTIDADE, UNIDADE, NOME E PREÇO DO PEDIDO=========
                  Expanded(
                    flex: 3, //tamnho q esses componentes vao ocupar na horizontal
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children:
                        //esse map vai possibilitar receber cada um dos itens e retornar o q quiser
                        //neste caso vamos retornar os widgets que vao apresentar alguns dados do produto
                        order.items.map((orderItem) {
                            return _OrderItemWidget(
                              utilServices: utilServices,
                              orderItem: orderItem,
                            );
                          }).toList(),
                      ),
                    ),
                  ),
                  //=================================

                  //DIVISAO VERTICAL ENTRE O LADO ESQUERDO E O DIREITO QUE É O DE STATUS
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  //widget de status do pedido============
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      //se a data de vencimente esta antes de agora ela venceu
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                  //=========================================

                ],
              ),
            ),

            //VALOR TOTAL================================
            Text.rich(
              TextSpan(
                style: const TextStyle(
                  fontSize: 20
                ),
                children: [
                  const TextSpan(text: "Total ", style: TextStyle(fontWeight: FontWeight.bold),),
                  TextSpan(text: utilServices.priceToCurrency(order.total),),
                ],
              )
            ),
            //=============================================

            //BOTAO DE VER QR CODE PIX ========================================
            Visibility( //condiçao pro botao se tornar visivel
              //se o status do pedido for igual a pending_payment nos apresentamos o botao
              visible: order.status == "pending_payment",
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (_){
                      return PaymentDialog(
                        order: order,
                      );
                    },
                  );
                },
                //icon: const Icon(Icons.pix),
                icon: Image.asset("assets/app_images/pix.png", height: 18,),
                label: const Text("Ver QR Code Pix"),
              ),
            ),
            //===========================================================
          ],

        ),
      ),
    );
  }
}




//orderItemWidget VAI NOS RETORNAR QUANTIDADE, UNIDADE, NOME E PREÇO DO PEDIDO
class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    Key? key,
    required this.utilServices,
    required this.orderItem,
  }) : super(key: key);

  final UtilServices utilServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          //  QUANTIDADE E UNIDADE DO PEDIDO
          Text('${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),

          //NOME DO PEDIDO
          Expanded(child: Text(orderItem.item.itemName)),

          //PREÇO DO PEDIDO
          Text(utilServices.priceToCurrency(orderItem.totalPrice())),

        ],
      ),
    );
  }
}

