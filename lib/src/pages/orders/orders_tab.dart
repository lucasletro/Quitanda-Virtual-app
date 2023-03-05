import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;

import 'components/order_tile.dart';

//CLASSE RESPONSAVEL PELA TELA DE PEDIDOS

class OrdersTab extends StatelessWidget {
  const OrdersTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold( //#1

      appBar: AppBar( //#2
        title: const Text("Pedidos"),
      ),

      //visualizaçao vertical com rolagem
      body: ListView.separated( //#3
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(), //rolagem

        separatorBuilder: (_, index){ //separador
          //vamos retornar um widget q vai causar espaçamento na tela
          //entre um orderTile e outro.
          return const SizedBox(
            height: 10,
          );
        },

        //quais itens vamos apresentar na tela
        itemBuilder: (_, index){
          //aqui vamos retornar o tile de pedido
          return OrderTile(
              order: appData.orders[index],
          );
        },

        //quantos itens vamos apresentar na tela
        itemCount: appData.orders.length,

      ),

    );
  }
}
